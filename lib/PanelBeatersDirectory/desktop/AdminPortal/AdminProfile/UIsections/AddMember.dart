import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/ProfileComp/TeamProfile.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/ProfileComp/buttons/AddButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/AddmemberPopup/AddmemberPopup.dart';
import 'package:webdirectories/PanelBeatersDirectory/models/BusinessProfile/BusinessTeamMemberProfile.dart';
import 'package:webdirectories/PanelBeatersDirectory/models/storedUser.dart';
import 'package:webdirectories/PanelBeatersDirectory/utils/loginUtils.dart';
import 'package:webdirectories/myutility.dart';

class AddMember extends StatefulWidget {
  AddMember({super.key});

  @override
  State<AddMember> createState() => _AddMemberState();
}

class _AddMemberState extends State<AddMember> {
  final _firestore = FirebaseFirestore.instance;

  List<Map<String, dynamic>> _teamProfiles = [];

  @override
  void initState() {
    _fetchData();
    super.initState();
  }

  Future<void> _fetchData() async {
    StoredUser? user = await getUserInfo();
    if (user == null) {
      return;
    }
    // Fetch team profiles
    QuerySnapshot teamProfilesSnapshot = await _firestore
        .collection('listings_team')
        .where('listingsId', isEqualTo: int.parse(user.id))
        .get();

    if (teamProfilesSnapshot.docs.isNotEmpty) {
      setState(() {
        _teamProfiles = teamProfilesSnapshot.docs
            .map((doc) => doc.data() as Map<String, dynamic>)
            .toList();
      });
    }
  }

  void addMember(Map<String, dynamic> newMember) {
    setState(() {
      _teamProfiles.add(newMember);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MyUtility(context).width,
        decoration: BoxDecoration(color: Color(0xFFF4F4F4)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MyUtility(context).width * 0.10,
                  ),
                  Text(
                    'Team',
                    style: TextStyle(
                      color: Color(0xFF0F253A),
                      fontSize: 20.4,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      height: 1.2,
                    ),
                  ),
                  AddButton(
                    text: 'Add Member',
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
                                teamProfiles: _teamProfiles, add: addMember),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MyUtility(context).height * 0.025,
            ),
            Expanded(
                child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: _teamProfiles.map((profile) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TeamProfile(
                      memberImage: profile['personPhoto'],
                      memberName:
                          '${profile['firstName']} ${profile['surname']}',
                      memberPosition: profile['shortDescription'],
                    ),
                  );
                }).toList(),
              ),
            )),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: MyUtility(context).width,
                    height: 1,
                    color: Color(0xFF0F253A),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
