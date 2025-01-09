import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/ProfileComp/TextField/LongTextField.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/ProfileComp/TextField/ProfileTextField.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/ProfileComp/buttons/AddressDropdowns.dart/country_dropdown.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/ProfileComp/buttons/AddressDropdowns.dart/province_dropdown.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JobFinder/SubmitCV/experience_dropdown.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JobFinder/SubmitCV/occupation_dropdown.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JobFinder/SubmitCV/responsive_job_table.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/components/myutility.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/components/noIconOrangeButton.dart';

class SubmitCVContainer extends StatefulWidget {
  const SubmitCVContainer({super.key});

  @override
  State<SubmitCVContainer> createState() => _SubmitCVContainerState();
}

class _SubmitCVContainerState extends State<SubmitCVContainer> {
  late TextEditingController _contentTitleController;
  late TextEditingController _qualificationController;
  late TextEditingController _nameSurnameController;
  late TextEditingController _numberController;
  late TextEditingController _emailController;
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _contentTitleController = TextEditingController();
    _qualificationController = TextEditingController();
    _nameSurnameController = TextEditingController();
    _numberController = TextEditingController();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    _contentTitleController.dispose();
    super.dispose();
  }

  String _selectedCountry = '';

  void _handleCountryChange(String country) {
    setState(() {
      _selectedCountry = country; // Update the state with the selected country
    });
    print('Selected Country: $country'); // Do something with the country
  }

  String selectedProvince = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MyUtility(context).width * 0.845,
      height: MyUtility(context).height * 0.73,
      decoration: ShapeDecoration(
        color: Color(0xFF181B1D),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 0.64,
            strokeAlign: BorderSide.strokeAlignOutside,
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(9.57),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: RawScrollbar(
          thumbColor: Colors.white,
          controller: _scrollController,
          thumbVisibility: true,
          trackVisibility: true,
          thickness: 10,
          trackColor: Colors.grey,
          trackRadius: const Radius.circular(20),
          radius: const Radius.circular(20),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(right: 100),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'Submit your CV here\n\n',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontFamily: 'ralewaybold',
                      ),
                      children: [
                        TextSpan(
                          text:
                              'Job seekers can submit their details to our Panel Beater Directory. This information is accessible to employers exclusively through our Owners portal for 60 days. Employers can then contact potential candidates directly. ',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontFamily: 'raleway',
                          ),
                        ),
                        TextSpan(
                          text:
                              'Please note: This is a free information service only. We are not responsible for the accuracy or content of the information provided. We have no financial interest in or influence over the hiring process.',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFFEF9040),
                            fontFamily: 'raleway',
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '* Fill in Required Fields',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'raleway',
                    ),
                  ),
                  OccupationDropdown(
                    occupationTypes: [
                      "Doctor",
                      "Engineer",
                      "Teacher",
                      "Designer",
                      "Developer",
                    ],
                    onChanged: (value) {
                      // Handle value change
                      print("Selected Occupation: $value");
                    },
                  ),
                  SizedBox(height: 20),
                  LongTextField(
                      controller: _qualificationController,
                      width: MyUtility(context).width,
                      headline:
                          'Qualification: (Please note, no email address or URLs are allowed in the text box)'),
                  ExperienceDropdown(
                    ExperienceTypes: [
                      "Doctor",
                      "6 months",
                      "2 years",
                      "5 years",
                      "10 years",
                    ],
                    onChanged: (value) {
                      // Handle value change
                      print("Selected Experience: $value");
                    },
                  ),
                  SizedBox(height: 20),
                  Divider(height: 0.5, color: Colors.grey[800]),
                  SizedBox(height: 10),
                  Text(
                    'Area you want to work',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'raleway',
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          width: MyUtility(context).width * 0.25,
                          child: CountryDropdown(
                              onCountryChanged: _handleCountryChange)),
                      SizedBox(
                          width: MyUtility(context).width * 0.25,
                          child: CountryDropdown(
                              onCountryChanged: _handleCountryChange)),
                      SizedBox(
                          width: MyUtility(context).width * 0.25,
                          child: CountryDropdown(
                              onCountryChanged: _handleCountryChange)),
                    ],
                  ),
                  SizedBox(height: 10),
                  Divider(height: 0.5, color: Colors.grey[800]),
                  SizedBox(height: 10),
                  ProfileTextField(
                      customWidth: MyUtility(context).width,
                      controller: _nameSurnameController,
                      headline: '*Name & Surname'),
                  SizedBox(height: 10),
                  ProfileTextField(
                      customWidth: MyUtility(context).width,
                      controller: _numberController,
                      headline: '*Contact Number'),
                  SizedBox(height: 10),
                  ProfileTextField(
                      customWidth: MyUtility(context).width,
                      controller: _emailController,
                      headline: '*Email Address'),
                  SizedBox(height: 30),
                  Row(
                    children: [
                      InkWell(
                        child: Row(
                          children: [
                            Image.asset(
                              'images/CV_link.png',
                              width: 40, // Adjust the width as needed
                              height: 40, // Adjust the height as needed
                            ),
                            SizedBox(
                                width:
                                    8), // Add spacing between the image and text
                            Text(
                              'Attach CV here',
                              style: TextStyle(
                                fontSize: 16, // Adjust the font size as needed
                                color: Color(0xFFEF9040),
                                fontWeight: FontWeight.normal,
                                fontFamily: 'raleway',
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      NoIconOrangeButton(buttonText: 'Submit'),
                    ],
                  ),
                  SizedBox(height: 30),
                  Divider(height: 0.5, color: Colors.grey[800]),
                  SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Current Available Positions',
                        style: TextStyle(
                          fontSize: 16, // Adjust the font size as needed
                          color: Color(0xFFEF9040),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'raleway',
                        ),
                      ),
                      SizedBox(height: 10),
                      const Text(
                        'Browse current available job vacancies in Southern Africa',
                        style: TextStyle(
                          fontSize: 16, // Adjust the font size as needed
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'raleway',
                        ),
                      ),
                      SizedBox(height: 10),
                      SizedBox(child: ResponsiveJobTable()),
                      SizedBox(height: 10),
                      const Text(
                        'Showing 1 to 5 of 433 entries',
                        style: TextStyle(
                          fontSize: 12, // Adjust the font size as needed
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'raleway',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
