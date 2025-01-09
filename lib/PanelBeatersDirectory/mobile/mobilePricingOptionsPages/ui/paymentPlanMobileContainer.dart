import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/components/myutility.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/mobilePricingOptionsPages/ui/DiscountTag.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/mobilePricingOptionsPages/ui/pricingBenefitsMobileText.dart';

class PaymentPlanMobileContainer extends StatefulWidget {
  final String priceTitle;
  final String price;
  final String priceType;
  final List checkedItems;
  final String billingText;
  final bool showDiscountTag;

  PaymentPlanMobileContainer(
      {super.key,
      required this.checkedItems,
      required this.price,
      required this.priceTitle,
      required this.priceType,
      required this.billingText,
      this.showDiscountTag = false});

  @override
  State<PaymentPlanMobileContainer> createState() =>
      _PaymentPlanMobileContainerState();
}

class _PaymentPlanMobileContainerState
    extends State<PaymentPlanMobileContainer> {
  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return Container(
      width: widthDevice * 0.615,
      height: heightDevice * 0.51,
      decoration: BoxDecoration(
        border: Border.all(
            width: 0.8, color: const Color.fromARGB(255, 139, 139, 139)),
        color: Color(0xFF0E1013),
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 0,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 25, top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.priceTitle,
              style: TextStyle(
                  color: Color(0xFFE2822B),
                  fontSize: 19,
                  fontFamily: 'ralewaybold',
                  height: 1),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Row(
                children: [
                  Text(
                    widget.price,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontFamily: 'ralewaymedium',
                        height: 1.2),
                  ),
                  SizedBox(
                    width: MyUtility(context).width * 0.04,
                  ),
                  if (widget.showDiscountTag) DiscountTag(),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  widget.billingText,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontFamily: 'ralewaymedium',
                      height: 1),
                ),
                Icon(
                  Icons.info_rounded,
                  size: 12,
                  color: Colors.grey,
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            for (var i = 0; i < widget.checkedItems.length; i++)
              PricingBenefitsMobileText(
                text: widget.checkedItems[i],
                textColor: Colors.white,
              ),
            Spacer(),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Container(
                    /*width: MediaQuery.of(context).size.width * 0.08,*/
                    /*height: MediaQuery.of(context).size.height * 0.05,*/
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: EdgeInsets.zero,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5, right: 13),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 18,
                              height: 18,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                shape: BoxShape.circle,
                              ),
                              padding: EdgeInsets.zero,
                              child: Icon(
                                Icons.keyboard_arrow_right_outlined,
                                color: Colors.white,
                                size: 12,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Call me back',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontFamily: 'raleway',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Container(
                  /*width: MediaQuery.of(context).size.width * 0.08,*/
                  /*height: MediaQuery.of(context).size.height * 0.05,*/
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFE2822B),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.zero,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 1, bottom: 1, left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Sign Up Now!',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontFamily: 'raleway',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
