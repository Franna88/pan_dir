import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/landingPage/ui/mobileLocationCheck.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/ownersLogin/ui/agreementMobileTextfield.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/ownersLogin/ui/agreementTextMobile.dart';

class AgreementMobile extends StatelessWidget {
  const AgreementMobile({super.key});

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: heightDevice,
        width: widthDevice,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/mobileLanding.png'), fit: BoxFit.cover),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 75,
                      width: 155,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/panelLogo.png'),
                            fit: BoxFit.fill),
                      ),
                    ),
                    Icon(
                      Icons.menu,
                      color: Colors.white,
                      size: 25,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '* Fill in Required Fields',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'ralewaymedium',
                        height: 1,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: widthDevice * 0.90,
                height: heightDevice * 0.78,
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
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Agreement \n',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 35,
                                  fontFamily: 'ralewaybold',
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
                                  height: 1.5,
                                ),
                              ),
                              TextSpan(
                                text:
                                    'SMASH-PRO WEB DIRECTORIES (Pty) Ltd • Regno: 2013/005016/07 • VAT No: 4200267682\n63 Bokmakierie Street, Eden, George, Western Cape, 6529\n',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontFamily: 'raleway',
                                  height: 1.5,
                                ),
                              ),
                              TextSpan(
                                text:
                                    '+27 (0) 12 403 0120  • finance@webdirectories.co.za\n',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontFamily: 'raleway',
                                  height: 1.5,
                                ),
                              ),
                              TextSpan(
                                text: 'and',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontStyle: FontStyle.italic,
                                  fontFamily: 'raleway',
                                  height: 1.5,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          '*Business Trading Name',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'ralewaymedium',
                            height: 2,
                          ),
                        ),
                        AgreementMobileTextField(
                            hintText: 'Enter Business Trading Name',
                            width: widthDevice),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Text(
                            'hereafter called ‘the client’',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontStyle: FontStyle.italic,
                              fontFamily: 'raleway',
                              height: 1,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Welcome to The Web Directories!',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'ralewaybold',
                            height: 2,
                          ),
                        ),
                        Text(
                          'We\'ll help you get more customers online by boosting your online presence and attracting new leads through our directory network. To enable us to deliver accurate and swift service, we ask that you please help us conclude this easy registration process – it is also required by SA Bank rules.\n',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'raleway',
                            height: 1.5,
                          ),
                        ),
                        Text(
                          'Web Directories agrees to:',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'ralewaybold',
                            height: 1.5,
                          ),
                        ),
                        AgreementTextMobile(
                            boldText: '',
                            ballText:
                                'Implement this agreement and setup, publish and host the Client’s business profile Information on the applicable individual business page in the agreed Directory.'),
                        AgreementTextMobile(
                            boldText: '',
                            ballText:
                                'Continuously promote the client’s profile online through Search Engine Optimization (SEO) & Search Engine Marketing (SEM)'),
                        AgreementTextMobile(
                            boldText: '',
                            ballText:
                                'Provide the client access to the ‘Owners Portal’ and all functionality thereof.'),
                        AgreementTextMobile(
                            boldText: '',
                            ballText:
                                'Assist the Client to update such information when requested.'),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'The client agrees to:',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'ralewaybold',
                            height: 1.5,
                          ),
                        ),
                        AgreementTextMobile(
                            boldText: '',
                            ballText:
                                'Complete this mandate and submit online.'),
                        AgreementTextMobile(
                            boldText: '',
                            ballText:
                                'Supply & record accurate and true information, both when communicating with Web Directories and updating the Owners Portal.'),
                        AgreementTextMobile(
                            boldText: '',
                            ballText:
                                'Accept full responsibility for information displayed, specifically relating to Insurance & OEM Industry Contracts & Endorsements.'),
                        AgreementTextMobile(
                            boldText: '',
                            ballText:
                                'Grant Web Directories permission to obtain and display (CSI) Consumer Survey Rating results, in the client’s Business Profile and Owners Portal sections. CSI Services Providers in general, and Lightstone EchoMBR, specifically is authorized to release the applicable information to Web Directories for publication. The related Owners Portal will also have functionality to empower the client to enable or disable the public display of said information.'),
                        AgreementTextMobile(
                            boldText: '',
                            ballText:
                                'Pay the agreed Membership fees monthly- or annually in advance.'),
                        AgreementTextMobile(
                            boldText: '',
                            ballText:
                                'Pay the Once Off Activation fee with the first monthly/annual payment'),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Your selected Membership:',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'ralewaybold',
                            height: 1.5,
                          ),
                        ),
                        AgreementMobileTextField(
                            hintText: 'Premium Monthly - R343 pm excL VAT',
                            width: widthDevice),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Payment Options',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'ralewaybold',
                            height: 1.5,
                          ),
                        ),
                        AgreementMobileTextField(
                            hintText: '', width: widthDevice),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Payment Change, Renewal & Cancellation:',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'ralewaybold',
                            height: 1.5,
                          ),
                        ),
                        AgreementTextMobile(
                            ballText:
                                'Monthly agreements - automatic renewed monthly, on a continuous basis. Option changes with a calendar month’s notice..',
                            boldText: ''),
                        AgreementTextMobile(
                            ballText:
                                'Annual agreements - deemed to automatically renew annually on anniversary date. Please cancel before renewal date to avoid charges.',
                            boldText: ''),
                        AgreementTextMobile(
                            ballText:
                                'Cancellation: Provide one (1) calendar month’s written notice for all agreements, via email to: finance@webdirectories.co.za',
                            boldText: ''),
                        AgreementTextMobile(
                            ballText:
                                'EFT payment to the following Company bank account:',
                            boldText: ''),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Smashpro FNB Cheque Account.\nBranch Code: 250016\nAccount No: 62393019396',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'raleway',
                            height: 1.5,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        AgreementTextMobile(
                            ballText:
                                'Reference: Client membership number (available on invoices)',
                            boldText: ''),
                        AgreementTextMobile(
                            ballText:
                                'Proof of Payment: to finance@webdirectories.co.za.',
                            boldText: ''),
                        AgreementTextMobile(
                            ballText:
                                'Banking details also available on Invoice documentation',
                            boldText: ''),
                        AgreementTextMobile(
                            ballText:
                                'Change in membership fees (if any) will be communicated to the client’s nominated e-mail address',
                            boldText: ''),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'The individual payment instructions so authorised, must be issued and delivered as follows:',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'ralewaybold',
                            height: 1.2,
                          ),
                        ),
                        AgreementTextMobile(
                            ballText:
                                'This Authority and Mandate refers to our contract as dated as on submission and/or signature hereof (‘the Agreement’). I / We hereby authorise you to issue and deliver payment instructions to the bank for collection against my / our above mentioned account at my / our above mentioned bank (or any other bank or branch to which I / We may transfer my / our account) on condition that the sum of such payment instructions will never exceed my / our obligations as agreed to in the Agreement, and commencing on the commencement date and continuing until this Authority and Mandate is terminated by me / us by giving you notice in writing of no less than 20 ordinary working days, and sent by prepaid registered post or delivered to your e-mail address indicated above.',
                            boldText: ''),
                        AgreementTextMobile(
                            ballText:
                                ' on or after the dates when the obligation in terms of the Agreement is due and the amount of each individual payment instruction may not be more or less that the obligation due; In the event that the payment day falls on a Saturday, Sunday or recognized South African public holiday, the payment day will automatically be the very previous ordinary business day. Further, if there are insufficient funds in the nominated account to meet the obligation, you are entitled to track my account and re-present the instruction for payment as soon as enough funds are available in my account.',
                            boldText: 'Monthly:'),
                        AgreementTextMobile(
                            ballText:
                                ' on or after the dates when the obligation in terms of the Agreement is due and the amount of each individual payment instruction may not be more than the obligation due.',
                            boldText: 'Annually:'),
                        AgreementTextMobile(
                            ballText:
                                ' that the withdrawals hereby authorised will be processed through a computerized system provided by the South African Banks and I also understand that details of each withdrawal will be printed on my bank statement. Each transaction will contain a number, which must be included in the said payment instruction and if provided to you should enable you to identify the Agreement. A payment reference is added to this form before the issuing of any payment instruction. I / We shall not be entitled to any refund of amounts which you have withdrawn while this authority was in force, if such amounts were legally owing to you.',
                            boldText: 'I/WE understand'),
                        AgreementTextMobile(
                            ballText:
                                ' I / We acknowledge that all payment instructions issued by you shall be treated by my/our above-mentioned bank as if the instructions had been issued by me / us personally.',
                            boldText: 'Mandate:'),
                        AgreementTextMobile(
                            ballText:
                                ' I / We agree that although this Authority and Mandate may be cancelled by me/us, such cancellation will not cancel the Agreement. I / We shall not be entitled to any refund of amounts which you have withdrawn while this authority was in force, if such amounts were legally owing to you.',
                            boldText: 'Cancellation:'),
                        AgreementTextMobile(
                            ballText:
                                ' I /We acknowledge that this Authority may be ceded to or assigned to a third party if the agreement is also ceded or assigned to that third party, but in the absence of such assignment of the Agreement, this Authority and Mandate cannot be assigned to any third party.',
                            boldText: 'Assignment:'),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 1,
                          width: widthDevice,
                          child: new Center(
                            child: new Container(
                              margin: new EdgeInsetsDirectional.only(
                                  start: 1.0, end: 1.0),
                              height: 1,
                              color: Color.fromARGB(193, 114, 113, 113),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Bisiness Information:',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'ralewaybold',
                            height: 1.5,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Address:',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'ralewaybold',
                            height: 1.5,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                '*Street Name & Number',
                                maxLines: 2,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'raleway',
                                  height: 1,
                                ),
                              ),
                            ),
                            AgreementMobileTextField(
                                hintText: '', width: widthDevice * 0.50),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                '*Suburb',
                                maxLines: 2,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'raleway',
                                  height: 1,
                                ),
                              ),
                            ),
                            AgreementMobileTextField(
                                hintText: '', width: widthDevice * 0.50),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                'City',
                                maxLines: 2,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'raleway',
                                  height: 1,
                                ),
                              ),
                            ),
                            AgreementMobileTextField(
                                hintText: '', width: widthDevice * 0.50),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                'Province',
                                maxLines: 2,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'raleway',
                                  height: 1,
                                ),
                              ),
                            ),
                            AgreementMobileTextField(
                                hintText: '', width: widthDevice * 0.50),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                'Postal Code',
                                maxLines: 2,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'raleway',
                                  height: 1,
                                ),
                              ),
                            ),
                            AgreementMobileTextField(
                                hintText: '', width: widthDevice * 0.50),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                'Country',
                                maxLines: 2,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'raleway',
                                  height: 1,
                                ),
                              ),
                            ),
                            AgreementMobileTextField(
                                hintText: '', width: widthDevice * 0.50),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Contact:',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'ralewaybold',
                            height: 2,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                '*Customer Care Number',
                                maxLines: 2,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'raleway',
                                  height: 1,
                                ),
                              ),
                            ),
                            AgreementMobileTextField(
                                hintText: '', width: widthDevice * 0.50),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                'Customer Care Number 2',
                                maxLines: 2,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'raleway',
                                  height: 1,
                                ),
                              ),
                            ),
                            AgreementMobileTextField(
                                hintText: '', width: widthDevice * 0.50),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                'WhatsApp Number',
                                maxLines: 2,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'raleway',
                                  height: 1,
                                ),
                              ),
                            ),
                            AgreementMobileTextField(
                                hintText: '', width: widthDevice * 0.50),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                'After Hours',
                                maxLines: 2,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'raleway',
                                  height: 1,
                                ),
                              ),
                            ),
                            AgreementMobileTextField(
                                hintText: '', width: widthDevice * 0.50),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                'Towing',
                                maxLines: 2,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'raleway',
                                  height: 1,
                                ),
                              ),
                            ),
                            AgreementMobileTextField(
                                hintText: '', width: widthDevice * 0.50),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                '*General Business Email',
                                maxLines: 2,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'raleway',
                                  height: 1,
                                ),
                              ),
                            ),
                            AgreementMobileTextField(
                                hintText: '', width: widthDevice * 0.50),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Business Registration:',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'ralewaybold',
                            height: 2,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Text(
                            '*Registered Name',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'raleway',
                              height: 1,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        AgreementMobileTextField(
                            hintText: '', width: widthDevice),
                        SizedBox(
                          height: 15,
                        ),
                        Center(
                          child: Text(
                            '*Registration Number',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'raleway',
                              height: 1,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        AgreementMobileTextField(
                            hintText: '', width: widthDevice),
                        SizedBox(
                          height: 15,
                        ),
                        Center(
                          child: Text(
                            '*VAT Number',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'raleway',
                              height: 1,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        AgreementMobileTextField(
                            hintText: '', width: widthDevice),
                        SizedBox(
                          height: 15,
                        ),
                        Center(
                          child: Text(
                            'Franchise Membership',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'raleway',
                              height: 1,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        AgreementMobileTextField(
                            hintText: 'Enter if applicable',
                            width: widthDevice),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Management Authority & Signature',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'ralewaybold',
                            height: 2,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'By submitting this Agreement electronically (through the ‘SUBMIT’ button), and/or signing and submitting it per hand or through e-mail, I confirm that I am duly authorised, and in agreement with the terms hereof:',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'raleway',
                            height: 1.5,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                'Date',
                                maxLines: 2,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'raleway',
                                  height: 1,
                                ),
                              ),
                            ),
                            AgreementMobileTextField(
                                hintText: '2024/04/15',
                                width: widthDevice * 0.50),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                '*Initials & Surname',
                                maxLines: 2,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'raleway',
                                  height: 1,
                                ),
                              ),
                            ),
                            AgreementMobileTextField(
                                hintText: '', width: widthDevice * 0.50),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                '*Designation',
                                maxLines: 2,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'raleway',
                                  height: 1,
                                ),
                              ),
                            ),
                            AgreementMobileTextField(
                                hintText: '', width: widthDevice * 0.50),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                '*Management Email',
                                maxLines: 2,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'raleway',
                                  height: 1,
                                ),
                              ),
                            ),
                            AgreementMobileTextField(
                                hintText: '', width: widthDevice * 0.50),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                '*Management Tell/Cell',
                                maxLines: 2,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'raleway',
                                  height: 1,
                                ),
                              ),
                            ),
                            AgreementMobileTextField(
                                hintText: '', width: widthDevice * 0.50),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                'IP Address',
                                maxLines: 2,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'raleway',
                                  height: 1,
                                ),
                              ),
                            ),
                            AgreementMobileTextField(
                                hintText: '102.222.243.185',
                                width: widthDevice * 0.50),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        //SUBMIT BUTTON

                        Center(
                          child: Container(
                            padding: const EdgeInsets.only(
                                top: 5, bottom: 5, left: 15, right: 15),
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
                              crossAxisAlignment: CrossAxisAlignment.center,
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
                        SizedBox(
                          height: 15,
                        ),
                        Center(
                          child: MobileLocationCheck(
                              text: 'Application Submitted'),
                        ),
                        SizedBox(
                          height: 15,
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
    );
  }
}
