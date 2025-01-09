import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/mobilePricingOptionsPages/ui/mobileToggleSwitch.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/mobilePricingOptionsPages/ui/packageBenefitsMobileText.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/mobilePricingOptionsPages/ui/packageDescriptionWidget.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/mobilePricingOptionsPages/ui/paymentPlanMobileContainer.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/mobilePricingOptionsPages/ui/signUpMobileButton.dart';

class PremiumMobile extends StatefulWidget {
  const PremiumMobile({super.key});

  @override
  _PremiumMobileState createState() => _PremiumMobileState();
}

class _PremiumMobileState extends State<PremiumMobile> {
  bool isMonthly = true;

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Premium',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFE2822B),
                    fontSize: 40,
                    fontFamily: 'ralewaybold',
                    height: 1,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'This package elevates your online presence ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'raleway',
                        height: 1.2,
                      ),
                    ),
                    TextSpan(
                      text: 'beyond your included Starter & Core Benefits.',
                      style: TextStyle(
                        color: Color(0xFFEF9040),
                        fontSize: 16,
                        fontFamily: 'raleway',
                        height: 1.2,
                      ),
                    ),
                    TextSpan(
                      text:
                          ' Dominate online searches, simplify lead management, and build unwavering customer trust! Build and customise your full profile and showcase your expertise, accreditations, team members and unique story. \n\nEvaluate key metrics and track your online performance. Integrate your Lightstone EchoMBR results to demonstrate your commitment to quality repairs and better streamline your communication with your clients.  Utilize our parts & equipment platform to buy & sell. Publish special offers & promotions.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'raleway',
                        height: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    isMonthly ? 'R4 948' : 'R434',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      height: 1.3,
                    ),
                  ),
                  Text(
                    isMonthly ? 'PA' : 'PM',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'raleway',
                      height: 3,
                    ),
                  ),
                ],
              ),
              Text(
                isMonthly
                    ? 'billed annually, excluding VAT'
                    : 'billed monthly, excluding VAT',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontFamily: 'raleway',
                  height: 1,
                ),
              ),
              const SizedBox(height: 20),
              Center(child: SignUpMobileButton()),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Monthly',
                    style: TextStyle(
                      color: Color(0xFFF4F4F4),
                      fontSize: 18,
                      fontFamily: 'raleway',
                    ),
                  ),
                  SizedBox(width: 15),
                  MobileToggleSwitch(
                    initialValue: isMonthly,
                    onChanged: (value) {
                      setState(() {
                        isMonthly = value;
                      });
                    },
                  ),
                  SizedBox(width: 15),
                  Text(
                    'Annually',
                    style: TextStyle(
                      color: Color(0xFFF4F4F4),
                      fontSize: 18,
                      fontFamily: 'raleway',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Center(
                child: Container(
                  height: heightDevice * 0.51,
                  child: Stack(children: [
                    Positioned(
                      top: 50,
                      child: Container(
                        width: widthDevice * 0.73,
                        height: heightDevice * 0.38,
                        decoration: ShapeDecoration(
                          color: Color.fromARGB(151, 241, 243, 244),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13.07),
                          ),
                          shadows: [
                            BoxShadow(
                              color: Color(0x3F000000),
                              blurRadius: 2.38,
                              offset: Offset(0, 2.38),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 24,
                      right: 8,
                      child: Container(
                        width: widthDevice * 0.67,
                        height: heightDevice * 0.45,
                        decoration: ShapeDecoration(
                          color: Color(0xB2F1F3F4),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13.07),
                          ),
                          shadows: [
                            BoxShadow(
                              color: Color(0x3F000000),
                              blurRadius: 2.38,
                              offset: Offset(0, 2.38),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 24,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: PaymentPlanMobileContainer(
                              showDiscountTag: true,
                              price: isMonthly ? 'R4 948' : 'R434',
                              checkedItems: const [
                                'Include All Core Benefits',
                                'Activation Fee (R299 once off)',
                                'Online Profile',
                                'Quotation Requests',
                                'Accreditations',
                                'Client Interaction',
                                'Publish Special Offers',
                                'Parts & Equipment Trading'
                              ],
                              priceTitle: 'Premium',
                              priceType: isMonthly ? 'Annually' : 'Monthly',
                              billingText: isMonthly
                                  ? 'billed annually, excluding VAT'
                                  : 'billed monthly, excluding VAT',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
              ),
              PackageBenefitsMobileText(
                  boldText: 'All starter & core benefits included', text: '.'),
              PackageBenefitsMobileText(
                  boldText: 'Unmatched Online Presence: ',
                  text:
                      'We cross-link your profile across relevant directories, ensuring maximum online reach and our advanced SEO and SEM strategies to make you the top choice. Display a premium photo and video gallery with links to your website and all social media platforms.'),
              PackageBenefitsMobileText(
                boldText: 'Streamlined Client Management: ',
                text:
                    'Enjoy the convenience of our secure Owners Portal. Nominate and manage up to 4 additional users, edit your profile 24/7, and update staff changes, registration documents, OEM accreditations, insurance panel contracts, franchise affiliations and industry bodies and specialist services!',
              ),
              PackageBenefitsMobileText(
                  boldText: 'Actionable Insights & Transparency: ',
                  text:
                      'Gain a competitive edge with up to date Lightstone CSI reports in your Owners Portal and publicly displayed on your profile. Build trust by showcasing your commitment to quality repairs.'),
              PackageBenefitsMobileText(
                  boldText: 'Effortless Customer Communication:',
                  text:
                      ' Enable a service rating tool for client feedback. Showcase your team with staff photos, designations and more.'),
              PackageBenefitsMobileText(
                  boldText: 'Advertise special offers',
                  text:
                      ' directly through your profile to incentivize customers.'),
              PackageBenefitsMobileText(
                  boldText: 'List financial assistance options',
                  text: 'available to clients through 3rd party platforms.'),
              PackageBenefitsMobileText(
                  boldText: 'Utilize our Parts & Equipment Platform ',
                  text: 'to sell or trade with other auto body specialists.'),
              const SizedBox(height: 20),
              Center(
                child: Container(
                  height: 210,
                  width: 170,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/PackegIcon.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              PackageDescriptionWidget(
                optionText: 'Premium Option',
                textContent: Text(
                  'Established panel beating businesses and franchise shops seeking to dominate the online market.\n\nBusinesses with OEM Approvals and Insurance Panel Accreditations looking to attract high-value clients and maximize lead generation.\n\nBusinesses who prioritize communication, transparency, and a customer-centric experience.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'raleway',
                    height: 1,
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
