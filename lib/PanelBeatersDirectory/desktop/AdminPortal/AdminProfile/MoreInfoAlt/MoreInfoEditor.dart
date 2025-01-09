import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;

class MoreInfoEditor extends StatefulWidget {
  @override
  _MoreInfoEditorState createState() => _MoreInfoEditorState();
}

class _MoreInfoEditorState extends State<MoreInfoEditor> {
  final quill.QuillController _controller = quill.QuillController.basic();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 900,
      height: 300,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
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
    );
  }
}
