import 'package:flutter/material.dart';

class ArticlesSearchbarMobile extends StatefulWidget {
  const ArticlesSearchbarMobile({super.key});

  @override
  State<ArticlesSearchbarMobile> createState() =>
      _ArticlesSearchbarMobileState();
}

class _ArticlesSearchbarMobileState extends State<ArticlesSearchbarMobile> {
  final TextEditingController search = TextEditingController();

  @override
  void dispose() {
    search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.2,
      height: 45,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
              ),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ),
          Expanded(
            child: TextFormField(
              controller: search,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: 'Search Keywords',
                hintStyle: TextStyle(
                  fontSize: 16,
                  fontFamily: 'ralewaysemi',
                  color: Color(0xFF717375),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.transparent,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              search.clear();
            },
            icon: Icon(
              Icons.close,
              color: Color(0xFF717375),
            ),
          ),
        ],
      ),
    );
  }
}
