import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/mobilePricingOptionsPages/ui/mobileToggleSwitch.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/mobilePricingOptionsPages/ui/packageBenefitsMobileText.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/mobilePricingOptionsPages/ui/packageDescriptionWidget.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/mobilePricingOptionsPages/ui/paymentPlanMobileContainer.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/mobilePricingOptionsPages/ui/signUpMobileButton.dart';

class PremiumPlusMobile extends StatefulWidget {
  const PremiumPlusMobile({super.key});

  @override
  _PremiumPlusMobileState createState() => _PremiumPlusMobileState();
}

class _PremiumPlusMobileState extends State<PremiumPlusMobile> {
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
                'Premium+',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFE2822B),
                  fontSize: 40,
                  fontFamily: 'ralewaybold',
                  height: 1,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text:
                        'Build upon your included Starter, Core & Premium Benefits',
                    style: TextStyle(
                      color: Color(0xFFEF9040),
                      fontSize: 16,
                      fontFamily: 'raleway',
                      height: 1.2,
                    ),
                  ),
                  TextSpan(
                    text:
                        ' with our most comprehensive solution. This means you\'ll get a professional domain name*, email hosting, user management, and even a discount on capturing your business professionally.',
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
                  isMonthly ? 'R6,240' : 'R520',
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
            const SizedBox(
              height: 20,
            ),
            Center(child: SignUpMobileButton()),
            const SizedBox(
              height: 15,
            ),
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
                SizedBox(
                  width: 15,
                ),
                MobileToggleSwitch(
                  initialValue: isMonthly,
                  onChanged: (bool value) {
                    setState(() {
                      isMonthly = value;
                    });
                  },
                ),
                SizedBox(
                  width: 15,
                ),
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
            const SizedBox(
              height: 15,
            ),
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
                    top: heightDevice * 0.02,
                    right: widthDevice * 0.03,
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
                    left: 20,
                    child: Row(
                      children: [
                        PaymentPlanMobileContainer(
                          showDiscountTag: true,
                          price: isMonthly ? 'R6,240' : 'R520',
                          checkedItems: const [
                            'Include All Premium Benefits',
                            'Activation Fee (R299 once off)',
                            'Domain Hosting',
                            'Email Hosting',
                          ],
                          priceTitle: 'Premium +',
                          priceType: isMonthly ? 'Monthly' : 'Annually',
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
                boldText: 'All starter, core & premium benefits included',
                text: '.'),
            PackageBenefitsMobileText(
                boldText: 'Businesses seeking ',
                text:
                    'a complete online solution, including domain hosting and professional email accounts.'),
            PackageBenefitsMobileText(
              boldText: 'Email: ',  
              text:
                  'The client can create and manage up to 20 email accounts, linked to this .co.za hosted domain service.',
            ),
            PackageBenefitsMobileText(
                boldText: 'Add unlimited users and groups',
                text: ' in your Owners Portal.'),
            PackageBenefitsMobileText(
                boldText: 'Corporate discount',
                text:
                    ' on professional photo and video shoot that capture your workshop, team and quality of work.'),
            const SizedBox(
              height: 20,
            ),
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
            const SizedBox(
              height: 20,
            ),
            PackageDescriptionWidget(
              optionText: 'Premium+ Option',
              showReadMoreButton: false,
              textContent: Text(
                'Businesses seeking complete online dominance.\n\nBusinesses seeking a complete online solution, including a custom domain and professional email accounts.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'raleway',
                  height: 1,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
