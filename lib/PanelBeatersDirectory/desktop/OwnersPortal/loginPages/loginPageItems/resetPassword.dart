import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/ui/blackIconButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/ui/longOrangeButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/ui/passwordTextField.dart';

class ResetPasswordFirstLogin extends StatefulWidget {
  final Function(int) changePageIndex;
  final String emailAddress;
  const ResetPasswordFirstLogin(
      {super.key, required this.changePageIndex, required this.emailAddress});

  @override
  State<ResetPasswordFirstLogin> createState() =>
      _ResetPasswordFirstLoginState();
}

class _ResetPasswordFirstLoginState extends State<ResetPasswordFirstLogin> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  bool _isLoading = false;
  bool showSuccess = false;

  String? customPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }

    return null;
  }

  Future<void> _resetPassword() async {
    if (_formKey.currentState!.validate()) {
      if (_passwordController.text != _confirmPasswordController.text) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Passwords do not match.")),
        );
        return;
      }

      setState(() {
        _isLoading = true;
      });

      try {
        // Sign in the user with email and old password to re-authenticate
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: widget.emailAddress,
          password: 'tempPass123',
        );

        User? user = userCredential.user;
        if (user != null) {
          // Update password to the new password
          await user.updatePassword(_confirmPasswordController.text.trim());
          await _auth
              .signOut(); // Optional: Sign out the user after password change

          await _firestore
              .collection('listing_members')
              .where('authId', isEqualTo: user.uid)
              .get()
              .then((querySnapshot) {
            for (var doc in querySnapshot.docs) {
              doc.reference.update({'loggedIn': true});
            }
          });

          setState(() {
            showSuccess = true;
          });
        }
      } on FirebaseAuthException catch (e) {
        // Handle specific errors
        String message = 'An error occurred, please try again.';
        if (e.code == 'wrong-password') {
          message = 'The old password is incorrect.';
        } else if (e.code == 'user-not-found') {
          message = 'User not found with this email.';
        }
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(message)));
      } catch (e) {
        // Handle generic errors
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.toString())));
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;

    return Column(children: [
      SizedBox(
        height: heightDevice / 50,
      ),
      Text(
        'Set up your new password',
        textAlign: TextAlign.center,
        style: widthDevice < 1500
            ? TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontFamily: 'ralewaybold',
              )
            : TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontFamily: 'ralewaybold',
              ),
      ),
      SizedBox(
        height: 10,
      ),
      Text('Please use a strong password that contains at least 8 characters',
          textAlign: TextAlign.center,
          style: widthDevice < 1500
              ? TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'raleway',
                  height: 1.3,
                )
              : TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: 'raleway',
                  height: 1.3,
                )),
      SizedBox(
        height: heightDevice / 20,
      ),
      Form(
        key: _formKey,
        child: Column(
          children: [
            PasswordField(
              hintText: 'Enter Password',
              keyText: 'Password',
              controller: _passwordController,
              validator: (value) => customPasswordValidator(value),
              widthContainer:
                  widthDevice < 1500 ? widthDevice * 0.30 : widthDevice * 0.24,
            ),
            const SizedBox(
              height: 20,
            ),
            PasswordField(
              hintText: 'Confirm Password',
              keyText: 'Password',
              controller: _confirmPasswordController,
              validator: (value) => customPasswordValidator(value),
              widthContainer:
                  widthDevice < 1500 ? widthDevice * 0.30 : widthDevice * 0.24,
            ),
            SizedBox(
              height: 10,
            ),
            Visibility(
              visible: showSuccess,
              child: BlackIconButton(
                  backgroundColor1: Colors.black,
                  circleColor1: Colors.green,
                  iconColor1: Colors.white,
                  text1: 'Password has been updated. Click here to login.',
                  textColor1: Colors.white,
                  icon: Icons.check_circle_outline,
                  onPress: () {
                    widget.changePageIndex(0);
                  }),
            ),
            SizedBox(
              height: 10,
            ),
            LongOrangeButton(
                onPressed: () => _resetPassword(),
                buttonText: _isLoading
                    ? const SizedBox(
                        height: 24,
                        width: 24,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.0,
                          color: Colors.white,
                        ),
                      )
                    : 'SUBMIT'),
            SizedBox(
              height: heightDevice < 710 ? 15 : 30,
            ),
          ],
        ),
      )
    ]);
  }
}
