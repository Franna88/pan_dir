import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/ContactUsPage/ContactUsMainPage.dart';
import 'package:webdirectories/WebDirectories/Footer/FooterComponents/FooterTextButton.dart';
import 'package:webdirectories/WebDirectories/Page1/Page1.dart';
import 'package:webdirectories/WebDirectories/Page2/Page2.dart';
import 'package:webdirectories/WebDirectories/Page3/Page3.dart';
import 'package:webdirectories/WebDirectories/Page4/Page4.dart';
import 'package:webdirectories/WebDirectories/Page5/Page5.dart';
import 'package:webdirectories/WebDirectories/Page7/GetinTouch/GetinTouch.dart';
import 'package:webdirectories/WebDirectories/Page7/Page7.dart';
import 'package:webdirectories/myutility.dart';

class Footer extends StatefulWidget {
  const Footer({super.key});

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MyUtility(context).height * 0.5,
      decoration: const BoxDecoration(
        color: Color(0xFF0E1013),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildLogoSection(context),
              _buildPagesSection(context),
              _buildSubscribeSection(context),
            ],
          ),
          _buildFooterDivider(context),
          _buildFooterInfoSection(context),
        ],
      ),
    );
  }

  Widget _buildLogoSection(BuildContext context) {
    return SizedBox(
      width: MyUtility(context).width / 3.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'images/webDirLogo.png',
            height: MyUtility(context).height * 0.12,
            width: MyUtility(context).width * 0.15,
          ),
          SizedBox(height: MyUtility(context).height * 0.01),
          const Text(
            'Our passionate team guides users towards informed choices through user-friendly interfaces, clear data sources, and innovative tools.',
            style: TextStyle(
              fontSize: 15.5,
              fontFamily: 'raleway',
              color: Colors.white,
            ),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }

  Widget _buildPagesSection(BuildContext context) {
    return SizedBox(
      width: MyUtility(context).width * 0.1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: MyUtility(context).height * 0.1),
          const Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              'Pages',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'RalewaySemi',
                color: Colors.white,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          _buildFooterButtons(),
        ],
      ),
    );
  }

  Widget _buildFooterButtons() {
    return Column(
      children: [
        FooterTextButton(
            text: 'Home',
            onpress: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Material(
                            child: Page1(),
                          )));
            }),
        FooterTextButton(
            text: 'Our Story',
            onpress: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Material(
                            child: Page3(),
                          )));
            }),
        FooterTextButton(
            text: 'Watif',
            onpress: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Material(
                            child: Page4(),
                          )));
            }),
        FooterTextButton(
            text: 'Articles',
            onpress: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Material(
                            child: Page5(),
                          )));
            }),
        FooterTextButton(
            text: 'Contact Us',
            onpress: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Material(
                            child: Page7(),
                          )));
            }),
        FooterTextButton(
            text: 'Disclaimer',
            onpress: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Material(
                            child: Page2(),
                          )));
            }),
      ],
    );
  }

  Widget _buildSubscribeSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: MyUtility(context).height * 0.03),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: const Text(
            'Subscribe to Newsletter',
            style: TextStyle(
              fontSize: 16.5,
              fontFamily: 'RalewaySemi',
              color: Colors.white,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        SizedBox(height: MyUtility(context).height * 0.01),
        _buildEmailInputField(context),
        SizedBox(height: MyUtility(context).height * 0.025),
        _buildSocialMediaIcons(),
      ],
    );
  }

  Widget _buildEmailInputField(BuildContext context) {
    return SizedBox(
      width: MyUtility(context).width * 0.2,
      height: 45,
      child: TextFormField(
        controller: emailController,
        style: const TextStyle(
          fontFamily: 'Raleway',
          color: Color(0xFF717375),
          fontSize: 16,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          labelText: 'Enter your email here',
          labelStyle: const TextStyle(
            fontSize: 16,
            fontFamily: 'RalewaySemi',
            color: Color(0xFF717375),
          ),
          suffixIcon: IconButton(
            icon: const Icon(Icons.send),
            onPressed: () {},
          ),
        ),
      ),
    );
  }

  Widget _buildSocialMediaIcons() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildIconButton(
          imagePath: 'images/facebook1.png',
          url: 'https://www.facebook.com/WDirectories/',
          width: 55,
          height: 55,
        ),
        _buildIconButton(
          imagePath: 'images/Group.png',
          url: 'https://www.linkedin.com/company/web-directories/about/',
          width: 50,
          height: 50,
        ),
        _buildIconButton(
          imagePath: 'images/skill-icons_instagram.png',
          url: 'https://www.instagram.com/webdirectories/',
          width: 50,
          height: 50,
        ),
      ],
    );
  }

  Widget _buildIconButton({
    required String imagePath,
    required String url,
    double width = 50,
    double height = 50,
  }) {
    return IconButton(
      icon: Image.asset(
        imagePath,
        height: height,
        width: width,
      ),
      onPressed: () async {
        if (await canLaunch(url)) {
          await launch(url);
        } else {
          // Handle error if URL cannot be launched
          print('Could not launch $url');
        }
      },
    );
  }

  Widget _buildFooterDivider(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MyUtility(context).height * 0.05),
        Container(
          width: MyUtility(context).width - 20,
          height: 0.5,
          color: Colors.white.withOpacity(0.38),
        ),
        SizedBox(height: MyUtility(context).height * 0.025),
      ],
    );
  }

  Widget _buildFooterInfoSection(BuildContext context) {
    return SizedBox(
      width: MyUtility(context).width / 1.8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildCopyRightSection(),
          _buildContactInfo(),
          _buildAddressInfo(),
        ],
      ),
    );
  }

  Widget _buildCopyRightSection() {
    return Row(
      children: [
        SvgPicture.asset(
          'images/CC.svg',
          width: 14,
          height: 14,
        ),
        const Text(
          ' 2024 Copy ',
          style: TextStyle(
            fontSize: 12,
            fontFamily: 'Raleway',
            color: Color(0xFFF4F4F4),
          ),
        ),
        const Text(
          'Web Directories',
          style: TextStyle(
            fontSize: 13,
            fontFamily: 'RalewaySemi',
            color: Color(0xFFF4F4F4),
          ),
        ),
      ],
    );
  }

  Widget _buildContactInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Contact Us',
          style: TextStyle(
            fontSize: 13,
            fontFamily: 'RalewaySemi',
            color: Colors.white,
          ),
        ),
        Text(
          '+27 12 403 0120',
          style: TextStyle(
            fontSize: 12,
            color: Color(0xFFF4F4F4),
          ),
        ),
        Text(
          'hello@webdirectories.co.za',
          style: TextStyle(
            fontSize: 12,
            fontFamily: 'Raleway',
            color: Color(0xFFF4F4F4),
          ),
        ),
      ],
    );
  }

  Widget _buildAddressInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Address',
          style: TextStyle(
            fontSize: 13,
            fontFamily: 'RalewaySemi',
            color: Colors.white,
          ),
        ),
        Text.rich(
          TextSpan(
            text: '63',
            style: TextStyle(
              fontSize: 12,
              color: Color(0xFFF4F4F4),
            ),
            children: [
              TextSpan(
                text: ' Bokmakierie Street, Eden, George, 6529',
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'Raleway',
                  color: Color(0xFFF4F4F4),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
