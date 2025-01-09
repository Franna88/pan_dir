import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class NotARobotContainer extends StatefulWidget {
  final Function(bool) onChanged;
  bool isChecked;
  NotARobotContainer(
      {Key? key, required this.isChecked, required this.onChanged})
      : super(key: key);

  @override
  _NotARobotContainerState createState() => _NotARobotContainerState();
}

class _NotARobotContainerState extends State<NotARobotContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MyUtility(context).width / 1.3,
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Checkbox(
                value: widget.isChecked,
                onChanged: (bool? value) {
                  if (value != null) {
                    widget.onChanged(value);
                  }
                },
              ),
              Text(
                "I'm not a robot",
                style: TextStyle(
                  fontSize: 18.0,
                  color: Color(0xFF0C0C0C).withOpacity(0.55),
                ),
              ),
            ],
          ),
          Image.asset(
            'images/notarobot.png',
            width: 80.0,
            height: 40.0,
          ),
        ],
      ),
    );
  }
}
