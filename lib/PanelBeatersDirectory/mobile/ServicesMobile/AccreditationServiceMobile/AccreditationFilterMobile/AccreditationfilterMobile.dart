import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

import '../../../../desktop/Services/AccreditationService/AccreditationFilter/AccreditationFilterComp/FilterButton.dart';
import '../AccreditationImageContainerMobile/AccreditationImageContainerMobile.dart';
import 'AccreditationFilterCompMobile/FilterButtonMobile.dart';

class AccreditationfilterMobile extends StatefulWidget {
  final String? selectedFilter;
  final void Function(String filter) onFilterSelected;
  final List<String> filterOptions;
  const AccreditationfilterMobile(
      {Key? key,
      required this.onFilterSelected,
      required this.filterOptions,
      this.selectedFilter})
      : super(key: key);

  @override
  State<AccreditationfilterMobile> createState() =>
      _AccreditationfilterMobileState();
}

class _AccreditationfilterMobileState extends State<AccreditationfilterMobile> {
  final ValueNotifier<int?> _selectedIndex = ValueNotifier<int?>(null);
  String? _selectedFilter;

  void _onFilterSelected(String filter) {
    widget.onFilterSelected(filter);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        width: MyUtility(context).width * 0.9,
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      'View Available Services:',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 20.4,
                        fontFamily: 'raleway',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: widget.filterOptions
                    .map((filter) => FilterButtonMobile(
                          servicesText: filter,
                          onFilterSelected: _onFilterSelected,
                          isSelected: widget.selectedFilter == filter,
                        ))
                    .toList(),
              )

              /* FilterButtonMobile(
                index: 1,
                servicesText: 'Insurance Panels',
                content: AccreditationImageContainerMobile(),
                selectedIndexNotifier: _selectedIndex,
              ),
              FilterButtonMobile(
                index: 2,
                servicesText: 'Vehicle Brands',
                content: AccreditationImageContainerMobile(),
                selectedIndexNotifier: _selectedIndex,
              ),
              FilterButtonMobile(
                index: 3,
                servicesText: 'Commercial Vehicle Brands',
                content: AccreditationImageContainerMobile(),
                selectedIndexNotifier: _selectedIndex,
              ),
              FilterButtonMobile(
                index: 4,
                servicesText: 'Towing Services',
                content: AccreditationImageContainerMobile(),
                selectedIndexNotifier: _selectedIndex,
              ),
              FilterButtonMobile(
                index: 5,
                servicesText: 'What makes us Unique',
                content: AccreditationImageContainerMobile(),
                selectedIndexNotifier: _selectedIndex,
              ),
              FilterButtonMobile(
                index: 6,
                servicesText: 'Regional Services',
                content: AccreditationImageContainerMobile(),
                selectedIndexNotifier: _selectedIndex,
              ),
              FilterButtonMobile(
                index: 7,
                servicesText: 'Equipment & Services',
                content: AccreditationImageContainerMobile(),
                selectedIndexNotifier: _selectedIndex,
              ),
              FilterButtonMobile(
                index: 8,
                servicesText: 'Franchises & Assessment Centers',
                content: AccreditationImageContainerMobile(),
                selectedIndexNotifier: _selectedIndex,
              ),
              FilterButtonMobile(
                index: 9,
                servicesText: 'Finance Options',
                content: AccreditationImageContainerMobile(),
                selectedIndexNotifier: _selectedIndex,
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}
