import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/ProfileComp/TextField/ProfileShortTextField.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/ProfileComp/TextField/ProfileTextField.dart';
import 'package:webdirectories/myutility.dart';

class BusinessContact extends StatefulWidget {
  final TextEditingController? customerCareController;
  final TextEditingController? whatsappController;
  final TextEditingController? afterHoursController;
  final TextEditingController? businessFaxController;
  final TextEditingController? businessAlternativeController;

  const BusinessContact(
      {super.key,
      this.customerCareController,
      this.whatsappController,
      this.afterHoursController,
      this.businessFaxController,
      this.businessAlternativeController});

  @override
  State<BusinessContact> createState() => _BusinessContactState();
}

class _BusinessContactState extends State<BusinessContact> {
  final TextEditingController _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: MyUtility(context).width * 0.25,
          ),
          Column(
            children: [
              Column(
                children: [
                  ProfileTextField(
                      controller: widget.customerCareController != null
                          ? widget.customerCareController!
                          : _textController,
                      headline: 'Customer Care Number'),
                  ProfileTextField(
                      controller: widget.businessAlternativeController != null
                          ? widget.businessAlternativeController!
                          : _textController,
                      headline: 'Business Alternative Number'),
                  ProfileTextField(
                      controller: widget.afterHoursController != null
                          ? widget.afterHoursController!
                          : _textController,
                      headline: 'After hours Number'),
                  ProfileTextField(
                      controller: widget.whatsappController != null
                          ? widget.whatsappController!
                          : _textController,
                      headline: 'WhatsApp Number (e.g., +27824596527)'),
                  ProfileTextField(
                      controller: widget.businessFaxController != null
                          ? widget.businessFaxController!
                          : _textController,
                      headline: 'Business Fax Number'),
                  // this is still needs to be connected
                  ProfileTextField(
                      controller: widget.businessFaxController != null
                          ? widget.businessFaxController!
                          : _textController,
                      headline: 'Business email Address'),
                ],
              ),
              /*Padding(
                padding: const EdgeInsets.only(bottom: 30, top: 20),
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
              )*/
            ],
          ),
        ],
      ),
    );
  }
}
