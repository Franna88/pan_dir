import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/components/descriptionDialog.dart';
import 'package:webdirectories/SuperAdmin/newPlanSubmissions/models/NewPlanSubmissionsModel.dart';
import 'package:webdirectories/SuperAdmin/newPlanSubmissions/ui/NewPlanSubmissionsPopup.dart';
import 'package:webdirectories/SuperAdmin/newPlanSubmissions/ui/newPlanSubmissionsContainer.dart';
import 'package:webdirectories/myutility.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/components/confirmDialog.dart';

class NewPlanSubmissions extends StatefulWidget {
  const NewPlanSubmissions({super.key});

  @override
  State<NewPlanSubmissions> createState() => _NewPlanSubmissionsState();
}

class _NewPlanSubmissionsState extends State<NewPlanSubmissions> {
  String _searchQuery = "";

  getSearchValue(document) {
    if ((_searchQuery) == "") {
      return true;
    } else if ((_searchQuery.toLowerCase())
            .contains(document['mbrCompanyName'].toLowerCase()) ||
        (_searchQuery.toLowerCase()).contains(document['brid'].toLowerCase()) ||
        (_searchQuery.toLowerCase())
            .contains(document['mbrTradingName'].toLowerCase())) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> deleteSubmission(String id) async {
    try {
      await FirebaseFirestore.instance.collection('plan_info').doc(id).delete();
    } catch (e) {
      print('Error deleting submission: $e');
      showDialog(
        context: context,
        builder: (context) => Dialog(
            child: DescriptionDialog(
                description: 'Something went wrong. Please try again.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MyUtility(context).width * 0.9,
        child: Padding(
          padding: const EdgeInsets.only(top: 20, right: 20),
          child: Container(
            width: MyUtility(context).width * 0.9,
            decoration: ShapeDecoration(
              gradient: LinearGradient(
                begin: Alignment(0.57, -0.82),
                end: Alignment(-0.57, 0.82),
                colors: [
                  Color(0x19777777),
                  Colors.white.withOpacity(0.4000000059604645)
                ],
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              shadows: [
                BoxShadow(
                  color: Color(0xBF000000),
                  blurRadius: 24,
                  offset: Offset(0, 4),
                  spreadRadius: -1,
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 15),
                    child: Container(
                      width: MyUtility(context).width * 0.9,
                      height: MyUtility(context).height * 0.065,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Text(
                                'Date Added',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.6064,
                                  fontFamily: 'ralewaybold',
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Text(
                                'Name',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.6064,
                                  fontFamily: 'ralewaybold',
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Text(
                                'Email',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.6064,
                                  fontFamily: 'ralewaybold',
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Text(
                                'Phone Number',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.6064,
                                  fontFamily: 'ralewaybold',
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                'Data',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.6064,
                                  fontFamily: 'ralewaybold',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('plan_info')
                        .orderBy('dateAdded', descending: true)
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return SelectableText(
                            'Error: snapshot error ${snapshot.error}',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold));
                      }
                      if (!snapshot.hasData) {
                        return const Text('Loading...',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold));
                      }

                      final List<DocumentSnapshot> documents =
                          snapshot.data!.docs;
                      if (documents.isEmpty) {
                        return Center(
                            child: Text('No data yet',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)));
                      }

                      return Container(
                        color: Colors.transparent,
                        width: MyUtility(context).width -
                            (MyUtility(context).width * 0.25),
                        height: 410,
                        //color: Colors.transparent,
                        child: ListView.builder(
                          itemCount: documents.length,
                          itemBuilder: (BuildContext context, int index) {
                            final DocumentSnapshot document = documents[index];
                            final NewPlanSubmissionsModel dataModel =
                                NewPlanSubmissionsModel.fromMap(
                                    document.data() as Map<String, dynamic>);
                            return Visibility(
                              visible: getSearchValue(document),
                              child: NewPlanSubmissionsContainer(
                                planInfoData: dataModel,
                                isEven: index % 2 == 0,
                                onViewTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return Dialog(
                                        backgroundColor: Color(0xFF181B1D),
                                        child: NewPlanSubmissionPopup(
                                          data: dataModel,
                                          closeDialog: () =>
                                              Navigator.pop(context),
                                        ),
                                      );
                                    },
                                  );
                                },
                                onDeleteTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return Dialog(
                                          child: ConfirmDialog(
                                        description:
                                            "Are you sure you want to delete this submission?",
                                        onConfirm: () async {
                                          await deleteSubmission(document.id);
                                          Navigator.pop(context);
                                          showDialog(
                                            context: context,
                                            builder: (context) => Dialog(
                                              child: DescriptionDialog(
                                                  description:
                                                      'Submission deleted successfully.'),
                                            ),
                                          );
                                        },
                                        onCancel: () {
                                          Navigator.pop(context);
                                        },
                                      ));
                                    },
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
