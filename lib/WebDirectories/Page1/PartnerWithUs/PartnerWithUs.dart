import 'package:flutter/material.dart';
import 'package:webdirectories/WebDirectories/Page1/PartnerWithUs/PartnerWithUsComponents/ParntnerWithUsContainer.dart';
import 'package:webdirectories/myutility.dart';

class PartnerWithUs extends StatefulWidget {
  const PartnerWithUs({super.key});

  @override
  State<PartnerWithUs> createState() => _PartnerWithUsState();
}

class _PartnerWithUsState extends State<PartnerWithUs> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MyUtility(context).width,
      height: MyUtility(context).height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "Why partner with us?",
            style: TextStyle(
                fontSize: 48, fontFamily: 'ralewaysemi', color: Colors.black),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: MyUtility(context).width * 0.05,
              ),
              PartnerWithUsContainer(
                  icon: 'images/target.svg',
                  header: "Targeted Lead Generation",
                  paragraph:
                      "We offer niche specific directories with first page Google Rankings and targeted advertisement, ensuring you reach potential customers actively seeking your services and driving more qualified leads to your business. "),
              PartnerWithUsContainer(
                  icon: 'images/gear.svg',
                  header: "Actionable Insights",
                  paragraph:
                      "Leverage our data driven insights to optimize your listing, track key metrics (clicks, leads, conversions) and refine your marketing strategy for continuous growth, brand awareness and maximized Return on Investment (ROI)."),
              PartnerWithUsContainer(
                  icon: 'images/review.svg',
                  header: "Trustworthy Reviews",
                  paragraph:
                      "Stand out from your competition with trusted reviews and industry ratings that build confidence in potential customers. Real-time feedback from these reviews will help you improve your services and build lasting relationships giving you a clear edge."),
              SizedBox(
                width: MyUtility(context).width * 0.05,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: MyUtility(context).width * 0.05,
              ),
              PartnerWithUsContainer(
                  icon: 'images/partner.svg',
                  header: "Established Partners",
                  paragraph:
                      "With a proven decade-long track record and a commitment to customer satisfaction, we foster trustworthy relationships with businesses and industry leaders, offering you stability, valuable connections, and unwavering support for your success. "),
              PartnerWithUsContainer(
                  icon: 'images/keyss.svg',
                  header: "Owners Portal",
                  paragraph:
                      "Our scalable platform empowers you to manage your business profile anytime, anywhere, through our 24/7 accessible cloud platform, ensuring consistent and accurate information across over 11,200 profiles in 8 countries, helping you connect with a wider audience."),
              PartnerWithUsContainer(
                  icon: 'images/search.svg',
                  header: "SEO Expertise",
                  paragraph:
                      "Leverage our first page Google Rankings and comprehensive marketing solutions that combine SEO, SEM , and targeted advertising to drive organic traffic, increase brand visibility, and attract qualified leads who convert into paying customers."),
              SizedBox(
                width: MyUtility(context).width * 0.05,
              ),
            ],
          )
        ],
      ),
    );
  }
}
