import 'package:flutter/material.dart';
import 'package:csc_picker/csc_picker.dart';

class CityDropdown extends StatelessWidget {
  final String countryValue;
  final String stateValue;
  final Function(String) onCityChanged;

  const CityDropdown(
      {Key? key,
      required this.countryValue,
      required this.stateValue,
      required this.onCityChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CSCPicker(
      showStates: true,
      showCities: true,
      flagState: CountryFlag.ENABLE,
      dropdownDecoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300, width: 1),
      ),
      cityDropdownLabel: "*City",
      onCountryChanged: (value) {
        // Optionally handle country change
      },
      onStateChanged: (value) {
        // Optionally handle state change
      },
      onCityChanged: (value) {
        onCityChanged(value!);
      },
    );
  }
}
