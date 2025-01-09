import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:webdirectories/WebDirectories/Page7/GetinTouch/GetinTouchComponents/TextFormField.dart';
import 'package:webdirectories/WebDirectories/Page3/OurStory/OurSotryComponents/OvalTextButton.dart';
import 'package:webdirectories/WebDirectories/Page7/GetinTouch/GetinTouchComponents/emailPopup.dart';
import 'package:webdirectories/myutility.dart';
import '../../../PanelBeatersDirectory/emails/getInTouch/sendGetInTouch.dart';

class GetinTouch extends StatefulWidget {
  const GetinTouch({super.key});

  @override
  State<GetinTouch> createState() => _GetinTouchState();
}

class _GetinTouchState extends State<GetinTouch> {
  bool _isChecked = false;
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();
  final details = TextEditingController();

  Future<void> showEmailPopup(String description) => showDialog(
        context: context,
        barrierColor: Colors
            .transparent, // Set the background behind the dialog to be transparent
        builder: (context) {
          return Emailpopup(
            description: description,
          );
        },
      );

  sendEmail() async {
    if (firstName.text == "" &&
        lastName.text == "" &&
        email.text == "" &&
        phone.text == "" &&
        details.text == "") {
      return showEmailPopup("Some Fields are required");
    }

    if (!_isChecked) {
      return showEmailPopup("I'm not a robot validation required");
    }

    await sendGetInTouch(
        message: details.text,
        email: email.text,
        firstName: firstName.text,
        lastName: lastName.text,
        phone: phone.text);
    await showEmailPopup("Thank you, your email has been sent.");
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MyUtility(context).width / 1.15,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Get in touch",
                  style: TextStyle(
                      fontSize: 46,
                      fontFamily: 'ralewaysemi',
                      color: Color(0xFF0E1013)),
                ),
                SizedBox(
                  width: MyUtility(context).width / 2.6,
                  child: const Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text:
                              "Have questions about our directories or your profile? We're here to help! Reach out to our team via email at ",
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'raleway',
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: "info@webdirectories.co.za",
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'ralewaysemi',
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text:
                              " or fill out the contact form. We look forward to connecting with you!",
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'raleway',
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MyUtility(context).height * 0.05,
                ),
                SizedBox(
                  width: MyUtility(context).width / 2.2,
                  height: MyUtility(context).height * 0.15,
                  child: Row(
                    children: [
                      SizedBox(
                          width: 60,
                          height: 60,
                          child: SvgPicture.asset('images/buisnesshours.svg')),
                      SizedBox(
                        width: MyUtility(context).width * 0.015,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Business Hours",
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'ralewaysemi',
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "Mon-Fri | 08:00AM – 16:00PM\nSat-Sun & Public Holidays | Closed",
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'raleway',
                              color: Colors.black,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: MyUtility(context).width / 2.2,
                  height: MyUtility(context).height * 0.15,
                  child: Row(
                    children: [
                      SizedBox(
                          width: 60,
                          height: 60,
                          child: SvgPicture.asset('images/contactus.svg')),
                      SizedBox(
                        width: MyUtility(context).width * 0.015,
                      ),
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Contact Us",
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'ralewaysemi',
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "(+27) 12 403 1020\ninfo@webdirectories.co.za",
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'raleway',
                              color: Colors.black,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: MyUtility(context).width / 2.2,
                  height: MyUtility(context).height * 0.15,
                  child: Row(
                    children: [
                      SizedBox(
                          width: 60,
                          height: 60,
                          child: SvgPicture.asset('images/address.svg')),
                      SizedBox(
                        width: MyUtility(context).width * 0.015,
                      ),
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Address",
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'ralewaysemi',
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "63 Bokmakierie Street, Eden, George, 6529",
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'raleway',
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Column(
                children: [
                  SizedBox(
                    height: MyUtility(context).height * 0.1,
                  ),
                  Container(
                    width: MyUtility(context).width / 2.45,
                    height: MyUtility(context).height / 1.7,
                    decoration: BoxDecoration(
                        color: const Color(0xFFF4F4F4),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CustomTextFormField(
                                  text: 'First name *',
                                  controller: firstName,
                                ),
                                CustomTextFormField(
                                  text: 'Last name * ',
                                  controller: lastName,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CustomTextFormField(
                                  text: 'Email *',
                                  controller: email,
                                ),
                                CustomTextFormField(
                                  text: 'Phone *',
                                  controller: phone,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Message * ',
                                  style: TextStyle(
                                    fontFamily: 'raleway',
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  width: MyUtility(context).width * 0.4,
                                  child: TextFormField(
                                    controller: details,
                                    decoration: const InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xFFDFDFDF)),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xFFDFDFDF)),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: MyUtility(context).height * 0.025,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Container(
                              width: MyUtility(context).width * 0.16,
                              height: MyUtility(context).height * 0.07,
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                color: const Color(0xFFFAFAFA),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Checkbox(
                                        value: _isChecked,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            _isChecked = value ?? false;
                                          });
                                        },
                                      ),
                                      const Text(
                                        "I'm not a robot",
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),
                                  Image.asset(
                                    'images/notarobot1.png',
                                    height: 50,
                                    width: 35,
                                    fit: BoxFit.fill,
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MyUtility(context).height * 0.025,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, bottom: 5),
                            child: OvalTextButton(
                                text: 'Submit Now ',
                                onPressed: () {
                                  sendEmail();
                                }),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, top: 15),
                            child: Text(
                              '*Please fill in required fields',
                              style: TextStyle(
                                fontFamily: 'raleway',
                                fontSize: 13,
                                color:
                                    const Color(0xFF000000).withOpacity(0.35),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
