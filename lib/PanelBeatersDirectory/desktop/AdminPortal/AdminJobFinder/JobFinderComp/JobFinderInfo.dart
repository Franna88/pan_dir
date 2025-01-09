import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/ProfileComp/buttons/AddButton.dart';
import 'package:webdirectories/myutility.dart';

import '../JobFinderDetails.dart';
import 'package:webdirectories/PanelBeatersDirectory/models/jobFinder.dart';

class JobFinderInfo extends StatelessWidget {
  final VoidCallback onPress;
  final VoidCallback onTap;
  final String year;
  final String month;
  final String day;
  final String occupation;
  final String contact;
  final String name;
  final String country;
  final String city;
  final String location;
  final bool isEven;

  // Add the JobFinderModel to the constructor
  final JobFinderModel job;

  const JobFinderInfo({
    super.key,
    required this.onPress,
    required this.onTap,
    required this.year,
    required this.month,
    required this.day,
    required this.occupation,
    required this.contact,
    required this.country,
    required this.city,
    required this.name,
    required this.location,
    required this.isEven,
    required this.job, // Include the job model
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 0, right: 20),
      child: Container(
        width: MyUtility(context).width * 0.72,
        height: MyUtility(context).height * 0.06,
        decoration: BoxDecoration(
          color: isEven ? const Color(0xFF0E1013) : const Color(0x7F292E31),
          border: Border.all(color: const Color(0xFF5B5B5B), width: 1),
          borderRadius: BorderRadius.circular(0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Date
              Expanded(
                flex: 2,
                child: Text(
                  '$year/$month/$day',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14.64,
                    fontFamily: 'raleway',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              _buildVerticalDivider(),
              // Occupation
              Expanded(
                flex: 5,
                child: Text(
                  occupation,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14.64,
                    fontFamily: 'raleway',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              _buildVerticalDivider(),
              //country
              Expanded(
                flex: 3,
                child: Text(
                  country,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14.64,
                    fontFamily: 'raleway',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              _buildVerticalDivider(),
              // Location
              Expanded(
                flex: 3,
                child: Text(
                  location,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14.64,
                    fontFamily: 'raleway',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              _buildVerticalDivider(),
              Expanded(
                flex: 3,
                child: Text(
                  city,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14.64,
                    fontFamily: 'raleway',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              _buildVerticalDivider(),
              // Name
              Expanded(
                flex: 3,
                child: Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14.64,
                    fontFamily: 'raleway',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              _buildVerticalDivider(),
              // contact
              Expanded(
                flex: 3,
                child: Text(
                  contact,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14.64,
                    fontFamily: 'raleway',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),

              _buildVerticalDivider(),
              // Icon
              Expanded(
                flex: 2,
                child: SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                    child: AddButton(text: 'View', onPressed: onTap),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVerticalDivider() {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Container(
        width: 0.5,
        height: double.infinity,
        color: const Color(0xFF5B5B5B),
      ),
    );
  }
}
