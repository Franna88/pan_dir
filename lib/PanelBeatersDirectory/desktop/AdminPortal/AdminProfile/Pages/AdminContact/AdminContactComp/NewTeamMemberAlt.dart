import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/Pages/AdminContact/AdminContactComp/TeamProfileAlt.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/ProfileComp/buttons/AddButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/AddmemberPopup/AddmemberPopup.dart';
import 'package:webdirectories/PanelBeatersDirectory/models/storedUser.dart';
import 'package:webdirectories/PanelBeatersDirectory/utils/loginUtils.dart';
import 'package:webdirectories/myutility.dart';

import '../../../../PopUps/PopUpsCommon/NewDeletePopUp.dart';

class NewTeamMemberAlt extends StatefulWidget {
  NewTeamMemberAlt({super.key});

  @override
  State<NewTeamMemberAlt> createState() => _NewTeamMemberAltState();
}

class _NewTeamMemberAltState extends State<NewTeamMemberAlt> {
  final _firestore = FirebaseFirestore.instance;
  List<Map<String, dynamic>> teamProfiles = [];

  Future<void> _fetchData() async {
    StoredUser? user = await getUserInfo();
    if (user == null) {
      /*setState(() {
        teamProfiles = [
          {
            'personPhoto': 'images/avatar1.png',
            'firstName': 'John',
            'surname': 'Doe',
            'shortDescription': 'Team Lead',
            'teamOrder': 1,
            'docId': 'doc1',
          },
          {
            'personPhoto': 'images/avatar2.png',
            'firstName': 'Jane',
            'surname': 'Smith',
            'shortDescription': 'Software Engineer',
            'teamOrder': 2,
            'docId': 'doc2',
          },
          {
            'personPhoto': 'images/avatar3.png',
            'firstName': 'Emily',
            'surname': 'Johnson',
            'shortDescription': 'Product Manager',
            'teamOrder': 3,
            'docId': 'doc3',
          },
          {
            'personPhoto': 'images/avatar4.png',
            'firstName': 'Michael',
            'surname': 'Brown',
            'shortDescription': 'Designer',
            'teamOrder': 4,
            'docId': 'doc4',
          },
        ];
      });
      */
      return;
    }

    QuerySnapshot teamProfilesSnapshot = await _firestore
        .collection('listings_team')
        .where('listingsId', isEqualTo: int.parse(user.id))
        .get();

    setState(() {
      teamProfiles = teamProfilesSnapshot.docs
          .map((doc) => {
                ...doc.data() as Map<String, dynamic>,
                'docId': doc.id, // Include the document ID for editing
              })
          .toList();
      teamProfiles.sort(
          (a, b) => (a['teamOrder'] as int).compareTo(b['teamOrder'] as int));
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    // Check if teamProfiles is empty or not loaded
    if (teamProfiles.isEmpty) {
      return Center(child: Text('No team profiles available'));
    }

    return Container(
      width: MyUtility(context).width,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AddButton(
                      text: 'Insert New Team Member',
                      onPressed: () {
                        showDialog(
                          context: context,
                          barrierDismissible: true,
                          barrierColor: Colors.black.withOpacity(0.5),
                          builder: (BuildContext context) {
                            return Dialog(
                              backgroundColor: Colors.transparent,
                              insetPadding: EdgeInsets.all(10),
                              child: AddMemberPopup(
                                teamProfiles: teamProfiles,
                                add: (newMember) {
                                  setState(() {
                                    teamProfiles.add(newMember);
                                  });
                                },
                              ),
                            );
                          },
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 5),
                      child: Text(
                        'Insert Contact Persons',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.6064,
                          fontFamily: 'ralewaybold',
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Recognise your skilled and ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.7364,
                              fontFamily: 'raleway',
                            ),
                          ),
                          TextSpan(
                            text:
                                'dedicated team members and their responsibilities',
                            style: TextStyle(
                              color: Color(0xFFD57629),
                              fontSize: 14.7364,
                              fontFamily: 'ralewaymedium',
                            ),
                          ),
                          TextSpan(
                            text:
                                ' within your business by inserting their information below.',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.7364,
                              fontFamily: 'raleway',
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 4),
                            child: SvgPicture.asset(
                              'images/arrows.svg',
                              width: 20,
                              height: 20,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Drag and drop to reorder list!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.73,
                              fontFamily: 'raleway',
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: MyUtility(context).height * 0.025,
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: teamProfiles.length > 12
                  ? 12
                  : teamProfiles.length, // Capped at 12 items
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, // 4 items per row
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: 1.0, // Adjust as needed for aspect ratio
              ),
              itemBuilder: (context, index) {
                final profile = teamProfiles[index];
                return Draggable<Map<String, dynamic>>(
                  data: profile,
                  feedback: Material(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.orange, width: 1),
                      ),
                      child: TeamProfileAlt(
                        memberImage: profile['personPhoto'],
                        memberName:
                            '${profile['firstName']} ${profile['surname']}',
                        memberPosition: profile['shortDescription'],
                        editButton: () {
                          // Show the popup in editing mode
                          showDialog(
                            context: context,
                            barrierDismissible: true,
                            barrierColor: Colors.black.withOpacity(0.5),
                            builder: (BuildContext context) {
                              return Dialog(
                                backgroundColor: Colors.transparent,
                                insetPadding: EdgeInsets.all(10),
                                child: AddMemberPopup(
                                  teamProfiles: teamProfiles,
                                  existingProfile:
                                      profile, // Pass the existing profile data for editing
                                  isEditing: true, // Set to editing mode
                                  add: (newMember) {},
                                  update: (updatedMember) {
                                    setState(() {
                                      teamProfiles[index] =
                                          updatedMember; // Update the profile in the list
                                    });
                                  },
                                ),
                              );
                            },
                          );
                        },
                        deleteButton: () {},
                      ),
                    ),
                  ),
                  childWhenDragging: Opacity(
                    opacity: 0.3,
                    child: TeamProfileAlt(
                      memberImage:
                          profile['personPhoto'] ?? 'default_image.png',
                      memberName:
                          '${profile['firstName'] ?? 'Unknown'} ${profile['surname'] ?? 'Unknown'}',
                      memberPosition:
                          profile['shortDescription'] ?? 'Unknown Position',
                      editButton: () {},
                      deleteButton: () {},
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DragTarget<Map<String, dynamic>>(
                      onAccept: (draggedProfile) {
                        setState(() {
                          int oldIndex = teamProfiles.indexOf(draggedProfile);
                          int newIndex = teamProfiles.indexOf(profile);
                          if (oldIndex != newIndex) {
                            teamProfiles.removeAt(oldIndex);
                            teamProfiles.insert(newIndex, draggedProfile);
                          }
                          for (int i = 0; i < teamProfiles.length; i++) {
                            teamProfiles[i]['teamOrder'] = i + 1;
                          }
                        });
                      },
                      builder: (BuildContext context,
                          List<Map<String, dynamic>?> candidateData,
                          rejectedData) {
                        return TeamProfileAlt(
                          memberImage: profile['personPhoto'],
                          memberName:
                              '${profile['firstName']} ${profile['surname']}',
                          memberPosition: profile['shortDescription'],
                          editButton: () {
                            // Show the popup in editing mode
                            showDialog(
                              context: context,
                              barrierDismissible: true,
                              barrierColor: Colors.black.withOpacity(0.5),
                              builder: (BuildContext context) {
                                return Dialog(
                                  backgroundColor: Colors.transparent,
                                  insetPadding: EdgeInsets.all(10),
                                  child: AddMemberPopup(
                                    teamProfiles: teamProfiles,
                                    existingProfile:
                                        profile, // Pass existing profile for editing
                                    isEditing: true, // Set to editing mode
                                    add: (newMember) {},
                                    update: (updatedMember) {
                                      setState(() {
                                        teamProfiles[index] =
                                            updatedMember; // Update the profile in the list
                                      });
                                    },
                                  ),
                                );
                              },
                            );
                          },
                          deleteButton: () {
                            showDialog(
                              context: context,
                              barrierDismissible: true,
                              barrierColor: Colors.black.withOpacity(0.5),
                              builder: (BuildContext context) {
                                return Dialog(
                                  backgroundColor: Colors.transparent,
                                  insetPadding: EdgeInsets.all(10),
                                  child: NewDeleteButton(
                                    documentId: profile['docId'],
                                    collectionName: 'listings_team',
                                    refreshList: () {
                                      _fetchData();
                                    },
                                  ),
                                );
                              },
                            );
                          },
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
