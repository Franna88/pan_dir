import 'package:flutter/material.dart';

import 'package:webdirectories/PanelBeatersDirectory/desktop/navPage/nav.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/mobileView.dart';
import 'package:webdirectories/myutility.dart';

import 'desktop/AdminPortal/SideNavBar/SideNavBar.dart';

class PanelBeatersHome extends StatefulWidget {
  const PanelBeatersHome({super.key});

  @override
  State<PanelBeatersHome> createState() => _PanelBeatersHomeState();
}

class _PanelBeatersHomeState extends State<PanelBeatersHome> {
  @override
  Widget build(BuildContext context) {
    return MyUtility(context).width < 600
        ? MobileView()
        : Nav(); //SideNavBar(); // //;
  }
}
