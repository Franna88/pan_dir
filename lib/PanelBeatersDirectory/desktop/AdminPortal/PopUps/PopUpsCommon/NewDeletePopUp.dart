import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/PopUpsCommon/PopUpsCancel.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/components/myutility.dart';

class NewDeleteButton extends StatefulWidget {
  final String? documentId; // Allow the document ID to be nullable
  final String? collectionName;
  final bool? changeActive;
  final VoidCallback? refreshList;

  const NewDeleteButton(
      {Key? key,
      required this.documentId,
      this.collectionName,
      this.changeActive,
      this.refreshList})
      : super(key: key);

  @override
  State<NewDeleteButton> createState() => _NewDeleteButtonState();
}

class _NewDeleteButtonState extends State<NewDeleteButton> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  deleteAsInactive() async {
    try {
      await _firestore
          .collection(widget.collectionName!)
          .doc(widget.documentId)
          .update({"isActive": 0}).whenComplete(() {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Record set as InActive Successfully!')),
        );
        Navigator.of(context).pop(); // Close the popup after deleting
        widget.refreshList!();
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to delete record: $e')),
      );
    }
  }

  // Function to delete the document from Firestore
  Future<void> _deleteDocument() async {
    if (widget.documentId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Document ID is null! Unable to delete.')),
      );
      return;
    }

    deleteAsInactive();

    try {
      await _firestore
          .collection(widget.collectionName!)
          .doc(widget.documentId)
          .delete()
          .whenComplete(() {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Record deleted successfully!')),
        );
        Navigator.of(context).pop(); // Close the popup after deleting
        widget.refreshList!();
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to delete record: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _isLoading
          ? const CircularProgressIndicator(
              color: Colors.black,
            )
          : Container(
              width: MyUtility(context).width * 0.26,
              height: MyUtility(context).height * 0.28,
              decoration: ShapeDecoration(
                color: Color(0xFFD9D9D9),
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    strokeAlign: BorderSide.strokeAlignOutside,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MyUtility(context).width,
                    height: MyUtility(context).height * 0.06,
                    decoration: ShapeDecoration(
                      color: Color(0xFFE52F2F),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.09),
                          topRight: Radius.circular(8.09),
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text(
                            'Delete Entry',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.61,
                              fontFamily: 'raleway',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        CloseButton(
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MyUtility(context).width * 0.12,
                        child: Text(
                          widget.changeActive != null
                              ? 'Are you sure you want to set record as InActive'
                              : 'Are you sure you want to delete this record?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.73,
                            fontFamily: 'raleway',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: PopUpsCancel(
                          text: 'Delete',
                          onTap: () {
                            if (widget.changeActive != null) {
                              deleteAsInactive();
                            } else {
                              _deleteDocument(); // Call the delete function here
                            }
                          },
                          buttonColor: Color(0xFFE52F2F),
                        ),
                      ),
                      PopUpsCancel(
                        text: 'Cancel',
                        onTap: () {
                          Navigator.of(context).pop(); // Close the popup
                        },
                        buttonColor: Color(0xFF3C4043),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
    );
  }
}
