import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Dashboard/DasboardComp/JobFinderReuseable.dart';
import 'package:webdirectories/PanelBeatersDirectory/models/jobFinder.dart';
import 'package:webdirectories/myutility.dart';

class JobFinderOverviewContainer extends StatefulWidget {
  const JobFinderOverviewContainer({super.key});

  @override
  State<JobFinderOverviewContainer> createState() =>
      _JobFinderOverviewContainerState();
}

class _JobFinderOverviewContainerState
    extends State<JobFinderOverviewContainer> {
  final _firestore = FirebaseFirestore.instance;
  String _searchQuery = '';
  List<JobFinderModel> _jobData = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchJobData();
  }

  void _fetchJobData() async {
    String id = '';
    try {
      // Create a list of futures for each query
      final futures = [
        _firestore
            .collection('job_finder')
            .limit(5)
            .orderBy('dateSubmitted', descending: true)
            .get(),
        _firestore.collection('country').get(),
        _firestore.collection('province').get(),
        _firestore.collection('city').get(),
        _firestore.collection('job_occupation').get(),
      ];

      // Wait for all futures to complete in parallel
      final results = await Future.wait(futures);

      // Extract the results
      QuerySnapshot<Map<String, dynamic>> jobSnapshot = results[0];
      QuerySnapshot<Map<String, dynamic>> countrySnapshot = results[1];
      QuerySnapshot<Map<String, dynamic>> provinceSnapshot = results[2];
      QuerySnapshot<Map<String, dynamic>> citySnapshot = results[3];
      QuerySnapshot<Map<String, dynamic>> occupationSnapshot = results[4];

      if (jobSnapshot.docs.isNotEmpty) {
        List<JobFinderModel> jobData = [];

        for (var doc in jobSnapshot.docs) {
          id = doc.data()['jobFinderId'].toString();
          String? years = doc.data()['yearsId'] == 0
              ? ''
              : jobYearsData[doc.data()['yearsId']];
          String country = doc.data()['countryId'] == 0
              ? ''
              : countrySnapshot.docs
                  .where((country) =>
                      country['countryId'] == doc.data()['countryId'])
                  .first
                  .data()['country'];
          String occupation = doc.data()['occupationId'] == 0
              ? ''
              : occupationSnapshot.docs
                  .where((occupation) =>
                      occupation['occupationId'] == doc.data()['occupationId'])
                  .first
                  .data()['occupation'];
          String province = doc.data()['provinceId'] == 0
              ? ''
              : provinceSnapshot.docs
                  .where((province) =>
                      province['provinceId'] == doc.data()['provinceId'])
                  .first
                  .data()['province'];
          String city = doc.data()['cityId'] == 0
              ? ''
              : citySnapshot.docs
                  .where((city) => city['cityId'] == doc.data()['cityId'])
                  .first
                  .data()['city'];
          jobData.add(JobFinderModel(
            name: doc.data()['name'],
            email: doc.data()['emailAddress'],
            qualification: doc.data()['qualifications'],
            city: city,
            province: province,
            country: country,
            occupation: occupation,
            years: years ?? '0 years',
            contactNumber: doc.data()['contactNumber'],
            dateSubmitted: doc.data()['dateSubmitted'],
          ));
        }

        setState(() {
          _jobData = jobData;
          _isLoading = false;
        });
      } else {
        if (!mounted) return;

        setState(() {
          _isLoading = false;
        });
      }
    } catch (e) {
      if (!mounted) return;

      setState(() {
        _isLoading = false;
      });

      print('error fetching job data: $e at $id');

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Something went wrong. Please try again')),
      );
    }
  }

  final Map<int, String> jobYearsData = {
    1: "0 year",
    2: "1 year",
    3: "2 years",
    4: "3 years",
    5: "4 years",
    6: "5 years",
    7: "6 years",
    8: "7 years",
    9: "8 years",
    10: "9 years",
    11: "10 years",
    12: "11 years",
    13: "12 years",
    14: "13 years",
    15: "14 years",
    16: "15 years",
    17: "16 years",
    18: "17 years",
    19: "18 years",
    20: "19 years",
    21: "20 years",
    22: "more than 20 years"
  };

  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    var heightDevice = MediaQuery.of(context).size.height;
    return Container(
      width: widthDevice < 1500 ? 507.28 : widthDevice * 0.33,
      height: widthDevice < 1500 ? 314.84 : heightDevice * 0.35,
      // width: ,
      // height: ,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  'Job Finder',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: widthDevice < 1500 ? 13.6 : 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4, bottom: 8),
                child: Text(
                  'Overview of latest entries',
                  style: TextStyle(
                    color: Color(0xFFAEAEAE),
                    fontSize: widthDevice < 1500 ? 10.88 : 12,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 3, bottom: 10),
                child: Container(
                  width: widthDevice,
                  height: 40.8,
                  decoration: ShapeDecoration(
                    color: Color(0xFF212529),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text(
                          'Applied Date',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13.6,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                      Text(
                        'Occupation',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.6,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                      SizedBox(
                        width: MyUtility(context).width * 0.02,
                      ),
                      Text(
                        'Contact',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.6,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                      SizedBox(
                        width: MyUtility(context).width * 0.075,
                      )
                    ],
                  ),
                ),
              ),
              _jobData.isEmpty
                  ? const Center(
                      child: Text('No Jobs Found'),
                    )
                  : Container(
                      height: widthDevice < 1500 ? 314.84 : heightDevice * 0.3,
                      child: ListView.builder(
                        itemCount: _jobData.length,
                        itemBuilder: (context, index) {
                          final job = _jobData[index];
                          return JobFinderReuseable(
                            appliedDate:
                                '${job.dateSubmitted.toDate().year}-${job.dateSubmitted.toDate().month}-${job.dateSubmitted.toDate().day}',
                            occupation: job.occupation,
                            contact: job.contactNumber,
                            onPress: () {},
                          );
                        },
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
