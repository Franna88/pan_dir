import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class FilterButton extends StatefulWidget {
  final String servicesText;
  final bool isSelected;
  final Function(String) onFilterSelected;

  const FilterButton({
    Key? key,
    required this.servicesText,
    required this.isSelected,
    required this.onFilterSelected,
  }) : super(key: key);

  @override
  State<FilterButton> createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: GestureDetector(
        onTap: () {
          widget.onFilterSelected(widget.servicesText);
        },
        child: Container(
          width: MyUtility(context).width * 0.375,
          height: MyUtility(context).height * 0.05,
          decoration: ShapeDecoration(
            color: widget.isSelected ? Color(0xFF0E1013) : Color(0xFF3C4043),
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1, color: Colors.white),
              borderRadius: BorderRadius.circular(37.99),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.servicesText,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 17,
                    fontFamily: 'ralewaymedium',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Container(
                  width: 23.35,
                  height: 23.35,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.black,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
