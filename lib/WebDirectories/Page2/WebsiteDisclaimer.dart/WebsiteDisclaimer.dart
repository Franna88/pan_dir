import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webdirectories/myutility.dart';

class WebsiteDisclaimer extends StatefulWidget {
  const WebsiteDisclaimer({super.key});

  @override
  State<WebsiteDisclaimer> createState() => _WebsiteDisclaimerState();
}

class _WebsiteDisclaimerState extends State<WebsiteDisclaimer> {
  //open url
  goToLink(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      // Handle error if URL cannot be launched
      print('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MyUtility(context).width / 1.1,
      height: MyUtility(context).height * 1.6,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Website Information, Disclaimer and Privacy Policy",
              style: TextStyle(
                  fontSize: 48, fontFamily: 'ralewaybold', color: Colors.black),
            ),
            Text(
              "Smashpro Web Directories PTY Ltd ",
              style: TextStyle(
                  fontSize: 28, fontFamily: 'ralewaysemi', color: Colors.black),
            ),
            SizedBox(
              height: MyUtility(context).height * 0.025,
            ),
            Text(
              "Last Updated: 08 March 2024",
              style: TextStyle(
                  fontSize: 18, fontFamily: 'ralewayit', color: Colors.black),
            ),
            SizedBox(
              height: MyUtility(context).height * 0.025,
            ),
            Text(
              "Information & Disclaimer Ownership:",
              style: TextStyle(
                  fontSize: 28, fontFamily: 'ralewaysemi', color: Colors.black),
            ),
            SizedBox(
              height: MyUtility(context).height * 0.025,
            ),
            Text(
              "These Terms and Conditions of Use (the “Terms of Use”) apply to the website located at https://webdirectories.co.za/, hereafter identified as “WD” (and all associated sites linked its subsidiaries, and affiliates. The Site is the property of Smashpro Web Directories (Pty) Ltd. By using this site, you agree to the terms of use; WD reserves the right, at its sole discretion, to change, modify, add, or remove portions of these Terms of Use, at any time. It is your responsibility to check these Terms of Use periodically for changes. Your continued use of the Site following the posting of changes will mean that you accept and agree to the changes. If you comply with these Terms of Use, WD grants you a personal, non-exclusive, non-transferable, limited privilege to enter and use the Site.",
              style: TextStyle(
                  fontSize: 18, fontFamily: 'ralewayit', color: Colors.black),
            ),
            SizedBox(
              height: MyUtility(context).height * 0.025,
            ),
            Text(
              "Content:",
              style: TextStyle(
                  fontSize: 28, fontFamily: 'ralewaysemi', color: Colors.black),
            ),
            Text(
              "All text, graphics, user interfaces, visual interfaces, photographs, trademarks, logos, sounds, music, artwork, and computer code (collectively, “Content”), including but not limited to the design, structure, selection, coordination, expression, “look and feel” and arrangement of such Content, contained on the Site is owned, controlled or licensed by WD, and is protected by copyright, patent and trademark laws, and various other intellectual property rights and unfair competition laws. Except as expressly provided in these Terms of Use, no part of the Site and no Content may be copied, reproduced, republished, uploaded, posted, publicly displayed, encoded, translated, transmitted, or distributed in any way (including “mirroring”) to any other computer, server, Web site or another medium for publication or distribution or for any commercial enterprise, without WD’ express prior written consent.",
              style: TextStyle(
                  fontSize: 18, fontFamily: 'ralewayit', color: Colors.black),
            ),
            SizedBox(
              height: MyUtility(context).height * 0.025,
            ),
            Text(
              "Disclaimer:",
              style: TextStyle(
                  fontSize: 28, fontFamily: 'ralewaysemi', color: Colors.black),
            ),
            SizedBox(
              height: MyUtility(context).height * 0.025,
            ),
            Text(
              "Neither WD nor any third-party content providers shall be liable for any errors, inaccuracies, or delays in the content, or for any actions taken in reliance thereon. WD expressly disclaims all warranties, expressed or implied, as to the accuracy of any of the content or information provided for any purpose. Although WD makes reasonable efforts to obtain reliable content, WD does not guarantee the accuracy of or endorse the views or opinions given. This site may point to other Internet sites that may be of interest to you, however, WD does not endorse or take responsibility for the content on such other sites. Whilst WD has used reasonable endeavours to ensure that the information provided in Communications and newsletters by WD is accurate and up to date as at the time of issue, it reserves the right to make corrections and does not warrant that it is accurate or complete. WD hereby disclaims all liability to the maximum extent permitted by law in relation to the communications & newsletters and does not give any warranties (including any statutory ones) in relation to the news. Any copying, redistribution, or re-publication of communications, newsletters, or the content thereof, for commercial gain, is strictly prohibited.",
              style: TextStyle(
                  fontSize: 18, fontFamily: 'ralewayit', color: Colors.black),
            ),
            SizedBox(
              height: MyUtility(context).height * 0.025,
            ),
            Text(
              "Usage:",
              style: TextStyle(
                  fontSize: 28, fontFamily: 'ralewaysemi', color: Colors.black),
            ),
            SizedBox(
              height: MyUtility(context).height * 0.025,
            ),
            Text(
              "You may use the information on WD products and services (such as datasheets, knowledge base articles, and similar materials) purposely made available by WD for downloading from the Site, provided that you (1) not remove any proprietary notice language in all copies of such documents, (2) use such information only for your personal, non-commercial informational purpose and do not copy or post such information on any networked computer or broadcast it in any media, (3) make no modifications to any such information, and (4) not make any additional representations or warranties relating to such documents. You may not attempt to gain unauthorized access to any portion or feature of the Site, or any other systems or networks connected to the Site or to any WD server, or to any of the services offered on or through the Site, by hacking, password “mining” or any other illegitimate means. You may not probe, scan, or test the vulnerability of the Site or any network connected to the Site, nor breach the security or authentication measures on the Site or any network connected to the Site. You may not reverse look-up, trace or seek to trace any information on any other user of or visitor to the Site, or any other customer of WD, including any WD, account not owned by you, to its source, or exploit the Site or any service or information made available or offered by or through the Site, in any way where the purpose is to reveal any information, including but not limited to personal identification or information, other than your own information, as provided for by the Site. You may not use the Site or any Content for any purpose that is unlawful or prohibited by these Terms of Use or to solicit the performance of any illegal activity or other activity which infringes the rights of WD or others.",
              style: TextStyle(
                  fontSize: 18, fontFamily: 'ralewayit', color: Colors.black),
            ),
            SizedBox(
              height: MyUtility(context).height * 0.025,
            ),
            Text(
              "Owners Portal:",
              style: TextStyle(
                  fontSize: 28, fontFamily: 'ralewaysemi', color: Colors.black),
            ),
            SizedBox(
              height: MyUtility(context).height * 0.025,
            ),
            Text(
              "WD’s Privacy Policy contractually agrees a Membership-based working relationship with its clients. Part of this agreement is facilitating access to the exclusive communication section, identified as the “Owners Portal (OP)”. Access is regulated through an advanced Username and Password security system. A copy of the terms and conditions of the OP agreement is available on the homepage of each Directory service under the title tag “Register for Free”. The contracted client and their nominated users gain access to their individual business profiles and then assume full responsibility to regularly edit and update the contents thereof published under the “Featured “section of the specific Directory service. Contents revised, including text and images regarding business contact details, marketing communications, compliance documentation, accreditation, and the promotion of specialist services. ",
              style: TextStyle(
                  fontSize: 18, fontFamily: 'ralewayit', color: Colors.black),
            ),
            SizedBox(
              height: MyUtility(context).height * 0.025,
            ),
            Text(
              "Accuracy and Validity of Information:",
              style: TextStyle(
                  fontSize: 28, fontFamily: 'ralewaysemi', color: Colors.black),
            ),
            SizedBox(
              height: MyUtility(context).height * 0.025,
            ),
            Text(
              "Suppliers and Users of any of the Web Directory services agree that the correctness and validity of all information on display are in the best interest of all parties and all reasonable measures are being taken to ensure as such. Due to the nature of our connected marketplace where information is available online 24/7, but many other business factors are not under the control of WD or their clients, (e.g. COVID-19 regulations),  any user of the information or services offered on any of the Directories owned by WD, understand and agree that they should communicate and verify the accuracy and validity of any information with the individual business before making a decision to utilize or contract service.",
              style: TextStyle(
                  fontSize: 18, fontFamily: 'ralewayit', color: Colors.black),
            ),
            SizedBox(
              height: MyUtility(context).height * 0.025,
            ),
            Text(
              "Purchases:",
              style: TextStyle(
                  fontSize: 28, fontFamily: 'ralewaysemi', color: Colors.black),
            ),
            SizedBox(
              height: MyUtility(context).height * 0.025,
            ),
            Text(
              "Additional terms and conditions may apply to purchases of goods or services and to specific portions or features of the Site, including contests, promotions, or other similar features, all which terms are made a part of these Terms of Use by this reference. You agree to abide by such other terms and conditions, including where applicable representing that you are of sufficient legal age to use or participate in such service or feature. If there is a conflict between these Terms of Use and the terms posted for or applicable to a specific portion of the Site or for any service offered on or through the Site, the latter terms shall control with respect to your use of that portion of the Site or the specific service.",
              style: TextStyle(
                  fontSize: 18, fontFamily: 'ralewayit', color: Colors.black),
            ),
            SizedBox(
              height: MyUtility(context).height * 0.025,
            ),
            Text(
              "Obligations:",
              style: TextStyle(
                  fontSize: 28, fontFamily: 'ralewaysemi', color: Colors.black),
            ),
            SizedBox(
              height: MyUtility(context).height * 0.025,
            ),
            Text(
              "WD’s obligations, regarding its products and services, are governed solely by the agreements pursuant to which they are provided, and nothing on this Site should be construed to alter such agreements. WD may make changes to any products or services offered on the Site, or to the applicable prices for any such products or services, at any time, without notice. The materials on the Site with respect to products and services may be out of date, and WD makes no commitment to update the materials on the Site with respect to such products and services.",
              style: TextStyle(
                  fontSize: 18, fontFamily: 'ralewayit', color: Colors.black),
            ),
            SizedBox(
              height: MyUtility(context).height * 0.025,
            ),
            Text(
              "Accounts, Passwords, and Security:",
              style: TextStyle(
                  fontSize: 28, fontFamily: 'ralewaysemi', color: Colors.black),
            ),
            SizedBox(
              height: MyUtility(context).height * 0.025,
            ),
            Text(
              "Certain features or services offered on or through the Site may require you to open an account and/or register a username and password. This includes access to the Owners Portal of a specific Directory (more detail available in the next section) You are entirely responsible for maintaining the confidentiality of the information you hold for your account, including your password, and for all activity that occurs under your account because of your failing to keep this information secure and confidential. You agree to notify WD immediately of any unauthorized use of your account or password, or any other breach of security. You may be held liable for losses incurred by WD or any other user of or visitor to the Site due to someone else using your username, password, or account because of your failure to keep your account information secure and confidential. You may not use anyone else’s username, password, or account at any time without the express permission and consent of the holder of that username, password, or account. WD cannot and will not be liable for any loss or damage arising from your failure to comply with these obligations.",
              style: TextStyle(
                  fontSize: 18, fontFamily: 'ralewayit', color: Colors.black),
            ),
            SizedBox(
              height: MyUtility(context).height * 0.025,
            ),
            Text(
              "Privacy Policy:",
              style: TextStyle(
                  fontSize: 28, fontFamily: 'ralewaysemi', color: Colors.black),
            ),
            SizedBox(
              height: MyUtility(context).height * 0.025,
            ),
            Text(
              "WD’s Privacy Policy applies to the use of this Site, and its terms are made a part of these Terms of Use by this reference. Additionally, by using the Site, you acknowledge and agree that Internet transmissions are never completely private or secure. You understand that any message or information you send to the Site may be read or intercepted by others, even if there is a special notice that a particular transmission (for example, credit card information) is encrypted.This Privacy Policy describes our policies and procedures on the collection, use, and disclosure of user information when a user accesses this website and the services we offer. We use your Personal Data to provide and improve the service. By using our services, the user agrees to the collection and use of information in accordance with this Privacy Policy.",
              style: TextStyle(
                  fontSize: 18, fontFamily: 'ralewayit', color: Colors.black),
            ),
            SizedBox(
              height: MyUtility(context).height * 0.025,
            ),
            Text(
              "Privacy Policy:",
              style: TextStyle(
                  fontSize: 28, fontFamily: 'ralewaysemi', color: Colors.black),
            ),
            SizedBox(
              height: MyUtility(context).height * 0.025,
            ),
            Text(
              "•Security of your Personal Data:",
              style: TextStyle(
                  fontSize: 20, fontFamily: 'ralewaysemi', color: Colors.black),
            ),
            Text(
              "The security of your personal data is important to us, but it must be remembered that no method of transmission over the Internet, or method of electronic storage is 100% secure. We strive to use commercially acceptable, and state-of-the-art technology to protect your data. Our systems have not been breached since inception in July 2013.",
              style: TextStyle(
                  fontSize: 18, fontFamily: 'ralewayit', color: Colors.black),
            ),
            SizedBox(
              height: MyUtility(context).height * 0.025,
            ),
            Text(
              "•Personal Data:",
              style: TextStyle(
                  fontSize: 20, fontFamily: 'ralewaysemi', color: Colors.black),
            ),
            Text(
              "While using our services, we may ask you, the user, to provide us with certain information that can be used to contact or identify you. Personally, identifiable information may include, but is not limited to:",
              style: TextStyle(
                  fontSize: 18, fontFamily: 'ralewayit', color: Colors.black),
            ),
            Text(
              "○ E-mail address",
              style: TextStyle(
                  fontSize: 18, fontFamily: 'ralewayit', color: Colors.black),
            ),
            Text(
              "○ First and Last names",
              style: TextStyle(
                  fontSize: 18, fontFamily: 'ralewayit', color: Colors.black),
            ),
            Text(
              "○ Phone or Cell Phone number",
              style: TextStyle(
                  fontSize: 18, fontFamily: 'ralewayit', color: Colors.black),
            ),
            Text(
              "○ Address detail",
              style: TextStyle(
                  fontSize: 18, fontFamily: 'ralewayit', color: Colors.black),
            ),
            Text(
              "○ Usage Data",
              style: TextStyle(
                  fontSize: 18, fontFamily: 'ralewayit', color: Colors.black),
            ),
            SizedBox(
              height: MyUtility(context).height * 0.025,
            ),
            Text(
              "•Usage Data:",
              style: TextStyle(
                  fontSize: 20, fontFamily: 'ralewaysemi', color: Colors.black),
            ),
            Text(
              "This is collected automatically when using our services. Usage dat may include information such as:",
              style: TextStyle(
                  fontSize: 18, fontFamily: 'ralewayit', color: Colors.black),
            ),
            Text(
              "○ Your device's internet protocol address (IP Address)",
              style: TextStyle(
                  fontSize: 18, fontFamily: 'ralewayit', color: Colors.black),
            ),
            Text(
              "○ Browser type and version",
              style: TextStyle(
                  fontSize: 18, fontFamily: 'ralewayit', color: Colors.black),
            ),
            Text(
              "○ Pages of our services visited",
              style: TextStyle(
                  fontSize: 18, fontFamily: 'ralewayit', color: Colors.black),
            ),
            Text(
              "○ Time and date as well as time spent on those pages ",
              style: TextStyle(
                  fontSize: 18, fontFamily: 'ralewayit', color: Colors.black),
            ),
            Text(
              "○ Unique device identifiers and other diagnostic data",
              style: TextStyle(
                  fontSize: 18, fontFamily: 'ralewayit', color: Colors.black),
            ),
            SizedBox(
              height: MyUtility(context).height * 0.025,
            ),
            Text(
              "•Mobile Device:",
              style: TextStyle(
                  fontSize: 20, fontFamily: 'ralewaysemi', color: Colors.black),
            ),
            Text(
              "When you access our services through a mobile device. We may collect certain information automatically, but not limited to:",
              style: TextStyle(
                  fontSize: 18, fontFamily: 'ralewayit', color: Colors.black),
            ),
            Text(
              "○ The type of mobile device and its unique ID (IP address)",
              style: TextStyle(
                  fontSize: 18, fontFamily: 'ralewayit', color: Colors.black),
            ),
            Text(
              "○ Your mobile operating system ",
              style: TextStyle(
                  fontSize: 18, fontFamily: 'ralewayit', color: Colors.black),
            ),
            Text(
              "○ Type of mobile internet browser used, and information sent by these browsers when visiting our website.",
              style: TextStyle(
                  fontSize: 18, fontFamily: 'ralewayit', color: Colors.black),
            ),
            Text(
              "○ Unique device identifiers and other diagnostic data",
              style: TextStyle(
                  fontSize: 18, fontFamily: 'ralewayit', color: Colors.black),
            ),
            SizedBox(
              height: MyUtility(context).height * 0.025,
            ),
            Text(
              "•Cookies and Tracking Technologies:",
              style: TextStyle(
                  fontSize: 20, fontFamily: 'ralewaysemi', color: Colors.black),
            ),
            Text(
              "We use cookies and similar tracking technologies to track the activities on our website services and store certain information. These include scripts, tags, and beacons that are used to analyse and improve our services.",
              style: TextStyle(
                  fontSize: 18, fontFamily: 'ralewayit', color: Colors.black),
            ),
            Text(
              "○ A cookie is a small file placed on your device. You can instruct your browser to refuse all Cookies or to indicate when a cookie is being sent. However, if you do not accept cookies, you may not be able to use some parents of our services. Unless you have adjusted your browser settings so that it will refuse cookies, our services may use cookies.",
              style: TextStyle(
                  fontSize: 18, fontFamily: 'ralewayit', color: Colors.black),
            ),
            Text(
              '○ Cookies can be "Persistent" or “Session". Persistent Cookies remain on your personal computer or mobile device when you go offline, while Session Cookies are deleted as soon as you close your web browser.',
              style: TextStyle(
                  fontSize: 18, fontFamily: 'ralewayit', color: Colors.black),
            ),
            SizedBox(
              height: MyUtility(context).height * 0.025,
            ),
            Text(
              "•Use of Your Personal Data:",
              style: TextStyle(
                  fontSize: 20, fontFamily: 'ralewaysemi', color: Colors.black),
            ),
            Text(
              " The company may use your personal data for the following purposes:",
              style: TextStyle(
                  fontSize: 18, fontFamily: 'ralewayit', color: Colors.black),
            ),
            Text(
              "○ To provide and maintain our services, including the monitoring of usage of our services.",
              style: TextStyle(
                  fontSize: 18, fontFamily: 'ralewayit', color: Colors.black),
            ),
            Text(
              "○ To manage your account. Registration as a user of your account gives you access to different functionalities of the services that are available to you as a registered user.",
              style: TextStyle(
                  fontSize: 18, fontFamily: 'ralewayit', color: Colors.black),
            ),
            Text(
              "○ For the performance of a contract. The development, compliance, and undertaking of the purchase contractor of the products, items, and services you have purchased personally or on behalf of a business entity.",
              style: TextStyle(
                  fontSize: 18, fontFamily: 'ralewayit', color: Colors.black),
            ),
            Text(
              "○ To contact you via E-mail, SMS, telephone calls, or other equivalent forms of electronic communication, such as a mobile application's push notifications regarding updates or informative communications related to the functionalities, products, or contracts services, including the security updates when necessary or reasonable for their implementation. ",
              style: TextStyle(
                  fontSize: 18, fontFamily: 'ralewayit', color: Colors.black),
            ),
            Text(
              "○ To provide you with news, special offers, and general information about goods, services, and events that we offer that are like those that you have already purchased or enquired about unless you have opted not to receive such information.",
              style: TextStyle(
                  fontSize: 18, fontFamily: 'ralewayit', color: Colors.black),
            ),
            Text(
              "○ To manage your requests and attend to your requests made to us.",
              style: TextStyle(
                  fontSize: 18, fontFamily: 'ralewayit', color: Colors.black),
            ),
            Text(
              "○ For other purposes. We may use your information such as data analysis, identifying usage trends, determining the effectiveness of our promotional campaigns, and evaluating and improving our services., products, marketing, and client experience. ",
              style: TextStyle(
                  fontSize: 18, fontFamily: 'ralewayit', color: Colors.black),
            ),
            Text(
              "○ With other users. When you share personal information or otherwise interact in the public areas with other users (e.g., Reviews section) Such information may be viewed by all users and may be publicly distributed. ",
              style: TextStyle(
                  fontSize: 18, fontFamily: 'ralewayit', color: Colors.black),
            ),
            Text(
              "○ With your consent, we may disclose your personal information for other purposes specifically agreed to in a specific service section.",
              style: TextStyle(
                  fontSize: 18, fontFamily: 'ralewayit', color: Colors.black),
            ),
            SizedBox(
              height: MyUtility(context).height * 0.025,
            ),
            Text(
              "•Retention of your Personal Data:",
              style: TextStyle(
                  fontSize: 20, fontFamily: 'ralewaysemi', color: Colors.black),
            ),
            Text(
              " The company will retain your Personal Data only for as long as it is necessary for the purposes set out in this Privacy Policy. we will retain and use this personal data to the extent necessary to comply with our legal obligations, resolve disputes, and enforce our legal agreements and policies. Also, for internal analysis purposes to increase functionality and strengthen the security of our services.",
              style: TextStyle(
                  fontSize: 18, fontFamily: 'ralewayit', color: Colors.black),
            ),
            SizedBox(
              height: MyUtility(context).height * 0.025,
            ),
            Text(
              "•Transfer of your Personal Data:",
              style: TextStyle(
                  fontSize: 20, fontFamily: 'ralewaysemi', color: Colors.black),
            ),
            Text(
              " Your information, including Personal Data, is processed at the Company's operating offices and in any other places where the parties involved in the processing are located. It means that this information, as available online for public display, may be transferred to, and maintained on computers located where the data protection laws may differ from those in your local jurisdiction. Your consent to this Privacy Policy followed by your submission of such information represents your agreement to that transfer. The Company will take all steps reasonably necessary to ensure your data and personal information is treated securely and in accordance with this Privacy Policy.",
              style: TextStyle(
                  fontSize: 18, fontFamily: 'ralewayit', color: Colors.black),
            ),
            SizedBox(
              height: MyUtility(context).height * 0.025,
            ),
            Text(
              "•Children's Privacy: ",
              style: TextStyle(
                  fontSize: 20, fontFamily: 'ralewaysemi', color: Colors.black),
            ),
            Text(
              "  Our services do not address anyone under the age of 16. We do not knowingly collect personally identifiable information from anyone under the age of 16. If you are a parent or guardian and you are aware, become aware, that your child has provided us with personal data, please contact us. We will take the necessary steps to remove that information from our services",
              style: TextStyle(
                  fontSize: 18, fontFamily: 'ralewayit', color: Colors.black),
            ),
            SizedBox(
              height: MyUtility(context).height * 0.025,
            ),
            Text(
              "•Changes to this Privacy Policy:  ",
              style: TextStyle(
                  fontSize: 20, fontFamily: 'ralewaysemi', color: Colors.black),
            ),
            Text(
              "  We may update our Privacy Policy from time to time. We will notify any changes by posting the new Private Policy on this page. You are advised to review this Privacy Policy periodically for any changes. Changes are effective when published and the date stamp at the top of this Web Disclaimer should be deemed to be the date updated. ",
              style: TextStyle(
                  fontSize: 18, fontFamily: 'ralewayit', color: Colors.black),
            ),
            SizedBox(
              height: MyUtility(context).height * 0.025,
            ),
            Text(
              "Links to Other Sites: ",
              style: TextStyle(
                  fontSize: 20, fontFamily: 'ralewaysemi', color: Colors.black),
            ),
            Text(
              " This Site may contain links to other independent third-party Web sites (“Linked Sites”). These Linked Sites are provided solely as a convenience to our visitors. Such Linked Sites are not under WD’s control, and WD is not responsible for and does not endorse the content of such Linked Sites, including any information or materials contained on such Linked Sites. You will need to make your own independent judgment regarding your interaction with these Linked Sites. This disclaimer applies to any damages, liability, or injuries caused by any failure of performance, error, omission, interruption, deletion, defect, delay in operation or transmission, computer virus, communication line failure, theft or destruction of or unauthorized access to, alteration of, or use, whether for breach of contract, tort, negligence or any other cause of action.",
              style: TextStyle(
                  fontSize: 18, fontFamily: 'ralewayit', color: Colors.black),
            ),
            SizedBox(
              height: MyUtility(context).height * 0.025,
            ),
            Text(
              "Access: ",
              style: TextStyle(
                  fontSize: 20, fontFamily: 'ralewaysemi', color: Colors.black),
            ),
            Text(
              " WD reserves the right to do any of the following, at any time, without notice: (1) to modify, suspend or terminate operation of or access to the Site, or any portion of the Site, for any reason; (2) to modify or change the Site, or any portion of the Site, and any applicable policies or terms; and (3) to interrupt the operation of the Site, or any portion of the Site, as necessary to perform routine or non-routine maintenance, error correction, or other changes. You agree that WD may, in its sole discretion and without prior notice, terminate your access to the Site and/or block your future access to the Site if we determine that you have violated these Terms of Use or other agreements or guidelines which may be associated with your use of the Site. You also agree that any violation by you of these Terms of Use will constitute an unlawful and unfair business practice and that these remedies are in addition to any other remedies WD may have at law or in equity.",
              style: TextStyle(
                  fontSize: 18, fontFamily: 'ralewayit', color: Colors.black),
            ),
            SizedBox(
              height: MyUtility(context).height * 0.025,
            ),
            Text(
              "Indemnity: ",
              style: TextStyle(
                  fontSize: 20, fontFamily: 'ralewaysemi', color: Colors.black),
            ),
            Text(
              " You agree to indemnify and hold WD, its directors, shareholders, predecessors, successors in interest, employees, agents, subsidiaries, and affiliates, harmless from any demands, loss, liability, claims, or expenses (including attorney’s fees), made against WD by any third party due to or arising out of or in connection with your use of the Site. ",
              style: TextStyle(
                  fontSize: 18, fontFamily: 'ralewayit', color: Colors.black),
            ),
            SizedBox(
              height: MyUtility(context).height * 0.025,
            ),
            Text(
              "Preservation & Disclosure:",
              style: TextStyle(
                  fontSize: 20, fontFamily: 'ralewaysemi', color: Colors.black),
            ),
            Text(
              "You acknowledge and agree that WD may preserve any transmittal or communication by you with WD through the Site or any service offered on or through the Site, and may also disclose such data if required to do so by law or Smashpro determines that such preservation or disclosure is reasonably necessary to (1) comply with legal process, (2) enforce these Terms of Use, (3) respond to claims that any such data violates the rights of others, or (4) protect the rights, property or personal safety of WD, its employees, users of or visitors to the Site, and the public.",
              style: TextStyle(
                  fontSize: 18, fontFamily: 'ralewayit', color: Colors.black),
            ),
            SizedBox(
              height: MyUtility(context).height * 0.025,
            ),
            Text(
              "Resolution:",
              style: TextStyle(
                  fontSize: 20, fontFamily: 'ralewaysemi', color: Colors.black),
            ),
            Text(
              "You agree that all matters relating to your access to or use of the Site, including all disputes, will be governed by the laws of the Republic of South Africa and waive any objection to such jurisdiction or venue. Any claim under these Terms of Use must be brought within one (1) year after the cause of action arises, or such claim or cause of action is barred. In the event of any controversy or dispute between WD and you arising out of or in connection with your use of the Site, the parties shall attempt, promptly and in good faith, to resolve any such dispute. If we are unable to resolve any such dispute within a reasonable time (not to exceed thirty (30) days), then either party may submit such controversy or dispute to mediation. If the dispute cannot be resolved through mediation, then the parties shall be free to pursue any right or remedy available to them under applicable law.",
              style: TextStyle(
                  fontSize: 18, fontFamily: 'ralewayit', color: Colors.black),
            ),
            SizedBox(
              height: MyUtility(context).height * 0.025,
            ),
            Text(
              "Google Compulsory Policies:",
              style: TextStyle(
                  fontSize: 20, fontFamily: 'ralewaysemi', color: Colors.black),
            ),
            Text(
              "In accordance with some of Google’s recent compulsory policies, we herewith inform you that we might be tracking your cookies as our website/company is currently undertaking Google AdWords remarketing of any other Google AdWords feature that tracks such cookies.\n\nBy visiting this site, you agree that certain of our Google AdWords remarketing and or other advertisements can follow you as you visit other websites that form part of Google’s Display Network (GDN)./n/nNote that we shall under no circumstances be utilizing any personally identifiable information as obtained through our Google AdWords remarketing campaign in any other related marketing endeavours – online or otherwise. (Such restricted utilization of information includes the sharing of such with third parties.) The Company shall under no circumstances be using any sensitive information of any nature on any of our remarketing tags./n/nThe Company shall duly endeavor to adhere to all the current in-effect policies of Google related to remarketing or any other form of Google advertising in all its Google AdWords marketing campaigns. (In instances of possible non-conformity to such, the Company shall endeavor to rectify such in a prompt manner).",
              style: TextStyle(
                  fontSize: 18, fontFamily: 'ralewayit', color: Colors.black),
            ),
            SizedBox(
              height: MyUtility(context).height * 0.025,
            ),
            Text(
              "You may opt out of seeing advertisements for the website, by simply clicking here:",
              style: TextStyle(
                  fontSize: 18, fontFamily: 'ralewayit', color: Colors.black),
            ),
            GestureDetector(
              onTap: () {
                goToLink("http://www.google.com/policies/technologies/ads/.");
              },
              child: Text(
                "http://www.google.com/policies/technologies/ads/.",
                style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'ralewayit',
                    color: Color.fromRGBO(30, 30, 248, 1)),
              ),
            ),
            SizedBox(
              height: MyUtility(context).height * 0.025,
            ),
            Text(
              "We have implemented certain Google Analytics features for the primary purpose of attempting to ascertain the success of our online marketing endeavours via the Google AdWords platform.",
              style: TextStyle(
                  fontSize: 18, fontFamily: 'ralewayit', color: Colors.black),
            ),
            SizedBox(
              height: MyUtility(context).height * 0.025,
            ),
            GestureDetector(
              onTap: () {
                goToLink(" https: //ads.google.com/home/");
              },
              child: Text(
                "• View the Google Third-Party Disclosure Notice",
                style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'ralewayit',
                    color: Color.fromRGBO(30, 30, 248, 1)),
              ),
            ),
            GestureDetector(
              onTap: () {
                goToLink("https://policies.google.com/technologies/ads");
              },
              child: Text(
                " •View Google’s Privacy & Terms Documents",
                style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'ralewayit',
                    color: Color.fromRGBO(30, 30, 248, 1)),
              ),
            ),
            SizedBox(
              height: MyUtility(context).height * 0.025,
            ),
          ],
        ),
      ),
    );
  }
}
