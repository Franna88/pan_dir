import 'package:flutter/material.dart';
import 'package:webdirectories/WebDirectories/Mobile/MobilePage1/MobilePage1.dart';
import 'package:webdirectories/WebDirectories/Mobile/MobilePage2/MobilePage2.dart';
import 'package:webdirectories/WebDirectories/Mobile/MobilePage3/MobilePage3.dart';
import 'package:webdirectories/WebDirectories/Mobile/MobilePage4/MobilePage4.dart';
import 'package:webdirectories/WebDirectories/Mobile/MobilePage5/MobilePage5.dart';
import 'package:webdirectories/WebDirectories/Mobile/MobilePage6/MobilePage6.dart';
import 'package:webdirectories/myutility.dart';

class MobileTopNavBar extends StatefulWidget {
  const MobileTopNavBar({Key? key}) : super(key: key);

  @override
  State<MobileTopNavBar> createState() => _MobileTopNavBarState();
}

class _MobileTopNavBarState extends State<MobileTopNavBar> {
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, right: 20),
          child: Container(
            width: 200,
            height: 100,
            child: Align(
              alignment: Alignment.topLeft,
              child: Image.asset(
                'images/webDirLogo2.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        SizedBox(width: 10),
        PopupMenuButton(
          color: Colors.white,
          icon: Icon(
            Icons.menu,
            size: 40,
          ),
          itemBuilder: (BuildContext context) {
            return [
              buildPopupMenuItem('Home', 'option1', MobilePage1()),
              buildPopupMenuItem('Our Story', 'option2', MobilePage2()),
              buildPopupMenuItem('Watif', 'option3', MobilePage3()),
              buildPopupMenuItem('Articles', 'option4', MobilePage4(),
                  isComingSoon: true),
              buildPopupMenuItem('Get in Touch', 'option5', MobilePage6()),
            ];
          },
          onSelected: (value) {
            setState(() {
              selectedOption = value as String?;
            });
          },
        ),
      ],
    );
  }

  PopupMenuItem<String> buildPopupMenuItem(
      String text, String value, Widget route,
      {bool isComingSoon = false}) {
    final isSelected = selectedOption == value;
    return PopupMenuItem(
      onTap: () {
        if (isComingSoon) {
          // Show a Snackbar or AlertDialog indicating this is "Coming Soon"
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Coming Soon!"),
                duration: Duration(seconds: 2),
              ),
            );
          });
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Material(
                child: route,
              ),
            ),
          );
        }
      },
      value: value,
      child: Container(
        width: MyUtility(context).width,
        color: isSelected
            ? Color(0xFFebebeb).withOpacity(0.05)
            : Color(0xFFebebeb).withOpacity(0.05),
        child: ListTile(
          title: Text(
            text,
            style: TextStyle(
              color: isComingSoon ? Colors.grey : Colors.black,
              fontFamily: 'raleway',
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
