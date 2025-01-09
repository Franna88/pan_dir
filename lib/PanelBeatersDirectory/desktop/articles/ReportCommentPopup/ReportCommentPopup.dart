import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/components/myutility.dart';

class ReportCommentPopup extends StatefulWidget {
  const ReportCommentPopup({super.key});

  @override
  State<ReportCommentPopup> createState() => _ReportCommentPopupState();
}

class _ReportCommentPopupState extends State<ReportCommentPopup> {
  List<bool> isSelectedList = List.generate(9, (index) => false);

  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Center(
        child: Container(
          width: MyUtility(context).width * 0.38,
          height: MyUtility(context).height * 0.37,
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Report Comment',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize:  widthDevice <1500 ? 28 : 34,
                    fontFamily: 'ralewaybold',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: widthDevice < 1500 ? 10 : 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Text(
                    'Thank you for creating a safe digital space. Your contribution will stay anonymous. You can report a post after selecting an option.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.64,
                      fontFamily: 'raleway',
                      fontWeight: FontWeight.w400,
                      height: 1
                    ),
                  ),
                ),
                SizedBox(height: widthDevice < 1500 ? 10 : 20),
                Wrap(
                  spacing: 10.0,
                  runSpacing: 10.0,
                  children: [
                    'Nudity',
                    'Violence',
                    'Harassment',
                    'Suicide or Self-injury',
                    'Spam',
                    'Unauthorized Sales',
                    'Hate Speech',
                    'Terrorism',
                    'Something Else'
                  ].asMap().entries.map((entry) {
                    int index = entry.key;
                    String label = entry.value;
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            isSelectedList[index] ? Colors.orange : Colors.grey,
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
                          fontSize: 13.6,
                          fontFamily: 'raleway',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      Navigator.pop(context);
                    });
                  },
                  child: Text(
                    'Report Comment',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.64,
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
      ),
    );
  }
}
