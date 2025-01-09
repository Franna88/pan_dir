import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:webdirectories/myutility.dart';

class AdminContactContainer extends StatefulWidget {
  final String type;
  final String contactPerson;
  final String phone;
  final String email;
  final VoidCallback pressEdit;
  final VoidCallback PressDelete;

  const AdminContactContainer(
      {super.key,
      required this.type,
      required this.contactPerson,
      required this.phone,
      required this.email,
      required this.pressEdit,
      required this.PressDelete});

  @override
  State<AdminContactContainer> createState() => _AdminContactContainerState();
}

class _AdminContactContainerState extends State<AdminContactContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        width: MyUtility(context).width * 0.9,
        height: MyUtility(context).height * 0.065,
        decoration: ShapeDecoration(
          color: Color(0xFF00437B),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              SizedBox(
                width: MyUtility(context).width * 0.195,
                child: Text(
                  widget.type,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17.68,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ),
              SizedBox(
                width: MyUtility(context).width * 0.195,
                child: Text(
                  widget.contactPerson,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17.68,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ),
              SizedBox(
                width: MyUtility(context).width * 0.12,
                child: Text(
                  widget.phone,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17.68,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ),
              Container(
                width: MyUtility(context).width * 0.2,
                child: Text(
                  widget.email,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17.68,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              SizedBox(
                  width: MyUtility(context).width * 0.08,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: GestureDetector(
                          onTap: widget.pressEdit,
                          child: SvgPicture.asset('images/edit.svg'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: GestureDetector(
                          onTap: widget.PressDelete,
                          child: SvgPicture.asset('images/delete.svg'),
                        ),
                      )
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
