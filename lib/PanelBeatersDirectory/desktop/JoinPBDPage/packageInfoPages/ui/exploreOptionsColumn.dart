import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JoinPBDPage/packageInfoPages/ui/exploreOptionsContainer.dart';

class ExploreOptionsColumn extends StatefulWidget {
  List exploreOptionsList;
  ExploreOptionsColumn({super.key, required this.exploreOptionsList});

  @override
  State<ExploreOptionsColumn> createState() => _ExploreOptionsColumnState();
}

class _ExploreOptionsColumnState extends State<ExploreOptionsColumn> {
  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Want more?',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontFamily: 'ralewaymeduim',
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          'Explore other Options',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 35,
            fontFamily: 'ralewaybold',
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            for (var i = 0; i < widget.exploreOptionsList.length; i++)
              ExploreOptionsContainer(
                  assetName: widget.exploreOptionsList[i]['assetName'],
                  description: widget.exploreOptionsList[i]['description'],
                  mainTitle: widget.exploreOptionsList[i]['mainTitle'],
                  buttonText: widget.exploreOptionsList[i]['buttonText']),
          ],
        ),
      ],
    );
  }
}

/* ExploreOptionsContainer(
                assetName: 'images/exploreOptions2.png',
                description:
                    'Boost your online presence with SEO & real-\ntime profile updates. Connect with industry \ntalent.',
                mainTitle: 'More leads. \nMore control',
                buttonText: 'Core Option'),
            ExploreOptionsContainer(
                assetName: 'images/exploreOptions1.png',
                description: 'Go beyond basics. Unlock advanced features, \nbuild trust with detailed profiles, showcase \nexpertise and streamline operations for a \ncustomer-centric experience. ',
                mainTitle: 'Dominate online \nsearches',
                buttonText: 'Premium Option')*/ 
