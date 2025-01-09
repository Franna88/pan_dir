import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class PostCommentTextField extends StatefulWidget {
  final TextEditingController controller;

  const PostCommentTextField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<PostCommentTextField> createState() => _PostCommentTextFieldState();
}

class _PostCommentTextFieldState extends State<PostCommentTextField> {
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
          width: MyUtility(context).width * 0.4,
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
              fontSize: 16,
              fontFamily: 'Raleway',
            ),
            decoration: InputDecoration(
              hintText: '*Message',
              hintStyle: TextStyle(
                color: Colors.black.withOpacity(0.7),
                fontSize: 16,
                fontFamily: 'raleway',
              ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 12,
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
              fontSize: 17,
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
