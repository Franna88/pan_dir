import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JobFinder/JobFindaContainer/DreamJob/DreamJob.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JobFinder/JobFindaContainer/InfoContainer/InfoCOntainer.dart';
import 'package:webdirectories/myutility.dart';

class JobFinderContainer extends StatefulWidget {
  const JobFinderContainer({super.key});

  @override
  State<JobFinderContainer> createState() => _JobFinderContainerState();
}

class _JobFinderContainerState extends State<JobFinderContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MyUtility(context).width * 0.845,
      height: MyUtility(context).height * 0.73,
      decoration: ShapeDecoration(
        color: Color(0xFF181B1D),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 0.64,
            strokeAlign: BorderSide.strokeAlignOutside,
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(9.57),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [DreamJob(), InfoContainer()],
      ),
    );
  }
}
