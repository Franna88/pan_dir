import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

// WatifDropdown widget that uses external open/close state
class WatifDropdown extends StatelessWidget {
  final String dropdownText;
  final String dropdownContent;
  final bool isOpen;
  final Function() onToggle;
  final Color containerColor;

  const WatifDropdown(
      {Key? key,
      required this.dropdownText,
      required this.dropdownContent,
      required this.isOpen,
      required this.onToggle,
      this.containerColor = Colors.black})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: onToggle,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.32,
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: containerColor,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        dropdownText,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'raleway',
                            fontSize: 18),
                      ),
                      Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Icon(
                          isOpen
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: MyUtility(context).width * 0.2,
              ),
            ],
          ),
          if (isOpen)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Container(
                    width: MyUtility(context).width * 0.4,
                    decoration: BoxDecoration(
                      color: Color(0xFFF1F3F4),
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 0,
                          blurRadius: 5,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ListTile(
                      title: Text(
                        dropdownContent,
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'raleway',
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
