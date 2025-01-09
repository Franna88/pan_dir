import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/mobilePricingOptionsPages/ui/mobileToggleSwitch.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/mobilePricingOptionsPages/ui/packageBenefitsMobileText.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/mobilePricingOptionsPages/ui/packageDescriptionWidget.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/mobilePricingOptionsPages/ui/paymentPlanMobileContainer.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/mobilePricingOptionsPages/ui/signUpMobileButton.dart';

class CoreMobile extends StatefulWidget {
  const CoreMobile({super.key});

  @override
  State<CoreMobile> createState() => _CoreMobileState();
}

class _CoreMobileState extends State<CoreMobile> {
  bool isMonthly = true;

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Core',
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
                    text: 'Build upon your included Starter Benefits',
                    style: TextStyle(
                      color: Color(0xFFEF9040),
                      fontSize: 16,
                      fontFamily: 'raleway',
                      height: 1.2,
                    ),
                  ),
                  TextSpan(
                    text:
                        ' with a SEO optimized profile ready to attract new customers. Update and manage your own listing with our easy to use Owners Portal, with the latest, accurate and consistent information.\n\nShowcase your shop and take advantage of our Job Finder platform to connect with new talent.',
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
                  isMonthly ? 'R1 188' : 'R99',
                  style:
                      TextStyle(color: Colors.white, fontSize: 40, height: 1.3),
                ),
                Text(
                  isMonthly ? 'PA' : 'PM',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'raleway',
                      height: 3),
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
                    right: 10,
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
                    left: 22,
                    child: Row(
                      children: [
                        PaymentPlanMobileContainer(
                          price: isMonthly ? 'R1 188' : 'R99',
                          checkedItems: const [
                            'Include All Starter Benefits',
                            'Activation Fee (R299 once off)',
                            'Owners Portal Access',
                            'Contact Detail',
                            'Navigation',
                            'Job Finder',
                            'SEO Optimization'
                          ],
                          priceTitle: 'Core',
                          priceType: isMonthly ? 'Annually' : 'Monthly',
                          billingText: isMonthly
                              ? 'billed annually, excluding VAT'
                              : 'billed monthly, excluding VAT',
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            ),
            PackageBenefitsMobileText(
                boldText: 'All starter benefits included', text: '.'),
            PackageBenefitsMobileText(
                boldText: 'SEO Powerhouse: ',
                text:
                    'Our Search Engine Optimization (SEO) expertise elevates your profile ranking in search results, ensuring potential clients find you easily.'),
            PackageBenefitsMobileText(
              boldText: 'Complete Profile Management: ',
              text:
                  'Control your online image with a secure Owners Portal 24/7, available for up to 1 User. Display 1 shop front & 1 logo in your gallery.',
            ),
            PackageBenefitsMobileText(
                boldText: 'Boost Local Visibility: ',
                text:
                    'Display your street and postal address for easy location by potential customers. Tell & Cell and WhatsApp messaging options facilitate immediate communication with clients. Get instant quote requests via email.'),
            PackageBenefitsMobileText(
                boldText: 'Stand Out From the Crowd: ',
                text:
                    'Market your after-hours services and towing capabilities to cater to a wider range of customer needs.'),
            PackageBenefitsMobileText(
                boldText: 'Cross-linked profiles',
                text:
                    ' on relevant directories maximize your online reach, putting you in front of more leads.'),
            PackageBenefitsMobileText(
                boldText: 'Direct Job Finder Access: ',
                text:
                    'Access a pool of industry-specific job seekers actively searching for work without 3rd party fees or bias.'),
            const SizedBox(height: 20),
            Center(
              child: Container(
                height: 210,
                width: 170,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/PackegIcon.png'),
                      fit: BoxFit.fill),
                ),
              ),
            ),
            const SizedBox(height: 20),
            PackageDescriptionWidget(
              optionText: 'Core Option',
              textContent: Text(
                'Panel beaters seeking a more active role in lead generation.\n\nBusinesses wanting to showcase their expertise and services.\n\nShops prioritizing real-time profile management and customer communication.',
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
    );
  }
}
