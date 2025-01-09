import 'package:cached_firestorage/lib.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Dashboard/DashboardContainers/DashProfileView.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Notifications/NotificationMessage.dart/NotMessageReuseable/MessageText.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Notifications/NotificationMessage.dart/NotMessageReuseable/QuotationRequests.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Notifications/NotificationsComp/icons/NotificationSearch.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Notifications/NotificationsComp/icons/ReuseableiconButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/models/notifications.dart';
import 'package:webdirectories/PanelBeatersDirectory/models/storedUser.dart';
import 'package:webdirectories/PanelBeatersDirectory/utils/loginUtils.dart';
import 'package:webdirectories/myutility.dart';

import 'NotMessageReuseable/BackButtonMessage.dart';
import 'NotMessageReuseable/CircleAvitarReuseable.dart';

class NotificationMessage extends StatefulWidget {
  final Function(int) navigateToPage;
  NotificationsModel notificationData;
  NotificationMessage(
      {super.key,
      required this.navigateToPage,
      required this.notificationData});

  @override
  State<NotificationMessage> createState() => _NotificationMessageState();
}

class _NotificationMessageState extends State<NotificationMessage> {
  final _firestore = FirebaseFirestore.instance;
  var from = "";
  var email = "";
  var contact = "";
  var make = "";
  var model = "";
  var images = [];

  Map data = {};
  changeReadTrue() {
    _firestore
        .collection('notificationMessages')
        .doc(widget.notificationData.notificationsId)
        .update({"read": true});
  }

  getTimeDifference() {
    var notificationDate = DateTime.parse(
        widget.notificationData.notificationDate!.toDate().toString());
    var timeHour = DateTime.now().difference(notificationDate).inHours;

    return "${timeHour} hours ago";
  }

  getDate() {
    var day = widget.notificationData.notificationDate!.toDate().day.toString();
    var month =
        widget.notificationData.notificationDate!.toDate().month.toString();
    var year =
        widget.notificationData.notificationDate!.toDate().year.toString();

    return "${day} / ${month} / ${year}";
  }

  @override
  void initState() {
    changeReadTrue();

//Map out data to use
    widget.notificationData.data!.forEach((dynamic key, dynamic value) {
      setState(() {
        data.addAll({key: value});
      });
    });
    print(data);

    super.initState();
  }

  Widget build(BuildContext context) {
    var onlyValues = widget.notificationData.data!.values.toList();

    return Scaffold(
      body: Container(
        width: MyUtility(context).width,
        height: MyUtility(context).height,
        decoration: BoxDecoration(color: Color(0xFF171616)),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 20),
          child: Column(
            children: [
              //DashProfileView(),
              Container(
                width: MyUtility(context).width,
                height: MyUtility(context).height * 0.82,
                decoration: ShapeDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(0.57, -0.82),
                    end: Alignment(-0.57, 0.82),
                    colors: [
                      Color(0x19777777),
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
                    )
                  ],
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                          width: MyUtility(context).width * 0.75,
                          height: MyUtility(context).height * 0.065,
                          child: BackButtonMessage(
                            onPress: () {
                              widget.navigateToPage(4);
                            },
                          )),
                      Center(
                        child: Container(
                          width: MyUtility(context).width * 0.75,
                          height: MyUtility(context).height * 0.7,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        CustomCircleAvatar(
                                          imageUrl: '',
                                          radius: 20.0,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 6, right: 6),
                                          child: Text(
                                            '${widget.notificationData.personInterested}',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 17.64,
                                              fontFamily: 'ralewaysemi',
                                            ),
                                          ),
                                        ),
                                        Text.rich(
                                          TextSpan(
                                            children: [
                                              TextSpan(
                                                text: '<',
                                                style: TextStyle(
                                                  color: Color(0xFF202124),
                                                  fontSize: 15.7364,
                                                  fontFamily: 'raleway',
                                                ),
                                              ),
                                              TextSpan(
                                                text: onlyValues[2],
                                                style: TextStyle(
                                                  color: Color(0xFF202124),
                                                  fontSize: 15.7364,
                                                  fontFamily: 'raleway',
                                                  decoration:
                                                      TextDecoration.underline,
                                                ),
                                              ),
                                              TextSpan(
                                                text: '>',
                                                style: TextStyle(
                                                  color: Color(0xFF202124),
                                                  fontSize: 15.7364,
                                                  fontFamily: 'raleway',
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 6,
                                        ),
                                        QuotationRequests()
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        ReuseableIconButton(
                                          icon: Icons.delete,
                                          size: 25.0,
                                          iconColor: Color(0xFF757575),
                                          tooltipMessage: 'Delete',
                                          onPressed: () {},
                                        ),
                                        ReuseableIconButton(
                                          icon: Icons.print,
                                          size: 25.0,
                                          iconColor: Color(0xFF757575),
                                          tooltipMessage: 'Delete',
                                          onPressed: () {},
                                        ),
                                        /*        Text(
                                          '12:01 PM',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            color: Color(0xFF202124),
                                            fontSize: 13.9272,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),*/
                                        SizedBox(
                                          width: 6,
                                        ),
                                        Text(
                                          getTimeDifference(),
                                          style: TextStyle(
                                            color: Color(0xFF202124),
                                            fontSize: 15.7364,
                                            fontFamily: 'raleway',
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(75, 16, 16, 16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 15, bottom: 20),
                                        child: Text(
                                          onlyValues[9],
                                          style: TextStyle(
                                            color: Color(0xFF202124),
                                            fontSize: 15.7364,
                                            fontFamily: 'raleway',
                                          ),
                                        ),
                                      ),
                                      MessageText(
                                        boldText: 'From:',
                                        normalText:
                                            '${widget.notificationData.personInterested}',
                                      ),
                                      MessageText(
                                          boldText: 'Email:',
                                          normalText: data['email']),
                                      MessageText(
                                          boldText: 'Contact:',
                                          normalText: data['contact']),
                                      MessageText(
                                          boldText: 'Make:',
                                          normalText: data['make']),
                                      MessageText(
                                          boldText: 'Model:',
                                          normalText: data['model']),
                                      MessageText(
                                          boldText: 'Date:',
                                          normalText: getDate()),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width:
                                                MyUtility(context).width * 0.1,
                                            height: MyUtility(context).height *
                                                0.045,
                                            child: Text(
                                              "Images",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15.7364,
                                                fontFamily: 'ralewaysemi',
                                              ),
                                            ),
                                          ),
                                          Wrap(
                                            direction: Axis.horizontal,
                                            children: [
                                              for (var imageItem
                                                  in data['image'])
                                                Container(
                                                  width: 100,
                                                  height: 100,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                  child: RemotePicture(
                                                    imagePath:
                                                        "listings/${imageItem!}",
                                                    mapKey: 'image',
                                                    useAvatarView: false,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),

                                              /*
                  listings/
                   
                   */
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
