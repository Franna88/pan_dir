import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:webdirectories/myutility.dart';

class DocumentsContainer extends StatefulWidget {
  final String title;
  final String category;
  final String subCategory;
  final VoidCallback pressEdit;
  final VoidCallback PressDelete;

  const DocumentsContainer(
      {super.key,
      required this.title,
      required this.category,
      required this.subCategory,
      required this.pressEdit,
      required this.PressDelete});

  @override
  State<DocumentsContainer> createState() => _DocumentsContainerState();
}

class _DocumentsContainerState extends State<DocumentsContainer> {
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
                width: MyUtility(context).width * 0.26,
                child: Text(
                  widget.title,
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
                width: MyUtility(context).width * 0.26,
                child: Text(
                  widget.category,
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
                width: MyUtility(context).width * 0.17,
                child: Text(
                  widget.subCategory,
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
                  width: MyUtility(context).width * 0.1,
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
