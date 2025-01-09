import 'package:flutter/material.dart';

import 'package:webdirectories/myutility.dart';

import 'TextFiendsMobile/PostComentTextFieldMobile.dart';
import 'TextFiendsMobile/PostCommentEmailMobile.dart';
import 'TextFiendsMobile/PostCommentSortMobile.dart';

class ArticlesPostCommentMobile extends StatefulWidget {
  final Color? otherDirectoryButtonColor;
  final Color? otherDirectoryTextColor;
  final bool? whiteText;
  const ArticlesPostCommentMobile(
      {super.key,
      this.otherDirectoryButtonColor,
      this.otherDirectoryTextColor, this.whiteText});

  @override
  State<ArticlesPostCommentMobile> createState() =>
      _ArticlesPostCommentMobileState();
}

class _ArticlesPostCommentMobileState extends State<ArticlesPostCommentMobile> {
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController emailAddress = TextEditingController();
  final TextEditingController message = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 10),
          child: Text(
            'Like the article? ',
            style: TextStyle(
              color: Colors.black,
              fontSize: 23.8,
              fontFamily: 'ralewaysemi',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            bottom: 20,
          ),
          child: Container(
            width: 770.8,
            //height: MyUtility(context).height * 0.46,
            decoration: ShapeDecoration(
              color: Color(0xFFEFECEC),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.16),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Join the conversation!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: widget.otherDirectoryTextColor == null ?  Color(0xFFE5882F) : widget.otherDirectoryTextColor,
                      fontSize: 17,
                      fontFamily: 'ralewaysemi',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 0.0, vertical: 10.0),
                    child: Text(
                      'This is a space for respectful conversation. Let’s keep all comments productive and inclusive and the discussion focused on the content of the article, any hateful, offensive and disrespectful language will be removed.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF606060),
                        fontSize: 11.56,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'raleway',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PostcommentsortMobile(
                          hintText: 'First Name', controller: firstName),
                      PostcommentsortMobile(
                          hintText: 'Last Name', controller: lastName),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  PostCommentEmailMobile(controller: emailAddress),
                  const SizedBox(
                    height: 8,
                  ),
                  PostCommentTextFieldMobile(controller: message),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: SizedBox(
                      width: MyUtility(context).width * 0.8,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: widget.otherDirectoryButtonColor == null ? Color(0xFFFF8728) : widget.otherDirectoryButtonColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.40),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 10),
                            ),
                            onPressed: () {},
                            child: Text(
                              'Post Comment',
                              style: TextStyle(
                                color: widget.whiteText == null ? Colors.black : Colors.white,
                                fontSize: 11.56,
                                fontFamily: 'raleway',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
