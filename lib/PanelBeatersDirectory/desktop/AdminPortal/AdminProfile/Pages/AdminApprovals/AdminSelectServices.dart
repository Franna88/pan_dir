import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/Pages/AdminApprovals/AdminReuseable.dart/AdminServicesCheckbox.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/components/myutility.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';

class Adminselectservices extends StatefulWidget {
  List services;
  List listingApprovalsList;
  Function getListingId;
  Function(Map) addItemToApproveList;
  Function(int) removeItemFromApprovalsList;
  Adminselectservices(
      {super.key,
      required this.services,
      required this.listingApprovalsList,
      required this.getListingId,
      required this.addItemToApproveList,
      required this.removeItemFromApprovalsList});

  @override
  State<Adminselectservices> createState() => _AdminselectservicesState();
}

class _AdminselectservicesState extends State<Adminselectservices> {
  final ScrollController _scrollController = ScrollController();

  addRemoveServices(approvalsId) async {
    //check If Service Inside collection
    if (checkIfAlreadyMarkedApproval(approvalsId)) {
// remove from approval list
      setState(() {
        int index = (widget.listingApprovalsList)
            .indexWhere((item) => item['approvalsId'] == approvalsId);
        widget.listingApprovalsList.removeAt(index);
        widget.removeItemFromApprovalsList(approvalsId);
      });
    } else {
      var listingId = await widget.getListingId();
//add to approval list
      var serviceData = {
        "approvalsId": approvalsId,
        "dateAdded": DateTime.now(),
        "listingsApprovalsId": "",
        "listingsId": listingId,
        "membersId": ""
      };

      setState(() {
        widget.addItemToApproveList(serviceData);
      });
    }
  }

//Mark check box as true or false
  checkIfAlreadyMarkedApproval(approvalsId) {
    for (var i = 0; i < widget.listingApprovalsList.length; i++) {
      if (widget.listingApprovalsList[i]['approvalsId'] == approvalsId) {
        return true;
      }
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MyUtility(context).width * 0.4,
      height: MyUtility(context).height * 0.77,
      decoration: ShapeDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.57, -0.82),
          end: Alignment(-0.57, 0.82),
          colors: [
            Color(0x19777777),
            Colors.white.withOpacity(0.4),
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
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
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              'Select Specialist Services',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.6064,
                fontFamily: 'RalewayBold',
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Please click to select or deselect services your business currently offers.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 13.7364,
                fontFamily: 'Raleway',
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: DraggableScrollbar.rrect(
                controller: _scrollController,
                backgroundColor: Colors.grey,
                alwaysVisibleScrollThumb: true,
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: widget.services.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: AdminServicesCheckBox(
                        label:
                            '${widget.services[index]['approvalsTitle']} ${widget.services[index]['approvalsId']}',
                        initialValue: checkIfAlreadyMarkedApproval(widget
                                .services[index]
                            ['approvalsId']), // Adjust initial value as needed
                        onChanged: (value) {
                          setState(() {
                            addRemoveServices(
                                widget.services[index]['approvalsId']);
                            // Handle the selection state change
                          });
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
