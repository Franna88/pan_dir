import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/ProfileComp/buttons/AddButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/ManageUsers/ManageUserComp/ManageUserInfo.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/ManageUsers/userDetails.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/NewUserPopup/NewUserPopup.dart';
import 'package:webdirectories/PanelBeatersDirectory/emails/welcomeOwnersPortal/sendWelcomeOwnersPanel.dart';
import 'package:webdirectories/PanelBeatersDirectory/models/storedUser.dart';
import 'package:webdirectories/PanelBeatersDirectory/models/users.dart';
import 'package:webdirectories/PanelBeatersDirectory/utils/loginUtils.dart';
import 'package:webdirectories/myutility.dart';

import '../../components/descriptionDialog.dart';

class ManageUsers extends StatefulWidget {
  bool normalUser;
  ManageUsers({super.key, required this.normalUser});

  @override
  State<ManageUsers> createState() => _ManageUsersState();
}

class _ManageUsersState extends State<ManageUsers> {
  final _firestore = FirebaseFirestore.instance;
  List<Map<String, dynamic>> usersData = []; // Store user and documentId
  final UserDetailsController _controller = UserDetailsController();
  bool _isLoading = true;
  final ScrollController _scrollController = ScrollController();
  final auth = FirebaseAuth.instance;

  @override
  void initState() {
    _fetchUserData();
    super.initState();
  }

  //Dialog for notification popup
  Future descriptionDialog(description) => showDialog(
      context: context,
      builder: (context) {
        return Dialog(
            child: DescriptionDialog(
          description: description,
        ));
      });

  //Send link to reset password
  sendResetPasswordLink(email) {
    auth
        .sendPasswordResetEmail(email: email)
        .whenComplete(() => descriptionDialog("Reset link sent"));
  }

  // Fetch user data from Firestore and handle errors
  void _fetchUserData() async {
    print('loading users...');
    print('normal user: ${widget.normalUser}');

    List<Map<String, dynamic>> users = [];
    var listingId = "";
    try {
      StoredUser? user = await getUserInfo();

      if (user == null) {
        print('User not found');
        setState(() {
          _isLoading = false;
        });
        return;
      }
      QuerySnapshot<Map<String, dynamic>> data = await _firestore
          .collection('listing_allocation')
          .where('listingsId', isEqualTo: int.parse(user.id))
          .get();

      print(user.id);
      QuerySnapshot<Map<String, dynamic>> listMemberIds = await _firestore
          .collection('listing_allocation')
          .where('listingsId', isEqualTo: data.docs[0]['listingsId'])
          .get();

      print(listMemberIds.docs.length);
      if (listMemberIds.docs.isNotEmpty) {
        print('loading user123');
        for (var i = 0; i < listMemberIds.docs.length; i++) {
          print(listMemberIds.docs[i]['listingMembersId']);
          final data = await _firestore
              .collection('listing_members')
              .where('listingMembersId',
                  isEqualTo: listMemberIds.docs[i]['listingMembersId'])
              .get();

          if (data.docs.isNotEmpty) {
            var doc = data.docs[0];

            //  users.add(data.docs[0].data());

            /*  Timestamp? timestamp =
                listMemberIds.docs[i]['dateAdded'] as Timestamp?;
            DateTime dateAdded =
                timestamp != null ? timestamp.toDate() : DateTime.now(); */

// Safely split fullname into firstName and surname
            String fullName = doc.data()['fullname']?.toString() ?? '';
            List<String> nameParts =
                fullName.split(' '); // Split full name by spaces
            String firstName = nameParts.isNotEmpty
                ? nameParts[0]
                : ''; // First part as firstName
            String surname = nameParts.length > 1
                ? nameParts.sublist(1).join(' ')
                : ''; // Combine remaining parts as surname

            // Optional fields
            String? mobile = doc.data()['mobile'];
            String displayOnProfile =
                doc.data()['displayOnProfile']?.toString() ?? 'false';

            UserModel userData = UserModel(
                dateAdded: DateTime.now(),
                firstName: firstName,
                surname: surname,
                email: doc['email']?.toString() ?? '',
                status: doc['status']?.toString() ?? 'Active',
                cell: doc['usercell'],
                id: doc.id);

            // Store user data and documentId
            users.add({
              'user': userData,
              'documentId': doc.id,
              'mobile': mobile,
              'displayOnProfile': displayOnProfile,
            });
          }
        }
        setState(() {
          _isLoading = false;
          usersData = users;
        });
      }

      /*    QuerySnapshot<Map<String, dynamic>> usersSnapshot = await _firestore
          .collection('listing_members')
          .where('listingMembersId', isEqualTo: user.id)
          .get();

      List<Map<String, dynamic>> users = [];

      if (usersSnapshot.docs.isNotEmpty) {
        print('loading users... ${usersSnapshot.docs.length} users found');
        for (var doc in usersSnapshot.docs) {
          // Handle 'dateAdded' as Timestamp, with null check and fallback
          Timestamp? timestamp = doc.data()['dateAdded'] as Timestamp?;
          DateTime dateAdded =
              timestamp != null ? timestamp.toDate() : DateTime.now();

          // Safely split fullname into firstName and surname
          String fullName = doc.data()['fullname']?.toString() ?? '';
          List<String> nameParts =
              fullName.split(' '); // Split full name by spaces
          String firstName = nameParts.isNotEmpty
              ? nameParts[0]
              : ''; // First part as firstName
          String surname = nameParts.length > 1
              ? nameParts.sublist(1).join(' ')
              : ''; // Combine remaining parts as surname

          // Optional fields
          String? mobile = doc.data()['mobile'];
          String displayOnProfile =
              doc.data()['displayOnProfile']?.toString() ?? 'false';

          UserModel userData = UserModel(
              dateAdded: dateAdded,
              firstName: firstName,
              surname: surname,
              email: doc.data()['email']?.toString() ?? '',
              status: doc.data()['status']?.toString() ?? 'Active',
              cell: doc.data()['usercell'],
              id: doc.id);

          // Store user data and documentId
          users.add({
            'user': userData,
            'documentId': doc.id,
            'mobile': mobile,
            'displayOnProfile': displayOnProfile,
          });
        }

        setState(() {
          _isLoading = false;
          usersData = users;
        });
      } else {
        setState(() {
          _isLoading = false;
        });
        print('No users found');
      }*/
    } catch (e) {
      print('Error fetching user data: $e');
      if (!mounted) return;
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error fetching user data')));
    }
  }

//add user to listing allocation DB
  addUserToListingAllocation(listingMembersId, listingsId, membersId) async {
    var data = {
      "allocationId": "",
      "dateAdded": DateTime.now(),
      "listingMembersId": listingMembersId,
      "listingsId": listingsId,
      "membersId": membersId,
    };
    var myNewDoc = await FirebaseFirestore.instance
        .collection("listing_allocation")
        .add(data);

    await FirebaseFirestore.instance
        .collection("listing_allocation")
        .doc(myNewDoc.id)
        .update({"allocationId": myNewDoc.id}).whenComplete(
            () => descriptionDialog("New User Created"));
  }

  createUser(dummy, dummy2) async {
    try {
      StoredUser? user = await getUserInfo();

      //  print(widget.controller.getValues());
      //create User
      UserCredential userDocRef = await auth.createUserWithEmailAndPassword(
          email: _controller.email.text, password: _controller.password.text);
      _controller.authId.text = userDocRef.user!.uid;

      var myNewDoc = await FirebaseFirestore.instance
          .collection("listing_members")
          .doc(userDocRef.user!.uid)
          .set(_controller.getValues(userDocRef.user!.uid));

      await addUserToListingAllocation(
        userDocRef.user!.uid,
        user!.id, //listing id
        userDocRef.user!.uid,
      );

      // send welcome email
      await sendWelcomeOwnersPortalEmail(
          userName: _controller.fullname.text,
          userEmail: _controller.email.text);
    } catch (e) {
      print('Error fetching listing data: $e');
      setState(() {
        //  _isLoading = false;
      });
    }
    _fetchUserData();
    Navigator.pop(context);
  }

  editUser(status, id) async {
    StoredUser? user = await getUserInfo();
    var data = _controller.getValues(user!.id);
    _controller.authId.text = id;
    data['userActive'] = status;
    if (status == 1) {
      data['status'] = "Active";
    } else {
      data['status'] = "InActive";
    }

    print(data);
    await FirebaseFirestore.instance
        .collection("listing_members")
        .doc(id)
        .update(data)
        .whenComplete(() => descriptionDialog("Details Updated")); /* */
    _fetchUserData();
    Navigator.pop(context); /**/
  }

  // Handle editing a user
  void _editUser(String documentId, Map<String, String> updatedUserData) {
    _firestore.collection('listing_members').doc(documentId).update({
      'firstName': updatedUserData['fullName']?.split(' ')[0],
      'surname': updatedUserData['fullName']?.split(' ')[1],
      'email': updatedUserData['email'],
      'mobile': updatedUserData['mobile'],
      // 'displayOnProfile': updatedUserData['displayOnProfile'],
    }).then((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('User updated successfully')),
      );
      _fetchUserData(); // Refresh the user list after update
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error updating user: $error')),
      );
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MyUtility(context).width,
        height: MyUtility(context).height,
        decoration: const BoxDecoration(
          color: Color(0xFF171616),
        ),
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  width: MyUtility(context).width * 0.9,
                  height: MyUtility(context).height * 0.85,
                  decoration: ShapeDecoration(
                    gradient: LinearGradient(
                      begin: const Alignment(0.57, -0.82),
                      end: const Alignment(-0.57, 0.82),
                      colors: [
                        const Color(0x19777777),
                        Colors.white.withOpacity(0.4),
                      ],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    shadows: const [
                      BoxShadow(
                        color: Color(0xBF000000),
                        blurRadius: 24,
                        offset: Offset(0, 4),
                        spreadRadius: -1,
                      )
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        // Header section
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                AddButton(
                                  text: 'Add New User',
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      barrierDismissible: true,
                                      barrierColor:
                                          Colors.black.withOpacity(0.5),
                                      builder: (BuildContext context) {
                                        return Dialog(
                                          backgroundColor: Colors.transparent,
                                          insetPadding:
                                              const EdgeInsets.all(10),
                                          child: NewUserPopup(
                                            onSubmit: createUser,
                                            fullNameController:
                                                _controller.fullname,
                                            emailController: _controller.email,
                                            mobileController:
                                                _controller.usercell,
                                            passwordController:
                                                _controller.password,
                                            confirmPasswordController:
                                                _controller.confirmPassword,
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 10, bottom: 10),
                              child: Text(
                                'Manage Users',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.6,
                                  fontFamily: 'ralewaybold',
                                ),
                              ),
                            ),
                            const Text(
                              'Please fill out the following form to create a new user account. Once completed, we will send a welcome email with login instructions to the nominated email address',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.73,
                                fontFamily: 'raleway',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),

                        // User list table header
                        Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 10),
                          child: Container(
                            padding: const EdgeInsets.only(left: 8, right: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    'Date Reg',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.6,
                                      fontFamily: 'ralewaybold',
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    'Email',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.6,
                                      fontFamily: 'ralewaybold',
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    'Full Name',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.6,
                                      fontFamily: 'ralewaybold',
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    'Status',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.6,
                                      fontFamily: 'ralewaybold',
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    'View',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.6,
                                      fontFamily: 'ralewaybold',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        // User list with scroll bar
                        Expanded(
                          child: _isLoading
                              ? const Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.black,
                                  ),
                                )
                              : usersData.isEmpty
                                  ? const Center(
                                      child: Text(
                                        'No users found',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    )
                                  : DraggableScrollbar.rrect(
                                      controller: _scrollController,
                                      backgroundColor: const Color(0x7F9E9E9F),
                                      alwaysVisibleScrollThumb: true,
                                      child: ListView.builder(
                                        controller: _scrollController,
                                        itemCount: usersData.length,
                                        itemBuilder: (context, index) {
                                          if (index < usersData.length) {
                                            var userMap = usersData[index];
                                            UserModel user = userMap['user'];
                                            String documentId =
                                                userMap['documentId'];

                                            return ManageUserInfo(
                                              year: user.dateAdded.year
                                                  .toString(),
                                              month: user.dateAdded.month
                                                  .toString(),
                                              day:
                                                  user.dateAdded.day.toString(),
                                              email: user.email,
                                              fullName:
                                                  '${user.firstName} ${user.surname}',
                                              status: user.status,
                                              isEven: index % 2 == 0,
                                              pressEdit: () {
                                                showDialog(
                                                  context: context,
                                                  barrierDismissible: true,
                                                  barrierColor: Colors.black
                                                      .withOpacity(0.5),
                                                  builder:
                                                      (BuildContext context) {
                                                    return Dialog(
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      insetPadding:
                                                          const EdgeInsets.all(
                                                              10),
                                                      child: NewUserPopup(
                                                        sendResetLink:
                                                            sendResetPasswordLink,
                                                        onSubmit: editUser,
                                                        editUser: user,
                                                        fullNameController:
                                                            _controller
                                                                .fullname,
                                                        emailController:
                                                            _controller.email,
                                                        mobileController:
                                                            _controller
                                                                .usercell,
                                                        passwordController:
                                                            _controller
                                                                .password,
                                                        confirmPasswordController:
                                                            _controller
                                                                .confirmPassword,
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                              pressDelete: () {},
                                              showEdit: widget.normalUser,
                                            );
                                          }
                                          return const SizedBox.shrink();
                                        },
                                      ),
                                    ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
