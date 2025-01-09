import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class PostCommentTextFieldMobile extends StatefulWidget {
  final TextEditingController controller;

  const PostCommentTextFieldMobile({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<PostCommentTextFieldMobile> createState() =>
      _PostCommentTextFieldMobileState();
}

class _PostCommentTextFieldMobileState
    extends State<PostCommentTextFieldMobile> {
  static const int maxCharacters = 1000;
  late int remainingCharacters;

  @override
  void initState() {
    super.initState();
    remainingCharacters = maxCharacters - widget.controller.text.length;
    widget.controller.addListener(_updateCharacterCount);
  }

  void _updateCharacterCount() {
    setState(() {
      remainingCharacters = maxCharacters - widget.controller.text.length;
    });
  }

  @override
  void dispose() {
    widget.controller.removeListener(_updateCharacterCount);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          width: MyUtility(context).width * 0.85,
          decoration: ShapeDecoration(
            color: Colors.transparent,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                color: Colors.black.withOpacity(0.7),
              ),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          child: TextFormField(
            controller: widget.controller,
            maxLength: maxCharacters,
            maxLines: null,
            minLines: 1,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 13.56,
              fontFamily: 'Raleway',
            ),
            decoration: InputDecoration(
              hintText: '*Message',
              hintStyle: TextStyle(
                color: Colors.black.withOpacity(0.7),
                fontSize: 13.56,
                fontFamily: 'raleway',
              ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 14,
                horizontal: 8,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8.0, top: 8.0),
          child: Text(
            '$remainingCharacters characters left',
            style: const TextStyle(
              color: Color(0xFF616060),
              fontSize: 8.84,
              fontStyle: FontStyle.italic,
              fontFamily: 'raleway',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
