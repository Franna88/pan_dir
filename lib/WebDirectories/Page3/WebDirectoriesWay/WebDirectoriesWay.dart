import 'package:flutter/material.dart';
import 'package:webdirectories/WebDirectories/Page3/WebDirectoriesWay/WebDirectoriesWayComponent/StackedImageContainer.dart';
import 'package:webdirectories/myutility.dart';

class WebDirectoriesWay extends StatefulWidget {
  const WebDirectoriesWay({super.key});

  @override
  State<WebDirectoriesWay> createState() => _WebDirectoriesWayState();
}

class _WebDirectoriesWayState extends State<WebDirectoriesWay> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 50),
          child: Text(
            "Our “Web Directories Way”",
            style: TextStyle(
                fontSize: 48, fontFamily: 'ralewaysemi', color: Colors.black),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 20),
          child: Text(
            "We are Websmiths & Web Librarians",
            style: TextStyle(
                fontSize: 24, fontFamily: 'ralewaysemi', color: Colors.black),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width / 1.45,
          height: MediaQuery.of(context).size.height * 0.3,
          decoration: BoxDecoration(
            color: const Color(0xFFF1F3F4),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 0,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontFamily: 'raleway'),
                    children: [
                      TextSpan(
                        text: 'Our culture is built on ',
                      ),
                      TextSpan(
                        text: 'transparency, collaboration, and innovation, ',
                        style: TextStyle(
                            fontFamily: 'ralewaybold', color: Colors.black),
                      ),
                      TextSpan(
                        text: 'where we ',
                      ),
                      TextSpan(
                        text: 'empower our team ',
                        style: TextStyle(
                            fontFamily: 'ralewaybold', color: Colors.black),
                      ),
                      TextSpan(
                        text:
                            'to share ideas, take risks, and learn from each other. We believe that the best way to build a successful business is to create a culture where everyone feels ',
                      ),
                      TextSpan(
                        text: 'valued and respected, ',
                        style: TextStyle(
                            fontFamily: 'ralewaybold', color: Colors.black),
                      ),
                      TextSpan(
                        text:
                            'and where everyone has the opportunity to contribute their ',
                      ),
                      TextSpan(
                        text: 'unique talents and perspectives.',
                        style: TextStyle(
                            fontFamily: 'ralewaybold', color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontFamily: 'raleway',
                    ),
                    children: [
                      TextSpan(
                        text: 'At Web Directories ',
                      ),
                      TextSpan(
                        text:
                            'we challenge the status quo of web information organization and access by innovating gateways to web data, ',
                      ),
                      TextSpan(
                        text:
                            'eliminating user frustration by digitizing the “middlemen”. ',
                        style: TextStyle(
                          fontFamily: 'ralewaybold',
                        ),
                      ),
                      TextSpan(
                        text: 'We convert relevant industry information into ',
                      ),
                      TextSpan(
                        text: 'usable intelligence, ',
                        style: TextStyle(
                          fontFamily: 'ralewaybold',
                        ),
                      ),
                      TextSpan(
                        text:
                            'harnessing the web’s power to provide access to library sources. We focus on enhancing ',
                      ),
                      TextSpan(
                        text: 'user-centered experiences ',
                        style: TextStyle(
                          fontFamily: 'ralewaybold',
                        ),
                      ),
                      TextSpan(
                        text:
                            'that efficiently access entire economic markets, ',
                      ),
                      TextSpan(
                        text: 'lowering the barriers to SME’s online presence.',
                        style: TextStyle(
                          fontFamily: 'ralewaybold',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "We are technology builders that continuously design, develop, and evaluate our data-driven services.",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontFamily: 'raleway',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: MyUtility(context).height * 0.07,
        ),
        const StackImageContainer(),
        SizedBox(
          height: MyUtility(context).height * 0.05,
        ),
      ],
    );
  }
}
