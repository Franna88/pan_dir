import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JoinPBDPage/pricingOptions/ui/pricingBenefitsText.dart';

class PaymentPlanContainer extends StatefulWidget {
  String priceTitle;
  String price;
  String priceType;
  List checkedItems;
  String billingText;
  VoidCallback readMore;
  VoidCallback register;
  PaymentPlanContainer(
      {super.key,
      required this.checkedItems,
      required this.price,
      required this.priceTitle,
      required this.priceType,
      required this.billingText,
      required this.readMore,
      required this.register});

  @override
  State<PaymentPlanContainer> createState() => _PaymentPlanContainerState();
}

class _PaymentPlanContainerState extends State<PaymentPlanContainer> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          isHovered = false;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        width: widthDevice / 5,
        height: heightDevice - 330,
        decoration: BoxDecoration(
          color: isHovered ? Color(0xFF0E1013) : Color(0xFFF4F4F4),
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
                    fontSize: widthDevice / 70,
                    fontFamily: 'ralewaybold',
                    fontWeight: FontWeight.w700,
                    height: 1),
              ),
              Text(
                widget.price,
                style: TextStyle(
                    color: isHovered ? Colors.white : Colors.black,
                    fontSize: widthDevice / 60,
                    fontFamily: 'raleway',
                    fontWeight: FontWeight.w700,
                    height: 1.2),
              ),
              Row(
                children: [
                  Text(
                    widget.billingText,
                    style: TextStyle(
                        color: isHovered ? Colors.white : Colors.black,
                        fontSize: widthDevice * 0.009,
                        fontFamily: 'raleway',
                        fontWeight: FontWeight.w500,
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
                height: heightDevice / 80,
              ),
              for (var i = 0; i < widget.checkedItems.length; i++)
                PricingBenefitsText(
                  circleColor: isHovered ? Color(0xFFE2822B) : Colors.black,
                  text: widget.checkedItems[i],
                  textColor: isHovered ? Color(0xFFE2822B) : Colors.black,
                ),
              Spacer(),
              widthDevice < 800
                  ? Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Container(
                            /*width: MediaQuery.of(context).size.width * 0.08,*/
                            /*height: MediaQuery.of(context).size.height * 0.05,*/
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    isHovered ? Colors.white : Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: EdgeInsets.zero,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 3, bottom: 3, left: 5, right: 13),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        color: isHovered
                                            ? Colors.black
                                            : Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                      padding: EdgeInsets.zero,
                                      child: Icon(
                                        Icons.keyboard_arrow_right_outlined,
                                        color: isHovered
                                            ? Colors.white
                                            : Colors.black,
                                        size: 14,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      'Read More',
                                      style: TextStyle(
                                        color: isHovered
                                            ? Colors.black
                                            : Colors.white,
                                        fontSize: 14,
                                        fontFamily: 'raleway',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )),
                    )
                  //SMALLER SCREEN
                  //**************** */
                  : Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Container(
                            /*width: MediaQuery.of(context).size.width * 0.08,*/
                            /*height: MediaQuery.of(context).size.height * 0.05,*/
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    isHovered ? Colors.white : Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: EdgeInsets.zero,
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  widget.readMore();
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 1, bottom: 1, left: 5, right: 13),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        width: 18,
                                        height: 18,
                                        decoration: BoxDecoration(
                                          color: isHovered
                                              ? Colors.black
                                              : Colors.white,
                                          shape: BoxShape.circle,
                                        ),
                                        padding: EdgeInsets.zero,
                                        child: Icon(
                                          Icons.keyboard_arrow_right_outlined,
                                          color: isHovered
                                              ? Colors.white
                                              : Colors.black,
                                          size: 12,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        'Read More',
                                        style: TextStyle(
                                          color: isHovered
                                              ? Colors.black
                                              : Colors.white,
                                          fontSize: 12,
                                          fontFamily: 'raleway',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )),
                    ),
              SizedBox(
                height: heightDevice * 0.01,
              ),
              widthDevice < 800
                  ? Align(
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
                                  top: 4, bottom: 4, left: 25, right: 25),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Sign Up Now!',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontFamily: 'raleway',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  //SMALLER SCREEN
                  // **************
                  : Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Container(
                          /*width: MediaQuery.of(context).size.width * 0.08,*/
                          /*height: MediaQuery.of(context).size.height * 0.05,*/
                          child: ElevatedButton(
                            onPressed: () {
                              widget.register();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFE2822B),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: EdgeInsets.zero,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 1, bottom: 1, left: 15, right: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Sign Up Now!',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
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
                height: heightDevice * 0.01,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
