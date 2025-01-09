import 'package:flutter/material.dart';
import 'package:flutter_quill/extensions.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:webdirectories/myutility.dart';

class AddressAutoCompleteField extends StatefulWidget {
  final Function(Map<String, String> data) onSelected;
  const AddressAutoCompleteField({super.key, required this.onSelected});

  @override
  State<AddressAutoCompleteField> createState() =>
      _AddressAutoCompleteFieldState();
}

class _AddressAutoCompleteFieldState extends State<AddressAutoCompleteField> {
  final _addressController = TextEditingController();
  var uuid = new Uuid();
  String _sessionToken = '';
  List<dynamic> _placeList = [];
  bool showDropDown = false;
  @override
  void initState() {
    super.initState();
  }

  _onChanged() {
    try {
      if (_sessionToken == '') {
        setState(() {
          _sessionToken = uuid.v4();
        });
      }

      if (_addressController.text.length == 0 && showDropDown == true) {
        setState(() {
          showDropDown = false;
        });
      } else if (_addressController.text.length > 0 && showDropDown == false) {
        setState(() {
          showDropDown = true;
        });
      }
      getSuggestion(_addressController.text);
    } catch (e) {
      print('error: $e');
    }
  }

  void getSuggestion(String input) async {
    try {
      print('input: $input');
      Map<String, String>? header = {
        'Access-Control-Allow-Origin': '*', // Required for CORS support to work
        "Access-Control-Allow-Credentials":
            "true", // Required for cookies, authorization headers with HTTPS
        "Access-Control-Allow-Headers":
            "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
        "Access-Control-Allow-Methods": "GET,POST, OPTIONS"
      };
      String kPLACES_API_KEY = "AIzaSyDrcaRErNxL1GhUvMj4Cx6f0r9eKDwCgko";
      String baseURL =
          'https://us-central1-web-directories.cloudfunctions.net/app/api/v1/places/autocomplete';
      String request =
          '$baseURL?input=$input&key=$kPLACES_API_KEY&sessiontoken=$_sessionToken';
      var response = await http.get(Uri.parse(request), headers: header);
      if (response.statusCode == 200) {
        print(json.decode(response.body)['predictions']);
        setState(() {
          _placeList = json.decode(response.body)['predictions'];
        });
      } else {
        throw Exception('Failed to load predictions');
      }
    } catch (e) {
      print('error getting suggestions: $e');
    }
  }

  void onAddressSelected(int id) async {
    Map<String, String>? header = {
      'Access-Control-Allow-Origin': '*', // Required for CORS support to work
      "Access-Control-Allow-Credentials":
          "true", // Required for cookies, authorization headers with HTTPS
      "Access-Control-Allow-Headers":
          "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
      "Access-Control-Allow-Methods": "GET,POST, OPTIONS"
    };
    String kPLACES_API_KEY = "AIzaSyDrcaRErNxL1GhUvMj4Cx6f0r9eKDwCgko";
    print(_placeList[id]['place_id']);
    String baseURL =
        'https://us-central1-web-directories.cloudfunctions.net/app/api/v1/places/get-details';
    String request =
        '$baseURL?placeId=${_placeList[id]['place_id']}&key=$kPLACES_API_KEY&sessiontoken=$_sessionToken}';
    var response = await http.get(Uri.parse(request), headers: header);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      print(_placeList[id]["description"]);
      widget.onSelected({
        "address": _placeList[id]["description"],
        "lat": data['details']['lat'].toString(),
        "lng": data['details']['lng'].toString(),
      });

      String address = _placeList[id]["description"];

      setState(() {
        _placeList = [];
        _addressController.text = address;
      });
    } else {
      throw Exception('Failed to load predictions');
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
                      onChanged: (value) => _onChanged(),
                      controller: _addressController,
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        hintText: 'Search your address',
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
          Container(
            width: 400, // Adjust width as needed
            color: Colors.white, // Background color for the dropdown
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: showDropDown ? _placeList.length : 0,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    onAddressSelected(index);
                  },
                  child: ListTile(
                    title: Text(_placeList[index]["description"]),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
