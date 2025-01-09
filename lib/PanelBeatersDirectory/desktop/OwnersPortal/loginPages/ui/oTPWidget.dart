import 'package:flutter/material.dart';

class OTPWidget extends StatefulWidget {
  Function(String) getOtpEntered;
  OTPWidget({super.key, required this.getOtpEntered});

  @override
  State<OTPWidget> createState() => _OTPWidgetState();
}

class _OTPWidgetState extends State<OTPWidget> {
  TextEditingController text1 = TextEditingController();
  TextEditingController text2 = TextEditingController();
  TextEditingController text3 = TextEditingController();
  TextEditingController text4 = TextEditingController();
  TextEditingController text5 = TextEditingController();
  TextEditingController text6 = TextEditingController();

  @override
  void dispose() {
    text1.dispose();
    text2.dispose();
    text3.dispose();
    text4.dispose();
    text5.dispose();
    text6.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        myInputBox(context, text1, false),
        SizedBox(
          width: 15,
        ),
        myInputBox(context, text2, false),
        SizedBox(
          width: 15,
        ),
        myInputBox(context, text3, false),
        SizedBox(
          width: 15,
        ),
        myInputBox(context, text4, false),
        SizedBox(
          width: 15,
        ),
        myInputBox(context, text5, false),
        SizedBox(
          width: 15,
        ),
        myInputBox(context, text6, true),
      ],
    );
  }

  Widget myInputBox(
      BuildContext context, TextEditingController controller, bool check) {
    var widthDevice = MediaQuery.of(context).size.width;

    return Container(
      height: widthDevice < 1500 ? 60 : 70,
      width: widthDevice < 1500 ? 50 : 60,
      decoration: ShapeDecoration(
        color: Color(0xFFD9D9D9),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Center(
        child: TextField(
          cursorColor: Colors.black,
          cursorHeight: widthDevice < 1500 ? 25 : 30,
          //showCursor: false,
          controller: controller,
          keyboardType: TextInputType.number,
          style: TextStyle(
            color: Colors.black,
            fontSize: widthDevice < 1500 ? 25 : 30,
            fontFamily: 'raleway',
          ),

          maxLength: 1,
          decoration: InputDecoration(
              border: InputBorder.none,
              counterText: '',
              contentPadding: EdgeInsets.only(left: 20)),

          onChanged: (value) {
            if (value.length == 1) {
              FocusScope.of(context).nextFocus();
            }
            if (check) {
              var otp =
                  "${text1.text}${text2.text}${text3.text}${text4.text}${text5.text}${text6.text}";

              widget.getOtpEntered(otp);
            }
          },
        ),
      ),
    );
  }
}
