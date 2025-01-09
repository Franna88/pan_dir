import 'package:flutter/material.dart';

class SmallCheckBox extends StatefulWidget {
  String description;
  bool checkboxValue;
  Function(bool?)? changeCheckboxValue;
  SmallCheckBox(
      {super.key,
      required this.description,
      required this.checkboxValue,
      this.changeCheckboxValue});

  @override
  State<SmallCheckBox> createState() => _CheckBoxStyleState();
}

class _CheckBoxStyleState extends State<SmallCheckBox> {
  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;

    return widthDevice < 1500
        ? Row(
            children: [
              Container(
                height: 25,
                width: 25,
                child: Transform.scale(
                  scale: 0.8,
                  child: Checkbox(
                    //controlAffinity: ListTileControlAffinity.leading,
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

                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    value: widget.checkboxValue,
                    activeColor: Color(0xFFEF9040),
                    checkColor: Colors.white,
                    onChanged: (bool? value) {
                      setState(() {
                        if (widget.changeCheckboxValue != null) {
                          widget.changeCheckboxValue!(!widget.checkboxValue);
                        }
                        widget.checkboxValue = !widget.checkboxValue;
                      });
                    },
                  ),
                ),
              ),
              Text(
                widget.description,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontFamily: 'raleway',
                ),
              )
            ],
          )
        :
        //---------------------
        //BIGGER SCREEN
        SizedBox(
            height: 25,
            width: 325,
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
              checkboxShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              value: widget.checkboxValue,
              activeColor: Color(0xFFEF9040),
              checkColor: Colors.white,
              onChanged: (bool? value) {
                setState(() {
                  if (widget.changeCheckboxValue != null) {
                    widget.changeCheckboxValue!(!widget.checkboxValue);
                  }
                  widget.checkboxValue = !widget.checkboxValue;
                });
              },
              title: Text(
                widget.description,
                maxLines: 1,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'raleway',
                ),
              ),
            ),
          );
  }
}
