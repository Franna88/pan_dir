import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JoinPBDPage/packageInfoPages/packagesPage.dart';

import '../../../../../myutility.dart';
import '../../pricingOptions/ui/GlassEffectPrice.dart';

class CorePackagePage extends StatefulWidget {
  const CorePackagePage({super.key});

  @override
  State<CorePackagePage> createState() => _CorePackagePageState();
}

class _CorePackagePageState extends State<CorePackagePage> {
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
                          'Build upon your included Starter Benefits with a SEO\n optimized profile ready to attract new customers.\n Update and manage your own listing with our easy \nto use Owners Portal, with the latest, accurate and\n consistent information.',
                      titleText: 'Core',
                      infoText2:
                          'Showcase your shop and take advantage of our Job\n Finder platform to connect with new talent.',
                      price: 'R99',
                      exploreOptions: [
                        {
                          'mainTitle': 'Dominate online\nsearches.',
                          'description':
                              'Go beyond basics. Unlock advanced features, build trust with detailed profiles, showcase expertise and streamline operations for a customer-centric experience. ',
                          'assetName': 'images/exploreOptions1.png',
                          'buttonText': 'Premium Option'
                        },
                        {
                          'mainTitle': 'Own your digital\nidentity',
                          'description':
                              'Build a trusted destination for your business with a custom domain, email, and professional branding.',
                          'assetName': 'images/exploreOptions3.png',
                          'buttonText': 'Premium+ Option'
                        }
                      ],
                      ballPointItems: [
                        'Panel beaters seeking a more active role in lead generation',
                        'Businesses wanting to showcase their expertise and services',
                        'Shops prioritizing real-time profile management and customer communication'
                      ],
                      benefitsTextItems: [
                        {
                          'boldText': 'All starter benefits included',
                          'text': '.'
                        },
                        {
                          'boldText': 'SEO Powerhouse:',
                          'text':
                              ' Our Search Engine Optimization (SEO) expertise elevates your \nprofile ranking in search results, ensuring potential clients find you easily.'
                        },
                        {
                          'boldText': 'Complete Profile Management:',
                          'text':
                              ' Control your online image with a secure Owners \nPortal 24/7, available for up to 1 User. Display 1 shop front & 1 logo in your gallery.\n'
                        },
                        {
                          'boldText': 'Boost Local Visibility:',
                          'text':
                              ' Display your street and postal address for easy location by \npotential customers. Tell & Cell and WhatsApp messaging options facilitate immediate \ncommunication with clients. Get instant quote requests via email.'
                        },
                        {
                          'boldText': 'Stand Out From the Crowd:',
                          'text':
                              ' Market your after-hours services and towing \ncapabilities to cater to a wider range of customer needs.'
                        },
                        {
                          'boldText': 'Cross-linked profiles',
                          'text':
                              ' on relevant directories maximize your online reach, putting \nyou in front of more leads.'
                        },
                        {
                          'boldText': 'Direct Job Access:',
                          'text':
                              'Access a pool of industry-specific job seekers actively searching \nfor work without 3rd party fees or bias.'
                        }
                      ],
                      optionText: 'Core Option',
                    )
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
