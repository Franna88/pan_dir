import 'package:flutter/material.dart';
import 'package:csc_picker/csc_picker.dart';

class ProvinceDropdown extends StatelessWidget {
  final String countryValue;
  final Function(String) onStateChanged;

  const ProvinceDropdown(
      {Key? key,
      required this.countryValue,
      required this.onStateChanged,
      required void Function(String country) onProvinceChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CSCPicker(
      showStates: true,
      showCities: false,
      flagState: CountryFlag.ENABLE,
      dropdownDecoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300, width: 1),
      ),
      stateDropdownLabel: "*Province",
      onCountryChanged: (value) {
        // Optionally handle country change
      },
      onStateChanged: (value) {
        onStateChanged(value!);
      },
    );
  }
}
