import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JoinPBDPage/ui/checkMarkText.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JoinPBDPage/ui/orangeButton.dart';

class GetListedBlock extends StatefulWidget {
  final VoidCallback navigateToPricingOptions;
  GetListedBlock({super.key, required this.navigateToPricingOptions});

  @override
  State<GetListedBlock> createState() => _GetListedBlockState();
}

class _GetListedBlockState extends State<GetListedBlock> {
  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return Center(
      child: SizedBox(
        width: widthDevice * 0.85,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'images/imageStack1.png',
              height: heightDevice * 0.55,
            ),
            Column(
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
                          fontSize: widthDevice < 1500 ? 19 : 22,
                          fontFamily: 'ralewaysemi',
                          height: 1,
                        ),
                      ),
                      TextSpan(
                        text: 'Get listed in our',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: widthDevice < 1500 ? 35 : 55,
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
                    fontSize: widthDevice < 1500 ? 60 : 80,
                    fontFamily: 'ralewaybold',
                    letterSpacing: 1.2,
                    height: 1,
                  ),
                ),
                CheckMarkText(text: 'Connect with more customers'),
                CheckMarkText(text: 'Boost your online brand visibility'),
                CheckMarkText(text: 'Take control of your own listing 24/7'),
                CheckMarkText(text: 'It’s easy and only takes a few minutes'),
                const SizedBox(
                  height: 30,
                ),
                OrangeButton(
                    buttonText: 'Click to Register',
                    onPressed: () {
                      widget.navigateToPricingOptions();
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
