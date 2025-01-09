import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/mobileQuestionPages/ui/mobileCheckMarkText.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/mobileQuestionPages/ui/questionOrangeButton.dart';

class MobileGetListedBlock extends StatefulWidget {
  const MobileGetListedBlock({super.key});

  @override
  State<MobileGetListedBlock> createState() => _MobileGetListedBlockState();
}

class _MobileGetListedBlockState extends State<MobileGetListedBlock> {
  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(left: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Empowering Success\n\n',
                  style: TextStyle(
                    color: Color(0xFFE5882F),
                    fontSize: 16,
                    fontFamily: 'raleway',
                    height: 1,
                  ),
                ),
                TextSpan(
                  text: 'Get listed in our',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontFamily: 'ralewaymeduim',
                    height: 1,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Directory!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 45,
              fontFamily: 'ralewaybold',
              letterSpacing: 1.2,
              height: 1,
            ),
          ),
          MobileCheckMarkText(text: 'Connect with more customers'),
          MobileCheckMarkText(text: 'Boost your online brand visibility'),
          MobileCheckMarkText(text: 'Take control of your own listing 24/7'),
          MobileCheckMarkText(text: 'It’s easy and only takes a few minutes'),
          const SizedBox(
            height: 30,
          ),
          QuestionOrangeButton(
              buttonText: 'Click to Register',
              onPressed: () {
                //ADD ROUTE
              }),
          const SizedBox(
            height: 15,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.start,
            children: [Image.asset(
              'images/imageStack1.png',
              height: heightDevice * 0.25,
            ),]
          )
        ],
      ),
    );
  }
}
