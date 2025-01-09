import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import '../../../../../myutility.dart'; // Assuming this utility file is part of your project.

class AddEditor extends StatelessWidget {
  final quill.QuillController controller; // Accept controller as a parameter
  final quill.QuillController _controller = quill.QuillController.basic();

  AddEditor({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MyUtility(context).width * 0.3,
      height: MyUtility(context).height * 0.45,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Description Label
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              'Description:',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.61,
                fontFamily: 'raleway',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),

          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Column(
                children: [
                  quill.QuillSimpleToolbar(
                    controller: _controller,
                    configurations: quill.QuillSimpleToolbarConfigurations(
                        showColorButton: true,
                        buttonOptions: quill.QuillSimpleToolbarButtonOptions(),
                        showBackgroundColorButton: true,
                        showCodeBlock: false,
                        showLink: false),
                  ),
                  Expanded(
                    child: quill.QuillEditor.basic(
                      controller: _controller,
                      configurations: quill.QuillEditorConfigurations(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
