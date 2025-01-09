import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:webdirectories/PanelBeatersDirectory/WeCanHelp.dart/WeInfoContaienr.dart';
import 'package:webdirectories/PanelBeatersDirectory/WeCanHelp.dart/WeText.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Footer/panelFooter.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/AccreditationService/AccreditationFilter/AccreditationFilterComp/FilterButton.dart';
import 'package:webdirectories/myutility.dart';
import 'package:webdirectories/routes/routerNames.dart';

class WeCanHelp extends StatefulWidget {
  WeCanHelp({super.key});

  @override
  _WeCanHelpState createState() => _WeCanHelpState();
}

class _WeCanHelpState extends State<WeCanHelp> {
  final ScrollController _scrollController = ScrollController();
  bool _isHovered = false;
  String? selectedFilter;

  void _onFilterSelected(String filter) {
    setState(() {
      selectedFilter = filter;
    });
  }

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;

    final filters = filterData.keys.toList();
    final selectedContent = filterData[selectedFilter ?? filters.first];

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Row(
                  children: [
                    Container(
                      height: heightDevice * 1.05,
                      width: widthDevice,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/mobileLanding.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 50),
                        child: SafeArea(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 10),
                                child: SizedBox(
                                  width: widthDevice * 0.88,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 50, top: 30),
                                          child: Image.asset(
                                            'images/panelLogo.png',
                                            width:
                                                MyUtility(context).width * 0.23,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: 50, top: 30),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              'Have Questions?',
                                              style: TextStyle(
                                                fontSize: 19,
                                                fontFamily: 'ralewaybold',
                                                color: Color(0xFFF19A41),
                                              ),
                                            ),
                                            const SizedBox(height: 8),
                                            Text(
                                              'We can help!',
                                              style: TextStyle(
                                                fontSize: 40,
                                                fontFamily: 'ralewaysemi',
                                                color: Colors.white,
                                                height: 1.2,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                width: MyUtility(context).width * 0.88,
                                margin:
                                    EdgeInsets.only(top: 20), // Adjusted margin
                                decoration: ShapeDecoration(
                                  gradient: LinearGradient(
                                    begin: const Alignment(-0.57, -0.83),
                                    end: const Alignment(0.56, 0.83),
                                    colors: [
                                      Colors.white.withOpacity(0.1),
                                      Colors.white.withOpacity(0.25),
                                    ],
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  shadows: const [
                                    BoxShadow(
                                      color: Color(0xBF000000),
                                      blurRadius: 24,
                                      offset: Offset(0, 4),
                                      spreadRadius: -1,
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 25, vertical: 25),
                                  child: Container(
                                    width: widthDevice * 0.82,
                                    height: heightDevice * 0.75,
                                    decoration: ShapeDecoration(
                                      color: Color(0xFF181B1D),
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                          width: 0.64,
                                          strokeAlign:
                                              BorderSide.strokeAlignOutside,
                                          color: Colors.white,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(9.57),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 15,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 5,
                                                    top: 10,
                                                    bottom: 10),
                                                child: Text(
                                                  "A quick guide to the Panel Beater Directory",
                                                  style: TextStyle(
                                                    color: Colors.white
                                                        .withOpacity(0.9),
                                                    fontSize: 19,
                                                    fontFamily: 'raleway',
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: widthDevice * 0.4,
                                                child: ListView.builder(
                                                  shrinkWrap: true,
                                                  physics:
                                                      NeverScrollableScrollPhysics(),
                                                  itemCount: filters.length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    final filter =
                                                        filters[index];
                                                    return Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          vertical: 0),
                                                      child: FilterButton(
                                                        servicesText: filter,
                                                        onFilterSelected:
                                                            _onFilterSelected,
                                                        isSelected:
                                                            selectedFilter ==
                                                                filter,
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                          WeInfoContainer(
                                            scrollController: _scrollController,
                                            title: selectedContent!["title"],
                                            description:
                                                selectedContent["description"],
                                            header: selectedContent["header"],
                                            bulletPoints:
                                                selectedContent["bulletPoints"],
                                            keywords:
                                                selectedContent["keywords"],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                // Add Positioned widget here
                Positioned(
                  top: 0,
                  bottom: 0,
                  right: widthDevice < 1600 ? 40 : 60,
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
                            Icons.keyboard_arrow_right_rounded,
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
