import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JoinPBDPage/packageInfoPages/packagesPage.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/components/myutility.dart';
import '../../pricingOptions/ui/GlassEffectPrice.dart';

class StarterPackagePage extends StatefulWidget {
  const StarterPackagePage({super.key});

  @override
  State<StarterPackagePage> createState() => _StarterPackagePageState();
}

class _StarterPackagePageState extends State<StarterPackagePage> {
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
                          'Launch your online presence and stand out among\n other businesses with a profile in our powerful,\n industry-specific Panel Beater Directory.  Get \nstarted with an address and email contact detail \nand encourage feedback from satisfied customers \nto build your reputation and trust.',
                      titleText: 'Starter',
                      infoText2: 'And the best part? It’s absolutely free.',
                      price: 'R0.00',
                      exploreOptions: [
                        {
                          'mainTitle': 'More Leads.\nMore control.',
                          'description':
                              'Boost your online presence with SEO & real-\ntime profile updates. Connect with industry \ntalent.',
                          'assetName': 'images/exploreOptions2.png',
                          'buttonText': 'Core Option'
                        },
                        {
                          'mainTitle': 'Dominate online\nsearches.',
                          'description':
                              'Go beyond basics. Unlock advanced features, build trust with detailed profiles, showcase expertise and streamline operations for a customer-centric experience. ',
                          'assetName': 'images/exploreOptions1.png',
                          'buttonText': 'Premium Option'
                        }
                      ],
                      ballPointItems: [
                        'New panel beating businesses getting started online'
                      ],
                      benefitsTextItems: [
                        {
                          'boldText': 'Free Profile Forever:',
                          'text':
                              ' No monthly fees, just a free listing to showcase your business \nto a targeted audience searching for reliable panel beaters.'
                        },
                        {
                          'boldText': 'Increased Visibility:',
                          'text':
                              ' Stand out from the crowd in a trusted industry specific \ndirectory dedicated solely to the auto body repair industry. We cross-link your profile \nto our other directories, maximizing your online reach.'
                        },
                        {
                          'boldText': 'Local Focus:',
                          'text':
                              ' Display your street address, allowing local motorists to easily find\nyour shop.'
                        },
                        {
                          'boldText': 'Build Trust with Reviews:',
                          'text':
                              ' Encourage satisfied customers to leave reviews. These \nclient experiences and ratings add credibility and help potential customers choose you \nwith more confidence.'
                        }
                      ],
                      optionText: 'Starter Option',
                    ),
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
