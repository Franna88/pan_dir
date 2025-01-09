import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:webdirectories/WebDirectories/Page7/GetinTouch/GetinTouchComponents/TextFormField.dart';
import 'package:webdirectories/WebDirectories/Page3/OurStory/OurSotryComponents/OvalTextButton.dart';
import 'package:webdirectories/myutility.dart';

import '../../../emails/getInTouch/sendGetInTouch.dart';
import '../../components/descriptionDialog.dart';

class ContactDesktop extends StatefulWidget {
  const ContactDesktop({super.key});

  @override
  State<ContactDesktop> createState() => _ContactDesktopState();
}

class _ContactDesktopState extends State<ContactDesktop> {
  bool _isChecked = false;
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();
  final details = TextEditingController();

  Future descriptionDialog(description) => showDialog(
      context: context,
      builder: (context) {
        return Dialog(
            child: DescriptionDialog(
          description: description,
        ));
      });

  sendEmail() async {
    if (firstName.text == "" &&
        lastName.text == "" &&
        email.text == "" &&
        phone.text == "" &&
        details.text == "") {
      return descriptionDialog("Some Fields are required");
    }

    if (_isChecked == false) {
      return descriptionDialog("Im not robot validation required");
    }

    await sendGetInTouch(
        message: details.text,
        email: email.text,
        firstName: firstName.text,
        lastName: lastName.text,
        phone: phone.text);
    await descriptionDialog("Thank you ,your email has been sent.");
  }

  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    return SizedBox(
      width: MyUtility(context).width / 1.15,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 25, left: 25, top: 25),
        child: Row(
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
                  width: MyUtility(context).width / 2.6,
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
                    width: MyUtility(context).width / 2.2,
                    height: MyUtility(context).height / 10,
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
                    width: MyUtility(context).width / 2.2,
                    height: MyUtility(context).height / 8,
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
                    width: MyUtility(context).width / 2.2,
                    height: MyUtility(context).height / 11,
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
                  width: MyUtility(context).width / 2.45,
                  height: MyUtility(context).height / 1.7,
                  decoration: BoxDecoration(
                      color: const Color(0xFFF4F4F4),
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30, left: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
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
                                      borderSide:
                                          BorderSide(color: Color(0xFFDFDFDF)),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xFFDFDFDF)),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                          fontSize: 18.0, color: Colors.black),
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
                        /* Padding(
                          padding: const EdgeInsets.only(left: 15, top: 15),
                          child: Text(
                            '*Please fill in required fields',
                            style: TextStyle(
                              fontFamily: 'raleway',
                              fontSize: 13,
                              color: const Color(0xFF000000).withOpacity(0.35),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),*/
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
