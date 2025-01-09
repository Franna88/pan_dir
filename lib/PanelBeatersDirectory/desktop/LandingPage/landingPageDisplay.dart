import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Footer/panelFooter.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/LandingPage/category/categorySelect.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/LandingPage/menus/approvalsServices.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/LandingPage/menus/findAllPanelBeatersmenu.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/LandingPage/menus/fuelTowingRepairMenu.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/LandingPage/menus/newsMenu.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/LandingPage/menus/watifMenu.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/LandingPage/menus/menuComponents/glassContainer.dart';
import 'package:webdirectories/myutility.dart';
import 'package:webdirectories/routes/routerNames.dart';

class LandingPageDisplay extends StatefulWidget {
  final VoidCallback viewServiceDetails;
  final VoidCallback viewServicesByArea;
  final Function(Map<String, dynamic>) viewServicesByAddress;
  final VoidCallback viewServicesByKeyword;
  final VoidCallback goToWeConnectMainPage;

  const LandingPageDisplay({
    super.key,
    required this.goToWeConnectMainPage,
    required this.viewServicesByArea,
    required this.viewServicesByAddress,
    required this.viewServicesByKeyword,
    required this.viewServiceDetails,
  });

  @override
  State<LandingPageDisplay> createState() => _LandingPageDisplayState();
}

class _LandingPageDisplayState extends State<LandingPageDisplay> {
  int menuIndex = 1;
  bool _isHovered = false;

  void changeMenu(int value) {
    setState(() {
      menuIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;

    List infoContainers = [
      WatifMenu(),
      FindAllPanelBeaters(
        viewServiceDetails: widget.viewServiceDetails,
        viewServiceByAddress: widget.viewServicesByAddress,
        viewServiceByKeyword: widget.viewServicesByKeyword,
        viewServicebyArea: widget.viewServicesByArea,
      ),
      ApprovalsServices(),
      NewsMenu(),
      FuelTowingRepairMenu(),
    ];

    return Material(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: MyUtility(context).height * 1.1,
                  width: MyUtility(context).width,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/LandingHeroIMG.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: heightDevice * 0.05),
                      Padding(
                        padding: const EdgeInsets.only(left: 50),
                        child: Image.asset(
                          'images/panelLogo.png',
                          width: MyUtility(context).width * 0.23,
                        ),
                      ),
                      SizedBox(height: heightDevice * 0.03),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (widthDevice > 1477)
                            SizedBox(width: widthDevice * 0.06),
                          CategorySelect(
                            menuIndex: menuIndex,
                            changeMenu: changeMenu,
                          ),
                          SizedBox(width: widthDevice * 0.05),
                          GlassEffect(
                            child: Center(
                              child: infoContainers[menuIndex],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: widthDevice < 1600 ? 40 : 60,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: MouseRegion(
                        onEnter: (_) {
                          setState(() {
                            _isHovered = true;
                          });
                        },
                        onExit: (_) {
                          setState(() {
                            _isHovered = false;
                          });
                        },
                        child: GestureDetector(
                          onTap: () {
                            context.goNamed(Routernames.panelbeatersWeConnect);
                          },
                          child: Icon(
                            Icons.keyboard_arrow_left_rounded,
                            size: heightDevice * 0.12,
                            color:
                                _isHovered ? Colors.white : Color(0xFFFF8828),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            PanelFooter(),
          ],
        ),
      ),
    );
  }
}
