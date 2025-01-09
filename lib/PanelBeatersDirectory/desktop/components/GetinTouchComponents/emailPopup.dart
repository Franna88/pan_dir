import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class Emailpopup extends StatefulWidget {
  final String description;

  Emailpopup({
    required this.description,
    super.key,
  });

  @override
  State<Emailpopup> createState() => _EmailpopupState();
}

class _EmailpopupState extends State<Emailpopup> {
  @override
  Widget build(BuildContext context) {
    bool isMobile = MyUtility(context).width < 600;
    return Dialog(
      backgroundColor: Colors.transparent, // Set the background to transparent
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.09)),
      ),
      child: Container(
        width: isMobile ? MyUtility(context).width : 350,
        height: isMobile ? MyUtility(context).height * 0.6 : 240,
        decoration: BoxDecoration(
          color: Color(0xFFF4F4F4), // Light grey background to fit CI
          borderRadius: BorderRadius.all(Radius.circular(8.09)),
        ),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFB0B0B0), // Neutral grey header
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.09),
                  topRight: Radius.circular(8.09),
                ),
              ),
              width: double.infinity,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: Icon(Icons.close, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 15.0, horizontal: 25.0), // Adjusted padding
              child: Text(
                widget.description,
                style: TextStyle(
                  color: Color(0xFF0C0C0C), // Darker grey for text
                  fontSize: 16,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 20.0,
                  horizontal: 30.0), // Increased padding around the OK button
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context); // Close the dialog when tapped
                    },
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors
                            .black, // Button color (black to match the theme)
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 20.0), // Padding for the button
                        child: Center(
                          child: Text(
                            'OK',
                            style: TextStyle(
                              color: Colors.white, // White text for contrast
                              fontSize: 16,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
