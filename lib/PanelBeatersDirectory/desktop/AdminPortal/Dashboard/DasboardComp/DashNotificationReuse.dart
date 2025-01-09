import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/components/myutility.dart';

class DashNotificationReuse extends StatefulWidget {
  final String date;
  final String position;

  const DashNotificationReuse({
    super.key,
    required this.date,
    required this.position,
  });

  @override
  State<DashNotificationReuse> createState() => _DashNotificationReuseState();
}

class _DashNotificationReuseState extends State<DashNotificationReuse> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4, bottom: 4, right: 20),
      child: Container(
        width: MyUtility(context).width * 0.28,
        height: 36.68,
        decoration: ShapeDecoration(
          color: Color(0xFF3C4043),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          shadows: [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 4,
              offset: Offset(0, 4),
              spreadRadius: 0,
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 25),
                child: Text(
                  widget.date,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 7.40,
                    fontStyle: FontStyle.italic,
                    fontFamily: 'raleway',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(
                width: MyUtility(context).width * 0.16,
                child: Text(
                  widget.position,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8999999761581421),
                    fontSize: 10.2,
                    fontFamily: 'raleway',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Spacer(),
              IconButton(
                icon: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.white,
                  size: 18,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
