import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/LandingPage/menus/findAllPanelBeatersmenu.dart';
import 'package:webdirectories/myutility.dart';

class MainContainer extends StatefulWidget {
  int menuIndex;
  Function(int) changeMenu;
  MainContainer({super.key, required this.changeMenu, required this.menuIndex});

  @override
  State<MainContainer> createState() => _MainContainerState();
}

class _MainContainerState extends State<MainContainer> {
  @override
  Widget build(BuildContext context) {
    double width = MyUtility(context).width;

    changeIndex() {
      setState(() {
        var value = widget.menuIndex + 1;
        widget.changeMenu(value);
      });
    }

    return Container(
      width: 500,
      /*height: 571,*/
      decoration: ShapeDecoration(
        gradient: LinearGradient(
          begin: const Alignment(0.0, 0.0),
          end: const Alignment(0.0, 0.0),
          colors: [
            Colors.white.withOpacity(0.10000000149011612),
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
          ),
        ],
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "<  ",
                style: TextStyle(
                    fontSize: 22, color: Color.fromARGB(255, 255, 255, 255)),
              ),
              Text(
                "${widget.menuIndex + 1} / 5 ",
                style: const TextStyle(
                    fontSize: 18, color: Color.fromARGB(255, 255, 255, 255)),
              ),
              GestureDetector(
                onTap: () {},
                child: const Text(
                  "  >",
                  style: TextStyle(
                      fontSize: 22, color: Color.fromARGB(255, 255, 255, 255)),
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),

          /*ApprovalsServicesDark()*/
          /*AreaSearch()*/
          //FindAllPanelBeaters(viewServiceDetails: () {  },)
        ],
      ),
    );
  }
}
