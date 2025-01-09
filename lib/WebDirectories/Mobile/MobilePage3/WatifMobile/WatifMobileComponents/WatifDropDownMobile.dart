import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class WatifDropDownMobile extends StatefulWidget {
  final String dropdownText;
  final String dropdownContent;
  final bool isOpen;
  final Function() onToggle;
  final Color textColor;

  const WatifDropDownMobile(
      {Key? key,
      required this.dropdownText,
      required this.dropdownContent,
      required this.isOpen,
      required this.onToggle,
      required this.textColor})
      : super(key: key);

  @override
  _WatifDropDownMobileState createState() => _WatifDropDownMobileState();
}

class _WatifDropDownMobileState extends State<WatifDropDownMobile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: widget.onToggle,
            child: Container(
              width: 320,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: widget.textColor,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.dropdownText,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'raleway',
                      fontSize: 15,
                    ),
                  ),
                  // Arrow indicator
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Icon(
                      widget.isOpen
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (widget.isOpen) ...[
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Container(
                width: MyUtility(context).width / 1.1,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        widget.dropdownContent,
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'raleway',
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
