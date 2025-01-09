import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Footer/panelFooter.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/loginMainPage/RegisterBusinessValues.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/loginPageItems/EnterVerificationCode.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/loginPageItems/agreement.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/loginPageItems/completeAgreement.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/loginPageItems/createProfile.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/loginPageItems/membershipOptions.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/loginPageItems/ownersPortalLogin.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/loginPageItems/registerYourBusiness.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/loginPageItems/resetPassword.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/loginPageItems/resetPasswordOTPFirstLogin.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/loginPageItems/whatsNext.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/ui/glassContainer.dart';
import 'package:webdirectories/myutility.dart';

import '../../../components/descriptionDialog.dart';

enum PanelLoginPages {
  login,
  register,
  code,
  createprofile,
  options,
  agreement,
  whatsnext,
  resetotp,
  reset
}

class OwnersPortal extends StatefulWidget {
  final PanelLoginPages? pageIndex;
  const OwnersPortal({super.key, this.pageIndex});

  @override
  State<OwnersPortal> createState() => _OwnersPortalState();
}

class _OwnersPortalState extends State<OwnersPortal> {
  final RegisterBusinessValues _controller = RegisterBusinessValues();
  var pageIndex = 0;
  var membershipType = "";
  String memberEmail = "";

  @override
  void initState() {
    if (widget.pageIndex != null) {
      switch (widget.pageIndex!) {
        case PanelLoginPages.login:
          setState(() {
            pageIndex = 0;
          });
          break;
        case PanelLoginPages.register:
          setState(() {
            pageIndex = 1;
          });
          break;
        case PanelLoginPages.code:
          setState(() {
            pageIndex = 2;
          });
          break;
        case PanelLoginPages.createprofile:
          setState(() {
            pageIndex = 3;
          });
          break;
        case PanelLoginPages.options:
          setState(() {
            pageIndex = 4;
          });
          break;
        case PanelLoginPages.agreement:
          setState(() {
            pageIndex = 5;
          });
          break;
        case PanelLoginPages.whatsnext:
          setState(() {
            pageIndex = 6;
          });
          break;
        case PanelLoginPages.resetotp:
          setState(() {
            pageIndex = 7;
          });
          break;
        case PanelLoginPages.reset:
          setState(() {
            pageIndex = 8;
          });
          break;
      }
    }
    super.initState();
  }

  getMemberShipType(value) {
    setState(() {
      membershipType = value;
      _controller.memberShipType.text = value;
      //_controller. = value;
    });
  }

  //Update pageIndex value
  changePageIndex() {
    setState(() {
      pageIndex = pageIndex + 1;
    });
  }

  changeIndex(value) {
    setState(() {
      pageIndex = value;
    });
  }

  //Open popup register
  Future openAgreementPopup() => showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Agreement(
            membershipType: membershipType,
            closeDialog: () => Navigator.pop(
              context,
            ),
            changePageIndex: changePageIndex,
            controller: _controller,
          ),
        );
      });

  //Dialog for notification popup
  Future descriptionDialog(description) => showDialog(
      context: context,
      builder: (context) {
        return Dialog(
            child: DescriptionDialog(
          description: description,
        ));
      });

  void updateEmail(String email) {
    setState(() {
      memberEmail = email;
    });
  }

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;

    var pages = [
      // 0
      OwnersPortalLogin(changePageIndex: changeIndex, updateEmail: updateEmail),
      // 1
      RegisterYourBusiness(
        changePageIndex: changePageIndex,
        firstName: _controller.firstName,
        lastName: _controller.lastName,
        tradingName: _controller.tradingName,
        phone: _controller.phone,
        email: _controller.email,
        descriptionDialog: () {
          descriptionDialog("Please check terms and conditions");
        },
      ),
      // 2
      EnterVerificationCode(
        changePageIndex: changePageIndex,
        email: _controller.email.text,
        cell: _controller.phone.text,
      ),
      // 3
      CreateProfile(
        changePageIndex: changePageIndex,
        email: _controller.email,
        password: _controller.password,
      ),
      // 4
      MembershipOptions(
          changePageIndex: changePageIndex,
          getMemberShipType: getMemberShipType),
      // 5
      CompleteAgreement(
          openAgreementPopup: openAgreementPopup,
          changePageIndex: changePageIndex,
          controller: _controller),
      // 6
      WhatsNext(
        changeIndex: changeIndex,
      ),
      // 7
      ResetPasswordOTPFirstLogin(
        changePageIndex: changeIndex,
        emailAddress: memberEmail,
      ),
      // 8
      ResetPasswordFirstLogin(
        changePageIndex: changeIndex,
        emailAddress: memberEmail,
      ),
    ];
    return Material(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: widthDevice,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/effortlessManagement.png'),
                    fit: BoxFit.fill),
              ),
              child: Row(
                children: [
                  SizedBox(
                    height: heightDevice,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.05,
                        bottom: MediaQuery.of(context).size.height * 0.06,
                        top: MediaQuery.of(context).size.height * 0.06,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.02,
                            ),
                            child: Image.asset(
                              'images/panelLogo.png',
                              // height: 70,
                              width: MyUtility(context).width * 0.23,
                            ),
                          ),
                          Spacer(),
                          Text(
                            'Effortless \nManagement',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: widthDevice / 20,
                                fontFamily: 'ralewaybold',
                                height: 1),
                          ),
                          Text(
                            '\nMore time for repairs, less time on admin. Customize and \nmanage your online profile anytime, anywhere!',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: widthDevice / 80,
                              fontFamily: 'raleway',
                              fontWeight: FontWeight.w400,
                              height: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: widthDevice * 0.15),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // SizedBox(
                      //     height: widthDevice < 1500
                      //         ? heightDevice * 0.015 // Halved the height
                      //         : heightDevice * 0.05), // Halved the height
                      GlassContainer(child: pages[pageIndex]
                          //MembershipOptions()
                          ),
                    ],
                  )
                ],
              ),
            ),
            PanelFooter()
          ],
        ),
      ),
    );
  }
}
