import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/mobilePricingOptionsPages/ui/packageBenefitsMobileText.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/mobilePricingOptionsPages/ui/packageDescriptionWidget.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/mobilePricingOptionsPages/ui/paymentPlanMobileContainer.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/mobilePricingOptionsPages/ui/signUpMobileButton.dart';

class StarterMobile extends StatelessWidget {
  const StarterMobile({super.key});

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
                'Starter',
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
            Text(
              'Launch your online presence and stand out among other businesses with a profile in our powerful, industry-specific Panel Beater Directory. Get started with an address and email contact detail and encourage feedback from satisfied customers to build your reputation and trust.\n\nAnd the best part? It’s absolutely free.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'raleway',
                height: 1.2,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'R0',
                  style:
                      TextStyle(color: Colors.white, fontSize: 40, height: 1.3),
                ),
                Text(
                  'PM',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'raleway',
                      height: 3),
                ),
              ],
            ),
            Text(
              'billed monthly, excluding VAT',
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
            Center(
              child: Container(
                height: heightDevice * 0.51,
                child: Stack(
                  children: [
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
                            price: 'R0',
                            checkedItems: const [
                              'Free Profile',
                              'No Activation Fee',
                              'Industry Specific',
                              'Address',
                              'Email Contact with Customers',
                              'Reviews',
                            ],
                            priceTitle: 'Starter',
                            priceType: 'Monthly',
                            billingText: 'billed annually, excluding VAT',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            PackageBenefitsMobileText(
                boldText: 'Free Profile Forever:',
                text:
                    ' No monthly fees, just a free listing to showcase your business to a targeted audience searching for reliable panel beaters.'),
            PackageBenefitsMobileText(
                boldText: 'Increased Visibility:',
                text:
                    ' Stand out from the crowd in a trusted industry specific directory dedicated solely to the auto body repair industry. We cross-link your profile to our other directories, maximizing your online reach.'),
            PackageBenefitsMobileText(
              boldText: 'Local Focus:',
              text:
                  ' Display your street address, allowing local motorists to easily find your shop.',
            ),
            PackageBenefitsMobileText(
                boldText: 'Build Trust with Reviews:',
                text:
                    ' Encourage satisfied customers to leave reviews. These client experiences and ratings add credibility and help potential customers choose you with more confidence.'),
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
              optionText: 'Starter Option',
              textContent: Text(
                'New panel beating businesses getting started online.',
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
