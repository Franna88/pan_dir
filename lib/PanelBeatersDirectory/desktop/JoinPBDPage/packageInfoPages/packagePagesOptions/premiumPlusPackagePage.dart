import 'package:flutter/cupertino.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JoinPBDPage/packageInfoPages/packagesPage.dart';

import '../../../../../myutility.dart';
import '../../pricingOptions/ui/GlassEffectPrice.dart';

class PremiumPlusPackagePage extends StatelessWidget {
  const PremiumPlusPackagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MyUtility(context).height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/Pricing.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: MyUtility(context).width * 0.88,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Image.asset(
                'images/panelLogo.png',
                // height: 70,
                width: MyUtility(context).width * 0.23,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            child: GlassEffectPrice(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PackagesPage(
                        infoText:
                            'Build upon your included Starter, Core & Premium \nBenefits with our most comprehensive solution. This \nmeans you\'ll get a professional domain name*, email \nhosting, user management, and even a discount on \ncapturing your business professionally.',
                        titleText: 'Premium +',
                        infoText2: '',
                        price: 'R520',
                        exploreOptions: [],
                        benefitsTextItems: [
                          {
                            'boldText':
                                'All starter, core & premium benefits included',
                            'text': '.'
                          },
                          {
                            'boldText': 'Businesses seeking ',
                            'text':
                                'a complete online solution, including domain hosting\nand professional email accounts'
                          },
                          {
                            'boldText': 'Email:',
                            'text':
                                'The client can create and manage up to 20 email accounts, linked to this .co.za \nhosted domain service.'
                          },
                          {
                            'boldText': 'Add unlimited users and groups',
                            'text': 'in your Owners Portal.'
                          },
                          {
                            'boldText': 'Corporate discount',
                            'text':
                                ' on professional photo and video shoot that capture your \nworkshop, team and quality of work.'
                          }
                        ],
                        optionText: 'Premium+ Package',
                        ballPointItems: [
                          'Businesses seeking complete online dominance.',
                          'Businesses seeking a complete online solution, including a custom domain and \nprofessional email accounts.'
                        ])
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
