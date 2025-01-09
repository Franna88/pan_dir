import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class MoreBusinessInfo extends StatefulWidget {
  final TextEditingController controller;

  const MoreBusinessInfo({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<MoreBusinessInfo> createState() => _MoreBusinessInfoState();
}

class _MoreBusinessInfoState extends State<MoreBusinessInfo> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          Text(
            'More Info about Bussiness',
            style: TextStyle(
              color: Color(0xFF0F253A),
              fontSize: 20.4,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
              height: 1,
            ),
          ),
          SizedBox(height: 8),
          Container(
            width: MyUtility(context).width * 0.755,
            height: MyUtility(context).height * 0.17,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextFormField(
                controller: widget.controller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                ),
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Inter',
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 30, left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: MyUtility(context).width ,
                  height: 1,
                  decoration: BoxDecoration(color: Color(0xFF0F253A)),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
