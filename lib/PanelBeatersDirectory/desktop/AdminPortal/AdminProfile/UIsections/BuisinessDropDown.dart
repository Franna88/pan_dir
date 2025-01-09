import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/ProfileComp/ProfileDropDown.dart';
import 'package:webdirectories/myutility.dart';

class BusinessDropDown extends StatefulWidget {
  const BusinessDropDown({super.key});

  @override
  State<BusinessDropDown> createState() => _BusinessDropDownState();
}

class _BusinessDropDownState extends State<BusinessDropDown> {
  String? dropdownValue;
  List<String> items = ['Item 1', 'Item 2', 'Item 3', 'Item 4'];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Text(
            'Approvals',
            style: TextStyle(
              color: Color(0xFF0F253A),
              fontSize: 20.4,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ProfileDropDown(
            //   headline: 'Select a Category',
            //   items: items,
            //   value: dropdownValue,
            //   onChanged: (String? newValue) {
            //     setState(() {
            //       dropdownValue = newValue;
            //     });
            //   },
            // ),
            // SizedBox(
            //   width: MyUtility(context).width * 0.10,
            // ),
            // ProfileDropDown(
            //   headline: 'Specialist Service',
            //   items: items,
            //   value: dropdownValue,
            //   onChanged: (String? newValue) {
            //     setState(() {
            //       dropdownValue = newValue;
            //     });
            //   },
            // ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 30, top: 20, left: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: MyUtility(context).width,
                height: 1,
                decoration: BoxDecoration(color: Color(0xFF0F253A)),
              )
            ],
          ),
        ),
      ],
    );
  }
}
