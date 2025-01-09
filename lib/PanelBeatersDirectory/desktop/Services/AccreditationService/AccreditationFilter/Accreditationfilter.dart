import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/AccreditationService/AccreditationFilter/AccreditationFilterComp/FilterButton.dart';
import 'package:webdirectories/myutility.dart';

class AccreditationFilter extends StatefulWidget {
  final String? selectedFilter;
  final void Function(String filter) onFilterSelected;
  final List<String> filterOptions;
  const AccreditationFilter(
      {Key? key,
      required this.onFilterSelected,
      required this.filterOptions,
      this.selectedFilter})
      : super(key: key);

  @override
  State<AccreditationFilter> createState() => _AccreditationFilterState();
}

class _AccreditationFilterState extends State<AccreditationFilter> {
  String? _selectedFilter;

  void _onFilterSelected(String filter) {
    widget.onFilterSelected(filter);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MyUtility(context).width * 0.42,
      height: MyUtility(context).height * 0.715,
      decoration: ShapeDecoration(
        color: Color(0xFF181B1D),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            strokeAlign: BorderSide.strokeAlignOutside,
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 35,
              ),
              SizedBox(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'View Available Services:',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: MyUtility(context).width * 0.014,
                      fontFamily: 'raleway',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: widget.filterOptions
                .map((filter) => FilterButton(
                    servicesText: filter,
                    onFilterSelected: _onFilterSelected,
                    isSelected: widget.selectedFilter == filter))
                .toList(),
          )
        ],
      ),
    );
  }
}
