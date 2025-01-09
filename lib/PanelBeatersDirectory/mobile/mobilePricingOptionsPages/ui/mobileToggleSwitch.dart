import 'package:flutter/material.dart';

class MobileToggleSwitch extends StatefulWidget {
  final ValueChanged<bool> onChanged;
  final bool initialValue;

  const MobileToggleSwitch({
    Key? key,
    required this.onChanged,
    this.initialValue = false,
  }) : super(key: key);

  @override
  State<MobileToggleSwitch> createState() => _MobileToggleSwitchState();
}

class _MobileToggleSwitchState extends State<MobileToggleSwitch> {
  late bool toggleValue;

  @override
  void initState() {
    super.initState();
    toggleValue = widget.initialValue;
  }

  void toggleButton() {
    setState(() {
      toggleValue = !toggleValue;
      widget.onChanged(toggleValue);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggleButton,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 1000),
        height: 20,
        width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: toggleValue ? Colors.orange : Colors.white,
        ),
        child: Stack(
          children: <Widget>[
            AnimatedPositioned(
              duration: const Duration(milliseconds: 1000),
              curve: Curves.easeIn,
              top: 1.0,
              left: toggleValue ? 30.0 : 0.0,
              right: toggleValue ? 0.0 : 30.0,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 1000),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return ScaleTransition(scale: animation, child: child);
                },
                child: Icon(
                  Icons.circle,
                  color: toggleValue ? Colors.white : Colors.black,
                  size: 18,
                  key: ValueKey<bool>(toggleValue),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
