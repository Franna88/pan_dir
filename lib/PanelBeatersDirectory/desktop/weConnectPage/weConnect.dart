import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/weConnectPage/weConnectMainPage/weConnectMainPage.dart';

class WeConnect extends StatefulWidget {
  const WeConnect({super.key});

  @override
  State<WeConnect> createState() => _WeConnectState();
}

class _WeConnectState extends State<WeConnect> {
  @override
  Widget build(BuildContext context) {
    return WeConnectMainPage(
      goToLandingPageDisplay: () {},
    );
  }
}
