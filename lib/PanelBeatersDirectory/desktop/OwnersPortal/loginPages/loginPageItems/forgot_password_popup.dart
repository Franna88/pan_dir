import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/components/myutility.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/ProfileComp/buttons/AddButton.dart';

class ForgotPasswordPopup extends StatefulWidget {
  const ForgotPasswordPopup({super.key});

  @override
  State<ForgotPasswordPopup> createState() => _ForgotPasswordPopupState();
}

class _ForgotPasswordPopupState extends State<ForgotPasswordPopup> {
  final TextEditingController _emailController = TextEditingController();
  bool isResetLinkSent = false; // Variable to toggle visibility

  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    var heightDevice = MediaQuery.of(context).size.height;
    return Container(
      height: MyUtility(context).height * 0.4,
      width: MyUtility(context).width * 0.4,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 217, 217, 212),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: SizedBox(
          width: MyUtility(context).width * 0.35,
          child: isResetLinkSent
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [Color(0xFFFFA726), Color(0xFFFF7043)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    ),
                    const Text(
                      'Link Sent! ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontFamily: 'ralewaybold',
                      ),
                    ),
                    SizedBox(
                      width: MyUtility(context).width * 0.3,
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Please check your inbox ',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: 'raleway',
                              ),
                            ),
                            TextSpan(
                              text: 'admin@actionpanel.co.za',
                              style: TextStyle(
                                color: Color(0xFFFF8728),
                                fontSize: 14,
                                fontFamily: 'raleway',
                              ),
                            ),
                            TextSpan(
                              text: ' for further instructions',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: 'raleway',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.01),
                      child: const Divider(color: Colors.grey),
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Unsure what to do? ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'raleway',
                          ),
                        ),
                        Text(
                          'We can help',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'ralewaybold',
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      'Password Reset ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontFamily: 'ralewaybold',
                      ),
                    ),
                    const Text(
                      'Need to reset your password? No problem! Please enter the email you used to sign up for our service.',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'raleway',
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Email',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: heightDevice < 710 ? 16 : 18,
                                  fontFamily: 'raleway',
                                ),
                              ),
                              const TextSpan(
                                text: ' *',
                                style: TextStyle(
                                  color: Color(0xFFEF9040),
                                  fontSize: 20,
                                  fontFamily: 'raleway',
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: heightDevice < 710 ? 3 : 5,
                        ),
                        Container(
                          width: widthDevice * 0.30,
                          height: heightDevice < 710 ? 35 : 43,
                          child: TextFormField(
                            controller: _emailController,
                            style: TextStyle(
                              fontSize: heightDevice < 710 ? 15 : 17,
                              fontFamily: 'raleway',
                            ),
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Enter your email',
                              hintStyle: const TextStyle(color: Colors.black),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 15.0),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              errorStyle:
                                  const TextStyle(color: Color(0xFFEF9040)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    AddButton(
                      text: 'Send Reset Link',
                      width: MyUtility(context).width * 0.18,
                      textColor: Colors.black,
                      onPressed: () {
                        setState(() {
                          isResetLinkSent = true;
                        });
                      },
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
