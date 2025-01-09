import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Footer/panelFooter.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/ServicesComponent/ServiceStackedButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/ServicesComponent/ServicesContainer.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/services.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/components/googleSearchWidget.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/components/iconButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/components/myutility.dart';
import 'package:webdirectories/PanelBeatersDirectory/utils/firebaseImageUtils.dart';
import 'package:webdirectories/PanelBeatersDirectory/utils/loginUtils.dart';
import 'package:url_launcher/url_launcher.dart';

class ServicesByKeywordSearch extends StatefulWidget {
  final List<dynamic> searchResults;
  const ServicesByKeywordSearch({super.key, required this.searchResults});

  @override
  State<ServicesByKeywordSearch> createState() =>
      _ServicesByKeywordSearchState();
}

class _ServicesByKeywordSearchState extends State<ServicesByKeywordSearch> {
  void _launchURL(String url) async {
    // Launch the URL using a package like `url_launcher`
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      print('Could not launch $url');
    }
  }

  @override
  void initState() {
    print('init: ${widget.searchResults}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isMobile = MyUtility(context).width < 600;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MyUtility(context).height,
              width: MyUtility(context).width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/mainbackgroundPanel.png'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: MyUtility(context).height * 0.035),
                  Container(
                    color: Colors.white,
                    width: isMobile
                        ? MyUtility(context).width * 0.65
                        : MyUtility(context).width * 0.85,
                    height: MyUtility(context).height * 0.9,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Expanded(
                        child: widget.searchResults.isEmpty
                            ? Center(child: Text('No results found.'))
                            : ListView.builder(
                                itemCount: widget.searchResults.length,
                                itemBuilder: (context, index) {
                                  final item = widget.searchResults[index];
                                  final title = item['title'] ?? 'No Title';
                                  final snippet = item['snippet'] ?? '';
                                  final link = item['link'] ?? '';
                                  final displayLink = item['displayLink'] ?? '';
                                  final rawFormattedUrl =
                                      item['formattedUrl'] ?? '';

                                  // Separate the domain and path for proper breadcrumb formatting
                                  final uri = Uri.tryParse(rawFormattedUrl);
                                  final domain = uri?.host ?? displayLink;
                                  final path =
                                      uri?.path.replaceAll('/', ' > ') ?? '';

                                  // Remove trailing '>' if present
                                  final formattedPath =
                                      path.substring(0, path.length - 2);

                                  // Combine the domain and formatted path
                                  final formattedUrl = formattedPath.isNotEmpty
                                      ? '$domain $formattedPath'
                                      : domain;

                                  // Extract featured image from pagemap
                                  final pagemap = item['pagemap'];
                                  final cseImage =
                                      pagemap?['cse_image']?[0]?['src'];
                                  final ogImage =
                                      pagemap?['metatags']?[0]?['og:image'];
                                  final featuredImage = cseImage ?? ogImage;

                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: GestureDetector(
                                      onTap: () => _launchURL(link),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          if (featuredImage != null)
                                            Image.network(
                                              featuredImage,
                                              height: 100,
                                              width: double.infinity,
                                              fit: BoxFit.cover,
                                            ),
                                          SizedBox(height: 8),
                                          Text(
                                            formattedUrl,
                                            style: TextStyle(
                                              color: Colors.green,
                                              fontSize: 14,
                                            ),
                                          ),
                                          Text(
                                            title,
                                            style: TextStyle(
                                              color: Colors.blue,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: 4),
                                          Text(
                                            snippet,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            PanelFooter()
          ],
        ),
      ),
    );
  }
}
