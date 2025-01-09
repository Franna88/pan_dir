import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class SearchBox extends StatefulWidget {
  final Function(String) onSearch;
  const SearchBox({super.key, required this.onSearch});

  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  final TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MyUtility(context).width * 0.17,
      height: MyUtility(context).height * 0.052,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Container(
              height: 28.8,
              width: 28.8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
              ),
              child: IconButton(
                onPressed: () {
                  widget.onSearch(search.text);
                },
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 14.6,
                ),
              ),
            ),
          ),
          Expanded(
            child: TextFormField(
              onChanged: (value) {
                widget.onSearch(value);
              },
              controller: search,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: 'Search Keywords',
                hintStyle: TextStyle(
                  fontSize: 15.64,
                  fontFamily: 'raleway',
                  color: Color(0xFF717375),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.transparent,
                contentPadding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              search.clear();
              widget.onSearch('');
            },
            icon: Icon(
              Icons.close,
              color: Color(0xFFA6A6A6),
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
