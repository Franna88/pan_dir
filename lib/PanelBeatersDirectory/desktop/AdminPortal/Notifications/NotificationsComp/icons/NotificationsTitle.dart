import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:webdirectories/myutility.dart';

class NotificationTitle extends StatefulWidget {
  final String notificationTitle;
  final String year;
  final String month;
  final String day;

  const NotificationTitle({
    super.key,
    required this.notificationTitle,
    required this.year,
    required this.month,
    required this.day,
  });

  @override
  State<NotificationTitle> createState() => _NotificationTitleState();
}

class _NotificationTitleState extends State<NotificationTitle> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        width: MyUtility(context).width * 0.72,
        height: MyUtility(context).height * 0.06,
        decoration: ShapeDecoration(
          color: Color(0xFF0F253A),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: MyUtility(context).width * 0.525,
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Text(
                          widget.notificationTitle,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.96,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            decoration: TextDecoration.underline,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: MyUtility(context).width * 0.15,
                child: Text(
                  '${widget.day}/${widget.month}/${widget.year}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.96,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
                child: SvgPicture.asset('images/dashboard.svg'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
