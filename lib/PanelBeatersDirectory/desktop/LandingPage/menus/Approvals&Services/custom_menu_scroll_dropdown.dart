import 'package:flutter/material.dart';

class CustomMenuScrollDropdown extends StatefulWidget {
  final void Function(String)? onSelection; // Callback for selection
  final List<Map<String, dynamic>> dropdownItems;
  const CustomMenuScrollDropdown(
      {Key? key, this.onSelection, required this.dropdownItems})
      : super(key: key);

  @override
  _CustomMenuScrollDropdownState createState() =>
      _CustomMenuScrollDropdownState();
}

class _CustomMenuScrollDropdownState extends State<CustomMenuScrollDropdown> {
  final TextEditingController _searchController = TextEditingController();
  String searchTerm = "";

  void onSearchChanged(String value) {
    setState(() {
      searchTerm = value;
    });
  }

  List<Map<String, dynamic>> get filteredDropdownItems {
    if (searchTerm.isEmpty) {
      return widget.dropdownItems;
    } else {
      return widget.dropdownItems
          .where((item) => item['name']
              .toString()
              .toLowerCase()
              .contains(_searchController.text.toLowerCase()))
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.0), // Rounded corners
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.search,
                          color: Colors.white,
                          size: 16.0,
                        ),
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        controller: _searchController,
                        onChanged: onSearchChanged,
                        decoration: InputDecoration(
                          hintText: 'Select',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(108, 255, 255, 255),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(12.0),
                  bottomRight: Radius.circular(12.0),
                ),
              ),
              height: 150, // Scrollable height
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: filteredDropdownItems.length,
                itemBuilder: (context, index) {
                  final option = filteredDropdownItems[index];
                  return ListTile(
                    title: Text(
                      option['name'],
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontFamily: 'raleway',
                      ),
                    ),
                    onTap: () {
                      widget.onSelection!(option['value']);
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// void main() => runApp(MaterialApp(
//       home: Scaffold(
//         backgroundColor: Colors.grey[900],
//         body: CustomMenuScrollDropdown(),
//       ),
//     ));
