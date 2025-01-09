import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JobFinder/JobFindaContainer/InfoContainer/InfoContainerComp/ButtonInfoContainer.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JobFinder/SubmitCV/SubmitCVContainer.dart';
import 'package:webdirectories/myutility.dart';

class InfoContainer extends StatefulWidget {
  const InfoContainer({super.key});

  @override
  State<InfoContainer> createState() => _InfoContainerState();
}

class _InfoContainerState extends State<InfoContainer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ButtonInfoContainer(
            headlineText: 'What is Job Finder?',
            paragraph:
                'Job Finder is a free service for both job seekers and featured businesses within the Auto Body Repair industry in Southern Africa. ',
            buttonText: 'Learn More',
            onPressed: () {}),
        ButtonInfoContainer(
            headlineText: 'Employee Platform',
            paragraph:
                "Submit your details and we promise to publish it to our exclusive employer's database. You will be contacted by interested employers directly as we have no influence in the application and interview process.",
            buttonText: 'Submit CV here',
            onPressed: () {}),
        Column(
          children: [
            ButtonInfoContainer(
                headlineText: 'Employer Platform ',
                paragraph:
                    'Want to have quick access to a pool of qualified candidates? Register your business on the Panel Beater Directory via our easy sign up process. ',
                buttonText: 'Register your business here',
                buttonWidth: MyUtility(context).width * 0.2,
                onPressed: () {}),
            SizedBox(
              width: MyUtility(context).width * 0.45,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      'Please note that this is a free information service only. We have no financial interest or influence in the process.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: MyUtility(context).width * 0.0075,
                        fontFamily: 'raleway',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
