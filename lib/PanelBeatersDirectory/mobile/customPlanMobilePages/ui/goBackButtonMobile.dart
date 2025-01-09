import 'package:flutter/material.dart';

class GoBackButtonMobile extends StatefulWidget {
  final VoidCallback onPressed;
  String buttonText;
  GoBackButtonMobile(
      {super.key, required this.buttonText, required this.onPressed});

  @override
  State<GoBackButtonMobile> createState() => _GoBackButtonMobileState();
}

class _GoBackButtonMobileState extends State<GoBackButtonMobile> {
  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          /*width: MediaQuery.of(context).size.width * 0.08,*/
          /*height: MediaQuery.of(context).size.height * 0.05,*/
          child: ElevatedButton(
            onPressed: widget.onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 92, 92, 92),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.zero,
            ),
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 4, bottom: 4, left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.west,
                    color: Colors.white,
                    size: 16,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    widget.buttonText,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: 'raleway',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
