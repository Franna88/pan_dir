import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class WebMobileReportComment extends StatefulWidget {
  const WebMobileReportComment({super.key});

  @override
  State<WebMobileReportComment> createState() =>
      _WebMobileReportCommentState();
}

class _WebMobileReportCommentState extends State<WebMobileReportComment> {
  List<bool> isSelectedList = List.generate(9, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Center(
        child: Container(
          width: MyUtility(context).width * 0.9,
          height: MyUtility(context).height * 0.4,
          decoration: ShapeDecoration(
            color: Color(0xFFD9D9D9),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(22),
            ),
            shadows: [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 4,
                offset: Offset(0, 4),
                spreadRadius: 0,
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Report Comment',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17.99,
                  fontFamily: 'ralewaybold',
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  'Thank you for creating a safe digital space. Your contribution will stay anonymous. You can report a post after selecting an option.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12.36,
                    fontFamily: 'raleway',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Wrap(
                spacing: 10.0, // Adjusted spacing between buttons
                runSpacing: 10.0, // Adjusted run spacing
                children: [
                  'Nudity',
                  'Violence',
                  'Harassment',
                  'Terrorism',
                  'Suicide or Self-injury',
                  'Spam',
                  'Something Else',
                  'Unauthorized Sales',
                  'Hate Speech',
                ].asMap().entries.map((entry) {
                  int index = entry.key;
                  String label = entry.value;
                  return SizedBox(
                    height: 25,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            isSelectedList[index] ? Color.fromRGBO(67, 126, 164, 1) : Colors.grey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          for (int i = 0; i < isSelectedList.length; i++) {
                            isSelectedList[i] = i == index;
                          }
                        });
                      },
                      child: Text(
                        label,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.36,
                          fontFamily: 'raleway',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(67, 126, 164, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'Report Comment',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12.36,
                    fontFamily: 'ralewaymedium',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}