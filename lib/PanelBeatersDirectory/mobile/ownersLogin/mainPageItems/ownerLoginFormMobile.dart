import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminPortal.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/ownersLogin/ui/longOrangeMobileButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/ownersLogin/ui/mobileTextFields.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/ownersLogin/ui/passwordTextFieldMobile.dart';

class Ownerloginformmobile extends StatefulWidget {
  const Ownerloginformmobile({super.key});

  @override
  State<Ownerloginformmobile> createState() => _OwnerloginformmobileState();
}

class _OwnerloginformmobileState extends State<Ownerloginformmobile> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  Future<void> _login(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      try {
        setState(() {
          _isLoading = true;
        });
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
        print("User signed in: ${userCredential.user?.email}");

        if (!mounted) return; // Ensure the widget is still mounted
        setState(() {
          _isLoading = false;
        });
        // Navigate to the next screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => AdminPortal(
                    normalUser: false,
                    listingsId: '',
                  )), // Replace with your destination screen
        );
      } on FirebaseAuthMultiFactorException catch (e) {
        print('Incorrect credentials. Please try again.');
      } catch (e) {
        print(e);
      }
    }
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

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return Form(
      key: _formKey,
      child: Column(
        children: [
          MobileTextFields(
              hintText: 'e.g., mailto:admin@actionpanel.co.za',
              keyText: 'Email',
              controller: _emailController,
              validator: customEmailValidator,
              widthContainer: widthDevice * 0.70),
          PasswordTextFieldMobile(
              hintText: 'Enter Password',
              keyText: 'Password',
              controller: _passwordController,
              validator: customPasswordValidator,
              widthContainer: widthDevice * 0.70),
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 16,
              ),
              Text(
                'Forgot Password ?',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Color(0xFFEF9040),
                  fontSize: 14,
                  fontFamily: 'raleway',
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          LongOrangeMobileButton(
            onPressed: () => _login(context),
            buttonText: 'Login',
            widthButton: widthDevice * 0.70,
            isLoading: _isLoading,
          ),
        ],
      ),
    );
  }
}
