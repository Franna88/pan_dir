import 'package:flutter/material.dart';

class ToggleSwitch extends StatefulWidget {
  const ToggleSwitch({super.key});

  @override
  State<ToggleSwitch> createState() => _ToggleSwitchState();
}
//TODO FIX ICON ISSUE
class _ToggleSwitchState extends State<ToggleSwitch> {
  //switch button
  toggleButton() {
    setState(() {
      toggleValue = !toggleValue;
    });
  }

  bool toggleValue = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 1000),
      height: 40,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: toggleValue ? Colors.white : Colors.orange,
      ),
      child: Stack(
        children: <Widget>[
          AnimatedPositioned(
            duration: Duration(milliseconds: 1000),
            curve: Curves.easeIn,
            top: 3.0,
            left: toggleValue ? 60.0 : 0.0,
            right: toggleValue ? 0.0 : 60.0,
            child: InkWell(
              onTap: toggleButton,
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 1000),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return RotationTransition(turns: animation);
                },
                child: toggleValue
                    ? Icon(
                        Icons.circle,
                        color: Colors.black,
                        size: 35.0,
                        key: UniqueKey(),
                      )
                    : Icon(
                        Icons.circle,
                        color: Colors.white,
                        size: 35.0,
                        key: UniqueKey(),
                      ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
