import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:webdirectories/myutility.dart';

class InfoTextBox extends StatelessWidget {
  const InfoTextBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 15),
      child: Container(
        width: MyUtility(context).width * 0.45,
        height: MyUtility(context).height * 0.23,
        decoration: BoxDecoration(
          color: Color(0xFF53575B),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Color(0x7F000000),
              blurRadius: 4,
              offset: Offset(0, 4),
              spreadRadius: 0,
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 2.0, right: 10.0),
                  child: SvgPicture.asset(
                    'images/info2.svg',
                    width: MyUtility(context).width * 0.12,
                    height: MyUtility(context).height * 0.12,
                  ),
                ),
              ),
              const SizedBox(width: 20,),
              Expanded(
                child: ListView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    _buildBulletPointText(
                        'This is our contribution to connect employers to suitable staff'),
                    _buildBulletPointText(
                        'Job Seekers submitted their details in the Panelbeaters Directory'),
                    _buildBulletPointText(
                        'Info is available in our exclusive Owners portal for 60 days'),
                    _buildBulletPointText('Contact candidates directly'),
                    _buildBulletPointText(
                        'This is a FREE Information service only! We take no responsibility for content or accuracy of information'),
                    _buildBulletPointText(
                        'This is our contribution to connect employers to suitable staff'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBulletPointText(String text) {
    
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 6.0,
            height: 6.0,
            child: CircleAvatar(
              backgroundColor: Colors.white,
            ),
          ),
          SizedBox(width: 8.0),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize:   13,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
