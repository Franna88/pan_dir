import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/services.dart';
import 'package:webdirectories/PanelBeatersDirectory/models/storedUser.dart';
import 'package:webdirectories/PanelBeatersDirectory/utils/loginUtils.dart';
import 'package:webdirectories/myutility.dart';
import '../DasboardComp/DashPropdown.dart';

class DashProfileView extends StatefulWidget {
  bool? admin;
  final Function(int)? onSelect; // Function to handle navigation
  final Function? onViewProfile;
  DashProfileView({
    super.key,
    this.onSelect,
    this.onViewProfile,
    this.admin,
  });

  @override
  State<DashProfileView> createState() => _DashProfileViewState();
}

class _DashProfileViewState extends State<DashProfileView> {
  StoredUser? _user;
  final _firestore = FirebaseFirestore.instance;
  String _username = '';
  bool adminView = false;

  @override
  void initState() {
    _getUsername();
    if (widget.admin != null) {
      adminView = true;
    }
    super.initState();
  }

  void _getUsername() async {
    StoredUser? user = await getUserInfo();
    if (user != null) {
      setState(() {
        _username = user.fullName;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Hi ',
                          style: TextStyle(
                            color: Color(0xFFCCCCCC),
                            fontSize: 12.95,
                            fontFamily: 'ralewaymedium',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                        TextSpan(
                          text:
                              _username.isNotEmpty ? _username : 'N4 Autocraft',
                          style: TextStyle(
                            color: Color(0xFFFF8728),
                            fontSize: 12.95,
                            fontFamily: 'ralewaymedium',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    adminView ? "Admin Portal" : 'Dashboard',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 23.8,
                      fontFamily: 'ralewaymedium',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                ],
              ),
              SizedBox(width: MyUtility(context).width * 0.025),
              Visibility(
                visible: !adminView,
                child: Container(
                  width: 356.6464,
                  height: 40.8476,
                  decoration: BoxDecoration(
                    color: Color(0xFF2C2F31),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Icon(Icons.search, color: Colors.grey),
                      ),
                      Expanded(
                        child: Padding(
                          padding:
                              const EdgeInsets.only(right: 14.0, bottom: 10),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Search relevant keywords',
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 11.95,
                                fontFamily: 'raleway',
                              ),
                              border: InputBorder.none,
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 12.0),
                            ),
                            style: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'raleway',
                              fontSize: 11.95,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Visibility(
            visible: !adminView,
            child: Row(
              children: [
                Container(
                  height: 25,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFD17226),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                    ),
                    onPressed: () {
                      widget.onViewProfile!();
                    },
                    child: Text(
                      'View Directory Profile',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 9.38,
                        fontFamily: 'raleway',
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                GestureDetector(
                  onTap: () {
                    print('Image button pressed!');
                  },
                  child: Image.asset(
                    'images/bell.png',
                    width: 20,
                    height: 20,
                  ),
                ),
                SizedBox(width: 8),
                CircleAvatar(
                  radius: 18,
                  backgroundImage: NetworkImage('images/avitar2.png'),
                ),
                SizedBox(width: 4),
                Text(
                  'MJ cronje',
                  style: TextStyle(
                    fontSize: 10.5604,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'raleway',
                  ),
                ),
                DashDropDown(
                  onSelect: widget.onSelect, // Pass the onSelect function
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
