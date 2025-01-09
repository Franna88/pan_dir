import 'package:flutter/material.dart';

class PackageDescriptionWidget extends StatelessWidget {
  final String optionText;
  final Widget textContent;
  final bool showReadMoreButton;

  PackageDescriptionWidget({
    Key? key,
    required this.optionText,
    required this.textContent,
    this.showReadMoreButton = true, // Default to true for visibility
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;

    return Center(
      child: Container(
        width: widthDevice * 0.78,
        decoration: ShapeDecoration(
          color: Color(0xFFF1F3F4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.80),
          ),
          shadows: [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 3.78,
              offset: Offset(0, 3.78),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 25),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'This ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 35,
                        fontFamily: 'ralewaybold',
                        height: 1.2,
                      ),
                    ),
                    TextSpan(
                      text: optionText,
                      style: TextStyle(
                        color: Color(0xFFEF9040),
                        fontSize: 35,
                        fontFamily: 'ralewaybold',
                        height: 1.2,
                      ),
                    ),
                    TextSpan(
                      text: ' is perfect for:',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 35,
                        fontFamily: 'ralewaybold',
                        height: 1.2,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [textContent],
              ),
              const SizedBox(height: 20),
              Center(
                child: Container(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFE2822B),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.zero,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 22),
                      child: Text(
                        'Sign Up Now!',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontFamily: 'raleway',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              if (showReadMoreButton)
                Center(
                  child: Container(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: EdgeInsets.zero,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5, right: 13),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 18,
                              height: 18,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              padding: EdgeInsets.zero,
                              child: Icon(
                                Icons.keyboard_arrow_right_outlined,
                                color: Colors.black,
                                size: 14,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Read More',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontFamily: 'raleway',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
