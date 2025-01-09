import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Footer/panelFooter.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JoinPBDPage/ui/attentionMotoristsBlock.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JoinPBDPage/ui/convertClicksBlock.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JoinPBDPage/ui/getListedBlock.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JoinPBDPage/ui/youtubeVideoBlock.dart';
import 'package:webdirectories/myutility.dart';

class NewJointPbdPage extends StatefulWidget {
  final VoidCallback navigateToPricingOptions;

  const NewJointPbdPage({super.key, required this.navigateToPricingOptions});

  @override
  State<NewJointPbdPage> createState() => _NewJointPbdPageState();
}

class _NewJointPbdPageState extends State<NewJointPbdPage> {
  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return Material(
      child: Container(
        height: MyUtility(context).height,
        width: MyUtility(context).width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/effortlessManagement.png'),
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(
              Color.fromARGB(99, 0, 0, 0),
              BlendMode.darken,
            ),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: widthDevice / 10,
                      top: 50,
                    ),
                    child: Image.asset(
                      'images/panelLogo.png',
                      // height: 70,
                      width: MyUtility(context).width * 0.23,
                    ),
                  ),
                  YoutubeVideoBlock(),
                  GetListedBlock(
                      navigateToPricingOptions:
                          widget.navigateToPricingOptions),
                  SizedBox(
                    height: heightDevice / 10,
                  ),
                  ConvertClicksBlock(
                      navigateToPricingOptions:
                          widget.navigateToPricingOptions),
                  SizedBox(
                    height: heightDevice / 10,
                  ),
                  AttentionMotoristsBlock(),
                  SizedBox(
                    height: heightDevice / 10,
                  ),
                  PanelFooter()
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
