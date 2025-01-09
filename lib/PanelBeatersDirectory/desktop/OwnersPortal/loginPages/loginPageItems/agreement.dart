import 'dart:async';
import 'dart:convert';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dart_ipify/dart_ipify.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/LandingPage/menus/menuComponents/glassContainer.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/loginMainPage/RegisterBusinessValues.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/ui/agreementBallPoint.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/ui/agreementTextField.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/ui/blackIconButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/utils/firebaseIdUtils.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class Agreement extends StatefulWidget {
  String membershipType;
  Function closeDialog;
  Function changePageIndex;
  RegisterBusinessValues controller;
  Agreement(
      {super.key,
      required this.membershipType,
      required this.closeDialog,
      required this.changePageIndex,
      required this.controller});

  @override
  State<Agreement> createState() => _AgreementState();
}

class _AgreementState extends State<Agreement> {
  final _firestore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  String paystackUrl = "";
  String paymentStatus = "";

  final selectedAgreement = TextEditingController();

  getMemberShipType() {
    switch (widget.membershipType) {
      case "StarterM":
        setState(() {
          paystackUrl = "";
          selectedAgreement.text = "Starter Monthly";
        });
        break;
      case "StarterA":
        setState(() {
          paystackUrl = "";
          selectedAgreement.text = "Starter Annual";
        });
        break;
      case "CoreM":
        setState(() {
          paystackUrl = "https://paystack.com/pay/dmpdqvg0yl";
          selectedAgreement.text = "Core Monthly";
        });
        break;
      case "CoreA":
        setState(() {
          paystackUrl = "https://paystack.com/pay/9u-s87qg5-";
          selectedAgreement.text = "Core Annual";
        });
        break;
      case "PremiumM":
        setState(() {
          paystackUrl = "https://paystack.com/pay/9ogv5c2nn2";
          selectedAgreement.text = "Premium Monthly";
        });
        break;
      case "PremiumA":
        setState(() {
          paystackUrl = "https://paystack.com/pay/2v2fce2k-c";
          selectedAgreement.text = "Premium Annual";
        });
        break;
      case "Premium+M":
        setState(() {
          paystackUrl = "https://paystack.com/pay/98jc3yw4yg";
          selectedAgreement.text = "Premium + Monthly";
        });
        break;
      case "Premium+A":
        setState(() {
          paystackUrl = "https://paystack.com/pay/lg1hrdqwba";
          selectedAgreement.text = "Premium + Annual";
        });
        break;

      default:
        print(' invalid entry');
    }
  }
/*
  checkSubscription() {
    return http.get(
      Uri.parse(
          'https://api.paystack.co/customer/${widget.controller.email.text}'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer sk_test_216721a21d245ae3b272fcd9b76eeb7e1076d5b7',
      },
    );
  }

  afterPaymentMade() {
    var timer = Timer.periodic(Duration(seconds: 5), (Timer t) async {
      final response = await checkSubscription();

      final decode =
          jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;

//Check if customer exists
      if (decode['status'] == true) {
//Subscriptions are available
        if (decode['data']['subscriptions'].length >= 1) {
          if (decode['data']['subscriptions'][0]['status'] == "active") {
            setState(() {
              paymentStatus =
                  "Payment successful, account has been activated. Please continue...";
              submitAgreement();
            });
          }
        }
      } else {}
    });
  }

  callPaystack() {
    print("Call Paystack");
    print(widget.membershipType);
    print(paystackUrl);
    if (widget.membershipType == "StarterM" ||
        widget.membershipType == "StarterM") {
      paymentStatus = "Awaiting Payment1";
    } else {
      setState(() {
        paymentStatus = "Awaiting Payment";
        afterPaymentMade();
        launchUrl(Uri.parse(paystackUrl));
      });
    }
  }*/

  //Register new user
  submitAgreement() async {
    try {
      //  print(widget.controller.getValues());
      UserCredential userDocRef = await auth.createUserWithEmailAndPassword(
          email: widget.controller.email.text,
          password: widget.controller.password.text);
      int listingId = await getHighestListingsId() + 1;
      int listingMembersId = await getHighestListingMembersId() + 1;
      int allocationId = await getHighestAllocationId() + 1;
      print(userDocRef.user!.uid);
      await FirebaseFirestore.instance
          .collection("listings")
          .doc(userDocRef.user!.uid)
          .set(widget.controller.getValues());
      print(userDocRef.user!.uid);
      await FirebaseFirestore.instance
          .collection("listings")
          .doc(userDocRef.user!.uid)
          .update({
        "authId": userDocRef.user!.uid,
        "listingsId": listingId,
      });
      print(userDocRef.user!.uid);
      await FirebaseFirestore.instance
          .collection("listing_allocation")
          .doc(userDocRef.user!.uid)
          .set(widget.controller.getListingAllocations(
              listingid: listingId,
              memberlistingId: listingMembersId,
              allocationId: allocationId));

      await FirebaseFirestore.instance
          .collection("listing_members")
          .doc(userDocRef.user!.uid)
          .set(widget.controller.getListingMembersValue(listingMembersId))
          .whenComplete(() {
        widget.closeDialog();
      });
    } catch (e) {
      print('Error fetching listing data: $e');
      setState(() {
        //  _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    getMemberShipType();
    var todayDate = DateTime.now();
    widget.controller.date.text = DateFormat('yyyy/MM/dd')
        .format(DateTime(todayDate.year, todayDate.month, todayDate.day));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        // Center(
        //     child: ClipRect(
        //         child: BackdropFilter(
        //             filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        //             child: Container(
        //               width: widthDevice * 0.95,
        //               height: heightDevice * 0.95,
        //               decoration: BoxDecoration(
        //                   borderRadius: BorderRadius.circular(15.0),
        //                   color: Colors.grey.shade200.withOpacity(0.9)),
        //             )))),
        Padding(
          padding: const EdgeInsets.all(0),
          child: Container(
            color: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Container(
                    height: 50,
                    color: Colors.black,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Stack(
                          children: [
                            InkWell(
                              onTap: () {
                                widget.closeDialog();
                              },
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: ShapeDecoration(
                                  shape: OvalBorder(
                                    side: BorderSide(
                                        width: 0.94, color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 4,
                              top: 5,
                              child: Icon(
                                Icons.keyboard_arrow_left,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        InkWell(
                          onTap: () {
                            widget.closeDialog();
                          },
                          child: Text(
                            'Go Back',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'raleway',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                  ),
                  child: Container(
                    width: widthDevice * 0.90,
                    height: heightDevice * 0.78,
                    decoration: ShapeDecoration(
                      color: Color(0xFF181B1D),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 0.64,
                          strokeAlign: BorderSide.strokeAlignOutside,
                          color: Colors.transparent,
                        ),
                        borderRadius: BorderRadius.circular(9.57),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: Scrollbar(
                        thumbVisibility: true,
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Agreement \n',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 40,
                                        fontFamily: 'ralewaybold',
                                        fontWeight: FontWeight.w700,
                                        height: 1.5,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'between\n',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontStyle: FontStyle.italic,
                                        fontFamily: 'raleway',
                                        fontWeight: FontWeight.w400,
                                        height: 1.5,
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                          'SMASH-PRO WEB DIRECTORIES (Pty) Ltd • Regno: 2013/005016/07 • VAT No: 4200267682\n63 Bokmakierie Street, Eden, George, Western Cape, 6529\n',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontFamily: 'raleway',
                                        fontWeight: FontWeight.w400,
                                        height: 1.5,
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                          '+27 (0) 12 403 0120  • finance@webdirectories.co.za\n',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontFamily: 'raleway',
                                        fontWeight: FontWeight.w400,
                                        height: 1.5,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'and',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontStyle: FontStyle.italic,
                                        fontFamily: 'raleway',
                                        fontWeight: FontWeight.w400,
                                        height: 1.5,
                                      ),
                                    ),
                                  ],
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                width: 1110,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    '*Business Trading Name',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontFamily: 'ralewaybold',
                                      fontWeight: FontWeight.w400,
                                      height: 2,
                                    ),
                                  ),
                                ),
                              ),
                              AgreementTextField(
                                hintText: 'Enter Business Trading Name',
                                width: 1110,
                                controller: widget.controller.tradingName,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'hereafter called ‘the client’',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontStyle: FontStyle.italic,
                                  fontFamily: 'raleway',
                                  fontWeight: FontWeight.w400,
                                  height: 1,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                width: 1110,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Welcome to The Web Directories!',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontFamily: 'ralewaybold',
                                      fontWeight: FontWeight.w400,
                                      height: 2,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 1110,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'We\'ll help you get more customers online by boosting your online presence and attracting new leads through our directory network.To enable us to deliver accurate and swift service, we ask that you please help us conclude this easy registration process – it is also required by SA Bank rules.\n',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontFamily: 'raleway',
                                      height: 1.5,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 1110,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Web Directories agrees to:',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontFamily: 'ralewaybold',
                                      fontWeight: FontWeight.w400,
                                      height: 2,
                                    ),
                                  ),
                                ),
                              ),
                              AgreementBallText(
                                  boldText: '',
                                  ballText:
                                      'Implement this agreement and setup, publish and host the Client’s business profile Information on the applicable individual business page in \nthe agreed Directory.'),
                              AgreementBallText(
                                  boldText: '',
                                  ballText:
                                      'Continuously promote the client’s profile online through Search Engine Optimization (SEO) & Search Engine Marketing (SEM)'),
                              AgreementBallText(
                                  boldText: '',
                                  ballText:
                                      'Provide the client access to the ‘Owners Portal’ and all functionality thereof.'),
                              AgreementBallText(
                                  boldText: '',
                                  ballText:
                                      'Assist the Client to update such information when requested.'),
                              SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                width: 1110,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'The Client agrees to:',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontFamily: 'ralewaybold',
                                      fontWeight: FontWeight.w400,
                                      height: 2,
                                    ),
                                  ),
                                ),
                              ),
                              AgreementBallText(
                                  boldText: '',
                                  ballText:
                                      'Complete this mandate and submit online.'),
                              AgreementBallText(
                                  boldText: '',
                                  ballText:
                                      'Supply & record accurate and true information, both when communicating with Web Directories and updating the Owners Portal.'),
                              AgreementBallText(
                                  boldText: '',
                                  ballText:
                                      'Accept full responsibility for information displayed, specifically relating to Insurance & OEM Industry Contracts & Endorsements.'),
                              AgreementBallText(
                                  boldText: '',
                                  ballText:
                                      'Grant Web Directories permission to obtain and display (CSI) Consumer Survey Rating results, in the client’s Business Profile and Owners \nPortal sections. CSI Services Providers in general, and Lightstone EchoMBR, specifically is authorized to release the applicable information \nto Web Directories for publication. The related Owners Portal will also have functionality to empower the client to enable or disable the \npublic display of said information.'),
                              AgreementBallText(
                                  boldText: '',
                                  ballText:
                                      'Pay the agreed Membership fees monthly- or annually in advance.'),
                              AgreementBallText(
                                  boldText: '',
                                  ballText:
                                      'Pay the Once Off Activation fee with the first monthly/annual payment'),
                              SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                width: 1110,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Your selected Membership:',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontFamily: 'ralewaybold',
                                      fontWeight: FontWeight.w400,
                                      height: 2,
                                    ),
                                  ),
                                ),
                              ),
                              AgreementTextField(
                                hintText: '',
                                width: 1110,
                                controller: selectedAgreement,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Debit Order Information:',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'raleway',
                                  fontWeight: FontWeight.w400,
                                  height: 1,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),

                              /*       SizedBox(
                                width: 500,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Payment Options:',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontFamily: 'ralewaybold',
                                      fontWeight: FontWeight.w400,
                                      height: 2,
                                    ),
                                  ),
                                ),
                              ),
                              AgreementTextField(
                                hintText: '',
                                width: 1110,
                                controller: TextEditingController(),
                              ),*/
                              SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                width: 540,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '*Bank Account Name',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontFamily: 'raleway',
                                        fontWeight: FontWeight.w400,
                                        height: 1,
                                      ),
                                    ),
                                    AgreementTextField(
                                        hintText: '',
                                        width: 300,
                                        controller: widget.controller.city),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                width: 540,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '*Bank Name',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontFamily: 'raleway',
                                        fontWeight: FontWeight.w400,
                                        height: 1,
                                      ),
                                    ),
                                    AgreementTextField(
                                        hintText: '',
                                        width: 300,
                                        controller: widget.controller.city),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                width: 540,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '*Branch Code',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontFamily: 'raleway',
                                        fontWeight: FontWeight.w400,
                                        height: 1,
                                      ),
                                    ),
                                    AgreementTextField(
                                        hintText: '',
                                        width: 300,
                                        controller: widget.controller.city),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                width: 540,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '*Account Number',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontFamily: 'raleway',
                                        fontWeight: FontWeight.w400,
                                        height: 1,
                                      ),
                                    ),
                                    AgreementTextField(
                                        hintText: '',
                                        width: 300,
                                        controller: widget.controller.city),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                width: 540,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '*Account Type ',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontFamily: 'raleway',
                                        fontWeight: FontWeight.w400,
                                        height: 1,
                                      ),
                                    ),
                                    AgreementTextField(
                                        hintText: '',
                                        width: 300,
                                        controller: widget.controller.city),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                width: 540,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '*Commencement Date ',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontFamily: 'raleway',
                                        fontWeight: FontWeight.w400,
                                        height: 1,
                                      ),
                                    ),
                                    AgreementTextField(
                                        hintText: '',
                                        width: 300,
                                        controller: widget.controller.city),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                width: 540,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '*Payment Date ',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontFamily: 'raleway',
                                        fontWeight: FontWeight.w400,
                                        height: 1,
                                      ),
                                    ),
                                    AgreementTextField(
                                        hintText: '',
                                        width: 300,
                                        controller: widget.controller.city),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 1110,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Payment Change, Renewal & Cancellation:',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontFamily: 'ralewaybold',
                                      fontWeight: FontWeight.w400,
                                      height: 2,
                                    ),
                                  ),
                                ),
                              ),
                              AgreementBallText(
                                  ballText:
                                      'Monthly agreements - automatically renewed monthly, on a continuous basis. Option changes with a calendar month’s notice..',
                                  boldText: ''),
                              AgreementBallText(
                                  ballText:
                                      'Annual agreements - deemed to automatically renew annually on anniversary date. Please cancel before renewal date to avoid charges.',
                                  boldText: ''),
                              AgreementBallText(
                                  ballText:
                                      'Cancellation: Provide one (1) calendar month’s written notice for all agreements, via email to: finance@webdirectories.co.za',
                                  boldText: ''),
                              AgreementBallText(
                                  ballText:
                                      'EFT payment to the following Company bank account:',
                                  boldText: ''),
                              SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                width: 1110,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Smashpro FNB Cheque Account.\nBranch Code: 250016\nAccount No: 62393019396',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontFamily: 'raleway',
                                      height: 1.5,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              AgreementBallText(
                                  ballText:
                                      'Reference: Client membership number (available on invoices)',
                                  boldText: ''),
                              AgreementBallText(
                                  ballText:
                                      'Proof of Payment: to finance@webdirectories.co.za.',
                                  boldText: ''),
                              AgreementBallText(
                                  ballText:
                                      'Banking details also available on Invoice documentation',
                                  boldText: ''),
                              AgreementBallText(
                                  ballText:
                                      'Change in membership fees (if any) will be communicated to the client’s nominated e-mail address',
                                  boldText: ''),
                              SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                width: 1110,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'The individual payment instructions so authorised, must be issued and delivered as follows:',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontFamily: 'ralewaybold',
                                      fontWeight: FontWeight.w400,
                                      height: 2,
                                    ),
                                  ),
                                ),
                              ),
                              AgreementBallText(
                                  ballText:
                                      'This Authority and Mandate refers to our contract as dated upon submission and/or signature hereof (‘the Agreement’). I / We hereby \nauthorise you to issue and deliver payment instructions to the bank for collection against my / our above-mentioned account \nat my / our above-mentioned bank (or any other bank or branch to which I / We may transfer my / our account) on condition that the sum \nof such payment instructions will never exceed my / our obligations as agreed to in the Agreement, and commencing on the \ncommencement date and continuing until this Authority and Mandate is terminated by me / us by giving you notice in writing of no less than \n20 ordinary working days, and sent by prepaid registered post or delivered to your e-mail address indicated above.',
                                  boldText: ''),
                              AgreementBallText(
                                  ballText:
                                      'on or after the dates when the obligation in terms of the Agreement is due and the amount of each individual payment instruction \nmay not be more than the obligation due; In the event that the payment day falls on a Saturday, Sunday or recognized South \nAfrican public holiday, the payment day will automatically be the immediately preceding ordinary business day. Further, if there are insufficient \nfunds in the nominated account to meet the obligation, you are entitled to track my account and re-present the instruction for \npayment as soon as enough funds are available in my account.',
                                  boldText: 'Monthly:'),
                              AgreementBallText(
                                  ballText:
                                      'on or after the dates when the obligation in terms of the Agreement is due and the amount of each individual payment instruction \nmay not be more than the obligation due.',
                                  boldText: 'Annually:'),
                              AgreementBallText(
                                  ballText:
                                      'that the withdrawals hereby authorised will be processed through a computerized system provided by the South African \nBanks and I also understand that details of each withdrawal will be printed on my bank statement. Each transaction will contain a number, \nwhich must be included in the said payment instruction and if provided to you should enable you to identify the Agreement. A payment \nreference is added to this form before the issuing of any payment instruction. I / We shall not be entitled to any refund of amounts which \nyou have withdrawn while this authority was in force, if such amounts were legally owing to you.',
                                  boldText: 'I/WE understand'),
                              AgreementBallText(
                                  ballText:
                                      'I / We acknowledge that all payment instructions issued by you shall be treated by my / our above-mentioned bank as if the \ninstructions had been issued by me / us personally.',
                                  boldText: 'Mandate:'),
                              AgreementBallText(
                                  ballText:
                                      'I / We agree that although this Authority and Mandate may be cancelled by me / us, such cancellation will not cancel the \nAgreement. I / We shall not be entitled to any refund of amounts which you have withdrawn while this authority was in force, if such amounts \nwere legally owing to you.',
                                  boldText: 'Cancellation:'),
                              AgreementBallText(
                                  ballText:
                                      'I / We acknowledge that this Authority may be ceded to or assigned to a third party if the agreement is also ceded or assigned \nto that third party, but in the absence of such assignment of the Agreement, this Authority and Mandate cannot be assigned to any third party.',
                                  boldText: 'Assignment:'),

                              SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                height: 2,
                                width: 1110,
                                child: new Center(
                                  child: new Container(
                                    margin: new EdgeInsetsDirectional.only(
                                        start: 1.0, end: 1.0),
                                    height: 2,
                                    color: Color.fromARGB(193, 114, 113, 113),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                width: 1110,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Business Information:',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontFamily: 'ralewaybold',
                                      fontWeight: FontWeight.w400,
                                      height: 2,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 1110,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Address:',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontFamily: 'ralewaybold',
                                      fontWeight: FontWeight.w400,
                                      height: 2,
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 540,
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              '*Street Name & Number',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontFamily: 'raleway',
                                                fontWeight: FontWeight.w400,
                                                height: 1,
                                              ),
                                            ),
                                            AgreementTextField(
                                              hintText: '',
                                              width: 300,
                                              controller: widget
                                                  .controller.streetAddress,
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              '*City',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontFamily: 'raleway',
                                                fontWeight: FontWeight.w400,
                                                height: 1,
                                              ),
                                            ),
                                            AgreementTextField(
                                                hintText: '',
                                                width: 300,
                                                controller:
                                                    widget.controller.city),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Country',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontFamily: 'raleway',
                                                fontWeight: FontWeight.w400,
                                                height: 1,
                                              ),
                                            ),
                                            AgreementTextField(
                                                hintText: '',
                                                width: 300,
                                                controller:
                                                    widget.controller.country),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  SizedBox(
                                    width: 540,
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              '*Suburb',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontFamily: 'raleway',
                                                fontWeight: FontWeight.w400,
                                                height: 1,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 40,
                                            ),
                                            AgreementTextField(
                                                hintText: '',
                                                width: 300,
                                                controller:
                                                    widget.controller.suburb),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              'Province',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontFamily: 'raleway',
                                                fontWeight: FontWeight.w400,
                                                height: 1,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 40,
                                            ),
                                            AgreementTextField(
                                                hintText: '',
                                                width: 300,
                                                controller:
                                                    widget.controller.province),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              'Postal Code',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontFamily: 'raleway',
                                                fontWeight: FontWeight.w400,
                                                height: 1,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 40,
                                            ),
                                            AgreementTextField(
                                                hintText: '',
                                                width: 300,
                                                controller:
                                                    widget.controller.postal),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                width: 1110,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Contact:',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontFamily: 'ralewaybold',
                                      fontWeight: FontWeight.w400,
                                      height: 2,
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 540,
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              '*Customer Care Number',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontFamily: 'raleway',
                                                fontWeight: FontWeight.w400,
                                                height: 1,
                                              ),
                                            ),
                                            AgreementTextField(
                                              hintText: '',
                                              width: 300,
                                              controller:
                                                  TextEditingController(),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Customer Care Number 2',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontFamily: 'raleway',
                                                fontWeight: FontWeight.w400,
                                                height: 1,
                                              ),
                                            ),
                                            AgreementTextField(
                                              hintText: '',
                                              width: 300,
                                              controller:
                                                  TextEditingController(),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'WhatsApp Number',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontFamily: 'raleway',
                                                fontWeight: FontWeight.w400,
                                                height: 1,
                                              ),
                                            ),
                                            AgreementTextField(
                                              hintText: '',
                                              width: 300,
                                              controller:
                                                  TextEditingController(),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  SizedBox(
                                    width: 540,
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              'After Hours',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontFamily: 'raleway',
                                                fontWeight: FontWeight.w400,
                                                height: 1,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 40,
                                            ),
                                            AgreementTextField(
                                              hintText: '',
                                              width: 300,
                                              controller:
                                                  TextEditingController(),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              'Towing',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontFamily: 'raleway',
                                                fontWeight: FontWeight.w400,
                                                height: 1,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 40,
                                            ),
                                            AgreementTextField(
                                              hintText: '',
                                              width: 300,
                                              controller:
                                                  TextEditingController(),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              '*General Business Email',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontFamily: 'raleway',
                                                fontWeight: FontWeight.w400,
                                                height: 1,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 40,
                                            ),
                                            AgreementTextField(
                                              hintText: '',
                                              width: 300,
                                              controller:
                                                  widget.controller.email,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                width: 1110,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Business Registration:',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontFamily: 'ralewaybold',
                                      fontWeight: FontWeight.w400,
                                      height: 2,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: 1110,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '*Registered Name',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontFamily: 'raleway',
                                        fontWeight: FontWeight.w400,
                                        height: 1,
                                      ),
                                    ),
                                    Spacer(),
                                    AgreementTextField(
                                        hintText: '',
                                        width: 870,
                                        controller: widget.controller
                                            .registeredBussinessName),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                width: 1110,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '*Registration Number',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontFamily: 'raleway',
                                        fontWeight: FontWeight.w400,
                                        height: 1,
                                      ),
                                    ),
                                    Spacer(),
                                    AgreementTextField(
                                        hintText: '',
                                        width: 870,
                                        controller: TextEditingController()),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                width: 1110,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '*VAT Number',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontFamily: 'raleway',
                                        fontWeight: FontWeight.w400,
                                        height: 1,
                                      ),
                                    ),
                                    Spacer(),
                                    AgreementTextField(
                                        hintText: '',
                                        width: 870,
                                        controller: TextEditingController()),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                width: 1110,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Franchise Membership',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontFamily: 'raleway',
                                        fontWeight: FontWeight.w400,
                                        height: 1,
                                      ),
                                    ),
                                    Spacer(),
                                    AgreementTextField(
                                        hintText: 'Enter if applicable',
                                        controller: TextEditingController(),
                                        width: 870),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                width: 1110,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Management Authority & Signature',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontFamily: 'ralewaybold',
                                      fontWeight: FontWeight.w400,
                                      height: 2,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 1110,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'By submitting this Agreement electronically (through the ‘SUBMIT’ button), and/or signing and submitting it per hand or through e-mail, I confirm that I am duly authorised, and in agreement with the terms hereof:',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontFamily: 'raleway',
                                      height: 1.5,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: 1110,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Date',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontFamily: 'raleway',
                                        fontWeight: FontWeight.w400,
                                        height: 1,
                                      ),
                                    ),
                                    Spacer(),
                                    AgreementTextField(
                                        hintText: '2024/04/15',
                                        width: 870,
                                        controller: widget.controller.date),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                width: 1110,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '*Initails & Surname',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontFamily: 'raleway',
                                        fontWeight: FontWeight.w400,
                                        height: 1,
                                      ),
                                    ),
                                    Spacer(),
                                    AgreementTextField(
                                      hintText: '',
                                      width: 870,
                                      controller: TextEditingController(),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                width: 1110,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '*Designation',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontFamily: 'raleway',
                                        fontWeight: FontWeight.w400,
                                        height: 1,
                                      ),
                                    ),
                                    Spacer(),
                                    AgreementTextField(
                                        hintText: '',
                                        width: 870,
                                        controller: TextEditingController()),
                                  ],
                                ),
                              ),

                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                width: 1110,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Management Email',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontFamily: 'raleway',
                                        fontWeight: FontWeight.w400,
                                        height: 1,
                                      ),
                                    ),
                                    Spacer(),
                                    AgreementTextField(
                                        hintText: '',
                                        width: 870,
                                        controller: TextEditingController()),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                width: 1110,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '*Management Tell/Cell',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontFamily: 'raleway',
                                        fontWeight: FontWeight.w400,
                                        height: 1,
                                      ),
                                    ),
                                    Spacer(),
                                    AgreementTextField(
                                        hintText: '',
                                        width: 870,
                                        controller: TextEditingController()),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                width: 1110,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'IP Address',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontFamily: 'raleway',
                                        fontWeight: FontWeight.w400,
                                        height: 1,
                                      ),
                                    ),
                                    Spacer(),
                                    AgreementTextField(
                                        hintText: '102.222.243.185',
                                        width: 870,
                                        controller: widget.controller.ip),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 40,
                              ),

                              //SUBMIT BUTTON

                              InkWell(
                                onTap: () {
                                  //   callPaystack();
                                  submitAgreement();
                                },
                                child: Container(
                                  padding: const EdgeInsets.only(
                                      top: 5, bottom: 5, left: 20, right: 20),
                                  decoration: ShapeDecoration(
                                    color: Color(0xFFE2822B),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(230),
                                    ),
                                    shadows: [
                                      BoxShadow(
                                        color: Color(0x3F000000),
                                        blurRadius: 4,
                                        offset: Offset(0, 4),
                                        spreadRadius: 0,
                                      )
                                    ],
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Submit',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontFamily: 'raleway',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: paymentStatus != "",
                                child: BlackIconButton(
                                  backgroundColor1: Colors.black,
                                  circleColor1:
                                      paymentStatus != "Awaiting Payment"
                                          ? Colors.grey
                                          : Colors.green,
                                  iconColor1: Colors.white,
                                  text1: paymentStatus,
                                  textColor1: Colors.white,
                                  icon: Icons.check,
                                  onPress: () {
                                    widget.closeDialog();
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  // AGREEMENT END
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
//\n\n\n\n\n\n\n\n\n\n\n
