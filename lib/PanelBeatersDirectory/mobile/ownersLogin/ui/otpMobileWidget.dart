import 'package:flutter/material.dart';

class OTPMobileWidget extends StatefulWidget {
  const OTPMobileWidget({super.key});

  @override
  State<OTPMobileWidget> createState() => _OTPMobileWidgetState();
}

class _OTPMobileWidgetState extends State<OTPMobileWidget> {
  TextEditingController text1 = TextEditingController();
  TextEditingController text2 = TextEditingController();
  TextEditingController text3 = TextEditingController();
  TextEditingController text4 = TextEditingController();
  TextEditingController text5 = TextEditingController();
  TextEditingController text6 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center,
      children: [
        myInputBox(context, text1),
        SizedBox(width: 10,),
        myInputBox(context, text2),
        SizedBox(width: 10,),
        myInputBox(context, text3),
        SizedBox(width: 10,),
        myInputBox(context, text4),
        SizedBox(width: 10,),
        myInputBox(context, text5),
        SizedBox(width: 10,),
        myInputBox(context, text6),
      ],
    );
  }
}

Widget myInputBox(BuildContext context, TextEditingController controller) {
  return Container(
    height: 50,
    width: 40,
    decoration: ShapeDecoration(
      color: Color(0xFFD9D9D9),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    child: TextField(
      cursorColor: Colors.black,
      cursorHeight: 30,
      //showCursor: false,
      controller: controller,
      keyboardType: TextInputType.number,
      style: TextStyle(
                color:  Colors.black,
                fontSize: 30,
                fontFamily: 'raleway',
                
              ),
      
      maxLength: 1,
      decoration: InputDecoration(
        
        border: InputBorder.none,
        counterText: '',
        contentPadding: EdgeInsets.only(left: 20)
      ),
      
      onChanged: (value) {
        if (value.length ==1){
          FocusScope.of(context).nextFocus();
        }
      },
    ),
  );
}
