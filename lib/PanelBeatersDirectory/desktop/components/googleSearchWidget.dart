import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:webdirectories/myutility.dart';

class GoogleSearchWidget extends StatefulWidget {
  final TextEditingController searchController;
  final Function(List<dynamic>) onSearchResultsChanged;
  final Function(bool) updateIsLoading;
  GoogleSearchWidget(
      {super.key,
      required this.searchController,
      required this.onSearchResultsChanged,
      required this.updateIsLoading});
  @override
  _GoogleSearchWidgetState createState() => _GoogleSearchWidgetState();
}

class _GoogleSearchWidgetState extends State<GoogleSearchWidget> {
  List<dynamic> _searchResults = [];
  bool _isLoading = false;

  Future<void> _performSearch() async {
    if (widget.searchController.text.isEmpty) return;

    setState(() {
      _isLoading = true;
    });

    final query = widget.searchController.text;
    final String url =
        'https://us-central1-web-directories.cloudfunctions.net/app/api/v1/custom-search/search?query=$query';

    try {
      final response = await http.get(Uri.parse(url));
      widget.updateIsLoading(true);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        widget.onSearchResultsChanged(data['items'] ?? []);
        setState(() {
          _searchResults = data['items'] ?? [];
        });
      } else {
        print('Error: ${response.reasonPhrase}');
      }
    } catch (error) {
      print('Error fetching search results: $error');
    } finally {
      setState(() {
        _isLoading = false;
        widget.updateIsLoading(false);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isMobile = MyUtility(context).width < 600;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Align(
            alignment: isMobile ? Alignment.topCenter : Alignment.topLeft,
            child: Container(
              width: isMobile
                  ? MyUtility(context).width * 0.65
                  : MyUtility(context).width * 0.2,
              height: 38,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 247, 246, 246),
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: Row(
                children: [
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 10),
                  //   child: Container(
                  //     width: 25,
                  //     height: 25,
                  //     decoration: BoxDecoration(
                  //       color: Colors.black,
                  //       shape: BoxShape.circle,
                  //     ),
                  //     padding: EdgeInsets.zero,
                  //     child: Icon(
                  //       Icons.keyboard_arrow_right_outlined,
                  //       color: Colors.white,
                  //       size: 16,
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    width: 6,
                  ),
                  Expanded(
                    child: TextFormField(
                      onChanged: (String? value) async {
                        await _performSearch();
                      },
                      controller: widget.searchController,
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        hintText: 'Type here',
                        hintStyle: const TextStyle(
                          fontSize: 16,
                          fontFamily: 'ralewaysemi',
                          color: Color.fromARGB(255, 51, 51, 51),
                        ),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.transparent,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
