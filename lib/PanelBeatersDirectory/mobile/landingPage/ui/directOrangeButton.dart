import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/searchListings/mobileServicesNearMe/mobileServicesNearMe.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/mobileRecentArticles/mobileRecentArticles.dart';

class DirectOrangeButton extends StatelessWidget {
  final String buttonTitle;
  final Function onPressed;
  const DirectOrangeButton(
      {super.key, required this.buttonTitle, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            onPressed();
          },
          child: Container(
            width: widthDevice * 0.85,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.only(
              top: 5,
              left: 15,
              right: 8,
              bottom: 5,
            ),
            decoration: ShapeDecoration(
              gradient: const LinearGradient(
                begin: Alignment(-1, 0.00),
                end: Alignment(1, 0),
                colors: [Color(0xFFE2822B), Color(0xFFD87121)],
              ),
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 2, color: Colors.white),
                borderRadius: BorderRadius.circular(37.99),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  buttonTitle,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20.4,
                      fontFamily: 'ralewaymedium',
                      letterSpacing: -0.3),
                ),
                Container(
                  width: 25,
                  height: 25,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  padding: EdgeInsets.zero,
                  child: const Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.black,
                    size: 18,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
