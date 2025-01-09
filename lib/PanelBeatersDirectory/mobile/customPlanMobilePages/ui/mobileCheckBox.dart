import 'package:flutter/material.dart';

class MobileCheckBox extends StatefulWidget {
  String description;
  bool checkboxValue;
  MobileCheckBox(
      {super.key, required this.description, required this.checkboxValue});

  @override
  State<MobileCheckBox> createState() => _MobileCheckBoxState();
}

class _MobileCheckBoxState extends State<MobileCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 2),
      child: SizedBox(
        height: 23,
        child: CheckboxListTile(
          controlAffinity: ListTileControlAffinity.leading,
          fillColor: MaterialStateProperty.resolveWith((states) {
            if (!states.contains(MaterialState.selected)) {
              return Colors.white;
            }
            return null;
          }),
          side: BorderSide(
            color: Colors.white,
          ),
          visualDensity: VisualDensity(vertical: -4, horizontal: -4),
          contentPadding: EdgeInsets.all(0),
          checkboxShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          value: widget.checkboxValue,
          activeColor: Color(0xFFEF9040),
          checkColor: Colors.white,
          onChanged: (bool? value) {
            setState(() {
              widget.checkboxValue = !widget.checkboxValue;
            });
          },
          title: Text(
            widget.description,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: 'raleway',
            ),
          ),
        ),
      ),
    );
  }
}
