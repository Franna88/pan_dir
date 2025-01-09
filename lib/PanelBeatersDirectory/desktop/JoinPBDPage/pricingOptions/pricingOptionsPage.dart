import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JoinPBDPage/pricingOptions/ui/paymentPlanComtainer.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JoinPBDPage/registerCustomPlan/customPlan.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/components/myutility.dart';
import '../packageInfoPages/packagePagesOptions/packagePage.dart';
import 'ui/GlassEffectPrice.dart';

class PricingOptionsPage extends StatefulWidget {
  final Function(int) updateContainerIndex;
  final Function(String) updatePackageType;

  PricingOptionsPage(
      {super.key,
      required this.updateContainerIndex,
      required this.updatePackageType});

  @override
  State<PricingOptionsPage> createState() => _PricingOptionsPageState();
}

class _PricingOptionsPageState extends State<PricingOptionsPage> {
  // Open popup register
  Future openRegistrationProcess() => showDialog(
      context: context,
      builder: (context) {
        return Dialog(
            child: CustomPlans(closeDialog: () => Navigator.pop(context)));
      });

  bool isAnnual = false;

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage(
          'images/Pricing.png',
        ),
        fit: BoxFit.fill,
      )),
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
              child: Container(
                height: heightDevice * 0.76,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Pricing Options:',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 38,
                        fontFamily: 'raleway',
                        fontWeight: FontWeight.w700,
                        height: 1,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Perfectly tailored for every stage of your growth. Get started today!',
                      style: TextStyle(
                          color: Color(0xFFF4F4F4),
                          fontSize: 18,
                          fontFamily: 'raleway',
                          fontWeight: FontWeight.w500,
                          height: 1),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Monthly',
                            style: TextStyle(
                              color:
                                  isAnnual ? Color(0xFFF4F4F4) : Colors.orange,
                              fontSize: 20,
                              fontFamily: 'raleway',
                              fontWeight: FontWeight.w500,
                            )),
                        SizedBox(
                          width: 15,
                        ),
                        Switch(
                          value: isAnnual,
                          onChanged: (value) {
                            setState(() {
                              isAnnual = value;
                            });
                          },
                          activeTrackColor: Colors.black,
                          activeColor: Colors.white,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text('Annually',
                            style: TextStyle(
                              color:
                                  isAnnual ? Colors.orange : Color(0xFFF4F4F4),
                              fontSize: 20,
                              fontFamily: 'raleway',
                              fontWeight: FontWeight.w500,
                            )),
                      ],
                    ),
                    SizedBox(
                      height: heightDevice / 80,
                    ),
                    SizedBox(
                      height: heightDevice * 0.50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          PaymentPlanContainer(
                            readMore: () {
                              widget.updateContainerIndex(9); // Starter index
                              widget.updatePackageType("Starter");
                            },
                            register: () {
                              openRegistrationProcess();
                            },
                            price: isAnnual ? 'R0.0' : 'R0.0',
                            checkedItems: const [
                              'Free Profile',
                              'No Activation Fee',
                              'Industry Specific',
                              'Address',
                              'Email Contact with Customers',
                              'Riviews',
                            ],
                            priceTitle: 'Starter',
                            priceType: isAnnual ? 'Annually' : 'Monthly',
                            billingText: isAnnual
                                ? 'billed annually, excluding VAT'
                                : 'billed monthly, excluding VAT',
                          ),
                          SizedBox(
                            width: widthDevice / 50,
                          ),
                          PaymentPlanContainer(
                            readMore: () {
                              widget.updateContainerIndex(10); // Core index
                              widget.updatePackageType("Core");
                            },
                            register: () {
                              openRegistrationProcess();
                            },
                            price: isAnnual ? 'R1188' : 'R99',
                            checkedItems: const [
                              'Include All Starter Benefits',
                              'Activation Fee (R299 once off)',
                              'Owners Portal Access',
                              'Contact Detail',
                              'Navigation ',
                              'Job Finder',
                              'SEO Optimization'
                            ],
                            priceTitle: 'Core',
                            priceType: isAnnual ? 'Annually' : 'Monthly',
                            billingText: isAnnual
                                ? 'billed annually, excluding VAT'
                                : 'billed monthly, excluding VAT',
                          ),
                          SizedBox(
                            width: widthDevice / 50,
                          ),
                          PaymentPlanContainer(
                            readMore: () {
                              widget.updateContainerIndex(11); // Premium index
                              widget.updatePackageType("Premium");
                            },
                            register: () {
                              openRegistrationProcess();
                            },
                            price: isAnnual ? 'R5208' : 'R434',
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
                            priceType: isAnnual ? 'Annually' : 'Monthly',
                            billingText: isAnnual
                                ? 'billed annually, excluding VAT'
                                : 'billed monthly, excluding VAT',
                          ),
                          SizedBox(
                            width: widthDevice / 50,
                          ),
                          PaymentPlanContainer(
                            readMore: () {
                              widget.updateContainerIndex(
                                  12); // PremiumPlus index
                              widget.updatePackageType("PremiumPlus");
                            },
                            register: () {
                              openRegistrationProcess();
                            },
                            price: isAnnual ? 'R6240' : 'R520',
                            checkedItems: const [
                              'Include All Premium Benefits',
                              'Activation Fee (R299 once off)',
                              'Domain Hosting',
                              'Email Hosting',
                            ],
                            priceTitle: 'Premium +',
                            priceType: isAnnual ? 'Annually' : 'Monthly',
                            billingText: isAnnual
                                ? 'billed annually, excluding VAT'
                                : 'billed monthly, excluding VAT',
                          )
                        ],
                      ),
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
