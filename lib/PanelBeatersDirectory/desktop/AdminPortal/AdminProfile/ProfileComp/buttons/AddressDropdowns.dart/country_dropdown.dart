import 'package:flutter/material.dart';
import 'package:csc_picker/csc_picker.dart';

class CountryDropdown extends StatelessWidget {
  final Function(String) onCountryChanged;

  const CountryDropdown({Key? key, required this.onCountryChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CSCPicker(
      showStates: false,
      showCities: false,
      flagState: CountryFlag.ENABLE,
      dropdownDecoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300, width: 1),
      ),
      countryDropdownLabel: "*Country",
      onCountryChanged: (value) {
        onCountryChanged(value);
      },
    );
  }
}
