import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/panelBeatersHome.dart';

class DashDropDown extends StatelessWidget {
  final Function(int)? onSelect; // Function to navigate

  const DashDropDown({Key? key, required this.onSelect}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (value) {
        print("Selected: $value");
        switch (value) {
          case 'Profile':
            if (onSelect != null) {
              print("Navigating to page 14");
              onSelect!(14); // Pass index 14 for Profile
            } else {
              print('onSelect callback is null');
            }
            break;
          case 'Logout':
            print('Logout selected');
            // Implement your logout logic here
            print('Executing logout...');
            FirebaseAuth.instance.signOut();
            // For example, call your authentication service to log out
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PanelBeatersHome()),
            );
            break;
        }
      },
      icon: Icon(
        Icons.arrow_drop_down,
        size: 28,
        color: Colors.white,
      ),
      itemBuilder: (BuildContext context) {
        return [
          PopupMenuItem<String>(
            value: 'Profile',
            child: Text('My Profile', style: TextStyle(fontFamily: 'Raleway')),
          ),
          PopupMenuItem<String>(
            value: 'Logout',
            child: Text('Logout', style: TextStyle(fontFamily: 'Raleway')),
          ),
        ];
      },
    );
  }

  void _handleLogout() {
    // Implement your logout logic here
    print('Executing logout...');
    FirebaseAuth.instance.signOut();
  }
}
