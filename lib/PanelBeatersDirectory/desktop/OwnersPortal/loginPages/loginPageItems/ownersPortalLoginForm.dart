import 'dart:convert';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminPortal.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/loginPageItems/forgot_password_popup.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/ui/longOrangeButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/ui/mediumTextBox.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/ui/passwordTextField.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:webdirectories/PanelBeatersDirectory/emails/otpVerification/sendOtpVerification.dart';
import 'package:webdirectories/PanelBeatersDirectory/models/storedUser.dart';
import 'package:webdirectories/routes/routerNames.dart';

import '../../../../../SuperAdmin/superAdmin.dart';

class OwnersPortalLoginForm extends StatefulWidget {
  final Function(int) changePageIndex;
  final Function(String) updateEmail;
  final bool initialValue;

  const OwnersPortalLoginForm({
    super.key,
    required this.changePageIndex,
    required this.updateEmail,
    this.initialValue = false,
  });

  @override
  State<OwnersPortalLoginForm> createState() => _OwnersPortalLoginFormState();
}

class _OwnersPortalLoginFormState extends State<OwnersPortalLoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  bool _isLoading = false;
  bool showPassword = false;
  final storage = FlutterSecureStorage();

  Future<void> storeUserInfo(StoredUser user) async {
    await storage.write(
        key: 'user',
        value: jsonEncode({
          'id': user.id,
          'member_id': user.memberId,
          'full_name': user.fullName,
          'membership_type': user.membershipType,
          'email': user.email,
          'cell': user.cell
        }));
  }

  Future<bool> checkUserAdmin(
      QueryDocumentSnapshot<Map<String, dynamic>> user) async {
    if (user.data()['admin'] != null) {
      context.goNamed(Routernames.panelbeatersAdminPortal);
      return true;
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => Material(child: SuperAdmin()),
      //   ),
      // );
    } else {
      return false;
    }
  }

  Future<void> _login(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      print('logging in...');
      setState(() {
        _isLoading = true;
      });

      try {
        final userCredential = await _authenticateUser();
        final user = userCredential.user;

        if (user == null) {
          _showError(context, 'User data not found.');
          return;
        }

        final userDoc = await _fetchUserDocument(user.uid);
        if (userDoc == null) {
          _showError(context, 'User data not found.');
          return;
        }

        await _handleUserLogin(context, user, userDoc);
      } on FirebaseAuthException {
        _showError(context, 'Incorrect credentials. Please try again.');
      } catch (e) {
        print(e);
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Future<UserCredential> _authenticateUser() {
    return _auth.signInWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );
  }

  Future<QueryDocumentSnapshot<Map<String, dynamic>>?> _fetchUserDocument(
      String userId) async {
    final snapshot = await _firestore
        .collection('listing_members')
        .where('authId', isEqualTo: userId)
        .limit(1)
        .get();

    return snapshot.docs.isNotEmpty ? snapshot.docs.first : null;
  }

  Future<void> _generateAndSendOTP(String userId) async {
    String otp = Random().nextInt(999999).toString().padLeft(6, '0');

    bool sent = await sendOtpEmail(
        otp: otp, email: (_emailController.text.trim()).toLowerCase());

    if (sent) {
      await _firestore
          .collection('listing_members')
          .doc(userId)
          .update({'secKey': otp});
    } else {
      _showError(context, 'Failed to send OTP. Please try again.');
    }
  }

  Future<void> _handleUserLogin(BuildContext context, User user,
      QueryDocumentSnapshot<Map<String, dynamic>> userDoc) async {
    bool isAdmin = await checkUserAdmin(userDoc);
    if (isAdmin) {
      return;
    }
    final userData = userDoc.data();
    int id = userData['listingMembersId'];
    QueryDocumentSnapshot<Map<String, dynamic>>? listingAllocationSnapshot =
        await _fetchListingAllocation(id);
    // if (id is int) {
    //   listingAllocationSnapshot = await _fetchListingAllocation(id);
    // } else {
    //   listingAllocationSnapshot = await _fetchListingAllocationString(id);
    // }

    if (listingAllocationSnapshot == null) {
      _showError(context,
          'Could not find a listing linked to this user. Please contact support.');
      return;
    }

    QuerySnapshot<Map<String, dynamic>> listingsSnapshot = await _firestore
        .collection('listings')
        .where('listingsId',
            isEqualTo: listingAllocationSnapshot.data()['listingsId'])
        .limit(1)
        .get();

    if (listingsSnapshot.docs.isEmpty) {
      _showError(context,
          'Could not find a listing linked to this user. Please contact support.');
      return;
    }

    if (listingsSnapshot.docs.first.data()['pendingApproval'] == 1) {
      _showError(context,
          'Your profile is pending approval. Thank you for your patience');
      return;
    }

    if (listingsSnapshot.docs.first.data()['membershipType'] == "StarterM" ||
        listingsSnapshot.docs.first.data()['membershipType'] == "StarterA") {
      _showError(context,
          'Your profile does not have access to the owners portal. Please upgrade your plan');
      return;
    }

    if (userData['loggedIn'] == true) {
      await _storeUserInfo(user, userData, listingAllocationSnapshot,
          listingsSnapshot.docs.first);
      _navigateToAdminPortal(context,
          normalUser: true,
          listingsId:
              listingAllocationSnapshot.data()['listingsId'].toString());
    } else {
      // OTP logic for resetting password
      await _storeUserInfo(user, userData, listingAllocationSnapshot,
          listingsSnapshot.docs.first);
      widget.updateEmail(userData['email']);
      _generateAndSendOTP(userDoc.id);
      widget.changePageIndex(7);
    }
  }

  Future<void> _checkEmailExists(String email) async {
    setState(() {
      _isLoading = true;
    });
    QuerySnapshot<Map<String, dynamic>> userDoc = await _firestore
        .collection('listing_members')
        .where('email', isEqualTo: email)
        .limit(1)
        .get();

    if (userDoc.docs.isNotEmpty) {
      // user has already logged in before
      if (userDoc.docs[0].data()['loggedIn'] == true) {
        setState(() {
          showPassword = true;
          _isLoading = false;
        });
      }
      // user has not logged in before
      else {
        try {
          final userData = userDoc.docs.first.data();
          final id = userData['listingMembersId'];
          QueryDocumentSnapshot<Map<String, dynamic>>?
              listingAllocationSnapshot = await _fetchListingAllocation(id);
          // if (id is int) {
          //   listingAllocationSnapshot = await _fetchListingAllocation(id);
          // } else {
          //   listingAllocationSnapshot = await _fetchListingAllocationString(id);
          // }

          if (listingAllocationSnapshot == null) {
            _showError(context,
                'Could not find a listing linked to this user. Please contact support.');
            return;
          }

          // OTP logic for resetting password
          await storeUserInfo(StoredUser(
            id: listingAllocationSnapshot.data()['listingsId'].toString(),
            membershipType: listingAllocationSnapshot.data()['membershipType'],
            email: userData['email'],
            fullName: userData['fullname'],
            memberId: userData['listingMembersId'].toString(),
            cell: userData['usercell'],
          ));
          widget.updateEmail(userData['email']);
          await _generateAndSendOTP(userDoc.docs.first.id);
          widget.changePageIndex(7);
        } catch (e) {
          setState(() {
            _isLoading = false;
          });
          _showError(context, 'Something went wrong. Please try again.');
        }
      }
    }
  }

  Future<QueryDocumentSnapshot<Map<String, dynamic>>?> _fetchListingAllocation(
      int memberId) async {
    print('memberId: $memberId');
    QuerySnapshot<Map<String, dynamic>> snapshot = await _firestore
        .collection('listing_allocation')
        .where('listingMembersId', isEqualTo: memberId)
        .limit(1)
        .get();
    print('snapshot: ${snapshot.docs.isNotEmpty}');
    return snapshot.docs.isNotEmpty ? snapshot.docs.first : null;
  }

  // Future<QueryDocumentSnapshot<Map<String, dynamic>>?>
  //     _fetchListingAllocationString(String memberId) async {
  //   final snapshot = await _firestore
  //       .collection('listing_allocation')
  //       .where('listingMembersId', isEqualTo: memberId)
  //       .limit(1)
  //       .get();

  //   return snapshot.docs.isNotEmpty ? snapshot.docs.first : null;
  // }

  Future<void> _storeUserInfo(
      User user,
      Map<String, dynamic> userData,
      QueryDocumentSnapshot<Map<String, dynamic>> listingAllocationSnapshot,
      QueryDocumentSnapshot<Map<String, dynamic>> listingSnapshot) async {
    print(listingSnapshot.data()['membershipType']);
    await storeUserInfo(StoredUser(
      id: listingAllocationSnapshot.data()['listingsId'].toString(),
      membershipType: listingSnapshot.data()['membershipType'],
      email: user.email!,
      fullName: userData['fullname'],
      memberId: userData['listingMembersId'].toString(),
      cell: userData['usercell'],
    ));
  }

  void _navigateToAdminPortal(BuildContext context,
      {required bool normalUser, required String listingsId}) {
    if (!mounted) return;
    context.goNamed(
      Routernames.panelbeatersOwnersPortal,
      extra: {"listingsId": listingsId, "normalUser": normalUser},
    );
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) =>
    //         AdminPortal(normalUser: normalUser, listingsId: listingsId),
    //   ),
    // );
  }

  void _showError(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  Future<void> _forgotPassword(BuildContext context) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    String email = _emailController.text.trim();

    if (!mounted) return;

    if (email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter your email")),
      );
      return;
    }

    try {
      await _auth.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text(
                "Password reset email sent. If you used a valid email address, you will receive an email shortly.")),
      );
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text("Error: Unable to send password reset email")),
      );
    }
  }

  String? customEmailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? customPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    return null;
  }

  late bool _isChecked;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.initialValue;
  }

  void _toggleCheckbox(bool? value) {
    setState(() {
      _isChecked = value ?? false;
    });
  }

  Future openForgotPasswordPopup() => showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: ForgotPasswordPopup(),
        );
      });

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return Form(
      key: _formKey,
      child: Column(
        children: [
          MediumTextBox(
            keyText: 'Email',
            hintText: 'e.g.,admin@actionpanel.co.za',
            controller: _emailController,
            validator: (value) => customEmailValidator(value),
          ),
          PasswordField(
            hintText: 'Enter Password',
            keyText: 'Password',
            controller: _passwordController,
            validator: (value) => customPasswordValidator(value),
            widthContainer:
                widthDevice < 1500 ? widthDevice * 0.30 : widthDevice * 0.24,
          ),
          TextButton(
            onPressed: () => _forgotPassword(context),
            child: SizedBox(
              //width: 450,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: widthDevice * 0.02),
                      child: Checkbox(
                        fillColor: MaterialStateProperty.all(Colors.white),
                        side: BorderSide(color: Colors.white),
                        checkColor: Color(0xFFEF9040),
                        value: _isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            _isChecked = value ?? false;
                          });
                        },
                      ),
                    ),
                    const Text(
                      "Remember Me",
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'ralewaymedium',
                          color: Colors.white),
                    ),
                    Spacer(),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: widthDevice * 0.02),
                        child: InkWell(
                          onTap: openForgotPasswordPopup,
                          child: Text(
                            'Forgot Password?',
                            textAlign: TextAlign.right,
                            style: widthDevice < 1500
                                ? const TextStyle(
                                    color: Color(0xFFEF9040),
                                    fontSize: 14,
                                    fontFamily: 'ralewaymedium',
                                  )
                                : const TextStyle(
                                    color: Color(0xFFEF9040),
                                    fontSize: 16,
                                    fontFamily: 'ralewaymedium',
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          LongOrangeButton(
              // onPressed: () => showPassword
              //     ? _login(context)
              //     : _checkEmailExists(_emailController.text.trim()),
              onPressed: () => _login(context),
              buttonText: _isLoading
                  ? const SizedBox(
                      height: 24,
                      width: 24,
                      child: CircularProgressIndicator(
                        strokeWidth: 2.0,
                        color: Colors.white,
                      ),
                    )
                  : 'Login'),
          SizedBox(
            height: heightDevice < 710 ? 15 : 30,
          ),
        ],
      ),
    );
  }
}
