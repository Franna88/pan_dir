import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/components/descriptionDialog.dart';
import 'package:webdirectories/PanelBeatersDirectory/emails/getInTouch/sendGetInTouch.dart';
import 'package:webdirectories/WebDirectories/Mobile/MobilePage6/MessageUsMobile/MessageUsMobimeComponent/ImNotaRobot.dart';
import 'package:webdirectories/WebDirectories/Mobile/MobilePage6/MessageUsMobile/MessageUsMobimeComponent/MessageUsTextFieldMobile.dart';
import 'package:webdirectories/WebDirectories/Page3/OurStory/OurSotryComponents/OvalTextButton.dart';
import 'package:webdirectories/WebDirectories/Page7/GetinTouch/GetinTouchComponents/TextFormField.dart';
import 'package:webdirectories/myutility.dart';

class MobileContactForm extends StatefulWidget {
  const MobileContactForm({super.key});

  @override
  State<MobileContactForm> createState() => _MobileContactFormState();
}

class _MobileContactFormState extends State<MobileContactForm> {
  bool _isChecked = false;
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final messageController = TextEditingController();

  Future descriptionDialog(description) => showDialog(
      context: context,
      builder: (context) {
        return Dialog(
            child: DescriptionDialog(
          description: description,
        ));
      });

  void _onChanged(bool value) {
    setState(() {
      _isChecked = value;
    });
  }

  sendEmail() async {
    if (firstNameController.text == "" &&
        lastNameController.text == "" &&
        emailController.text == "" &&
        phoneController.text == "" &&
        messageController.text == "") {
      return descriptionDialog("Some Fields are required");
    }

    if (_isChecked == false) {
      return descriptionDialog("Im not robot validation required");
    }

    await sendGetInTouch(
        message: messageController.text,
        email: emailController.text,
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        phone: phoneController.text);
    await descriptionDialog("Thank you ,your email has been sent.");
  }

  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    return SizedBox(
      width: MyUtility(context).width * 0.9,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Need some help?',
                  style: TextStyle(
                    color: Color(0xFFF19A41),
                    fontSize: 25,
                    fontFamily: 'raleway',
                    height: 1,
                  ),
                ),
                Text(
                  "Get in touch!",
                  style: TextStyle(
                      fontSize: widthDevice > 1600 ? 65 : 50,
                      fontFamily: 'ralewaysemi',
                      color: Colors.white),
                ),
                SizedBox(
                  width: MyUtility(context).width * 0.9,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text:
                              "Have questions about our directories or your profile? We're here to help! Reach out to our team via email at ",
                          style: TextStyle(
                            fontSize: widthDevice > 1600 ? 20 : 18,
                            fontFamily: 'raleway',
                            color: Colors.white,
                          ),
                        ),
                        TextSpan(
                          text: "info@webdirectories.co.za",
                          style: TextStyle(
                            fontSize: widthDevice > 1600 ? 20 : 18,
                            fontFamily: 'ralewaysemi',
                            color: Colors.white,
                          ),
                        ),
                        TextSpan(
                          text:
                              " or fill out the contact form. We look forward to connecting with you!",
                          style: TextStyle(
                            fontSize: widthDevice > 1600 ? 20 : 18,
                            fontFamily: 'raleway',
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: widthDevice < 1600
                      ? MyUtility(context).height * 0.03
                      : MyUtility(context).height / 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25),
                  child: SizedBox(
                    width: MyUtility(context).width * 0.88,
                    child: Row(
                      children: [
                        SizedBox(
                            width: widthDevice > 1600 ? 80 : 60,
                            height: widthDevice > 1600 ? 80 : 60,
                            child: SvgPicture.asset('images/panHours.svg')),
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
                                fontSize: widthDevice > 1600 ? 20 : 18,
                                fontFamily: 'ralewaysemi',
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "Mon-Fri | 08:00AM – 16:00PM\nSat-Sun & Public Holidays | Closed",
                              style: TextStyle(
                                fontSize: widthDevice > 1600 ? 18 : 16,
                                fontFamily: 'raleway',
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 25),
                  child: SizedBox(
                    child: Row(
                      children: [
                        SizedBox(
                            width: widthDevice > 1600 ? 80 : 60,
                            height: widthDevice > 1600 ? 80 : 60,
                            child: SvgPicture.asset('images/panContactUs.svg')),
                        SizedBox(
                          width: MyUtility(context).width * 0.015,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Contact Us",
                              style: TextStyle(
                                fontSize: widthDevice > 1600 ? 20 : 18,
                                fontFamily: 'ralewaysemi',
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "(+27) 12 403 1020\n(+27) 12 346 4690\ninfo@webdirectories.co.za",
                              style: TextStyle(
                                fontSize: widthDevice > 1600 ? 18 : 16,
                                fontFamily: 'raleway',
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 25),
                  child: SizedBox(
                    child: Row(
                      children: [
                        SizedBox(
                          width: widthDevice > 1600 ? 80 : 60,
                          height: widthDevice > 1600 ? 80 : 60,
                          child: SvgPicture.asset(
                            'images/panLocation.svg',
                          ),
                        ),
                        SizedBox(
                          width: MyUtility(context).width * 0.015,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Address",
                              style: TextStyle(
                                fontSize: widthDevice > 1600 ? 20 : 18,
                                fontFamily: 'ralewaysemi',
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "Open Google Maps",
                              style: TextStyle(
                                fontSize: widthDevice > 1600 ? 18 : 16,
                                fontFamily: 'raleway',
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: const Color(0xFFF4F4F4),
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 10.0),
                      child: Column(
                        children: [
                          Text(
                            'Message Us',
                            style: TextStyle(
                                fontSize: 24,
                                color: Color(0xFF0E1013),
                                fontFamily: 'ralewaysemi'),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Text(
                              '*Please fill in required fields',
                              style: TextStyle(
                                  fontFamily: 'ralewaymedium',
                                  fontSize: 14,
                                  color: Color.fromRGBO(0, 0, 0, 0.35)),
                            ),
                          ),
                          Container(
                            width: MyUtility(context).width / 1.2,
                            height: 600,
                            decoration: BoxDecoration(
                                color: Color(0x14ebebeb),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.09),
                                    spreadRadius: 0,
                                    blurRadius: 0,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                MessageUsTextFieldMobile(
                                  text: 'First Name*',
                                  controller: firstNameController,
                                ),
                                MessageUsTextFieldMobile(
                                  text: 'Last Name*',
                                  controller: lastNameController,
                                ),
                                MessageUsTextFieldMobile(
                                  text: 'Email*',
                                  controller: emailController,
                                ),
                                MessageUsTextFieldMobile(
                                  text: 'Phone*',
                                  controller: phoneController,
                                ),
                                MessageUsTextFieldMobile(
                                  text: 'Message*',
                                  controller: messageController,
                                ),
                                SizedBox(
                                  height: MyUtility(context).height * 0.01,
                                ),
                                NotARobotContainer(
                                  isChecked: _isChecked,
                                  onChanged: _onChanged,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: MyUtility(context).height * 0.025,
                          ),
                          SizedBox(
                            height: 40,
                            child: ElevatedButton(
                              onPressed: sendEmail,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF0E1013),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: Text(
                                'Submit Now ',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'raleway',
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MyUtility(context).height * 0.025,
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
