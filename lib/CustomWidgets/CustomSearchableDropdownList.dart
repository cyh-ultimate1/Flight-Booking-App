import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import '../CustomMethods.dart';
import '../Models/KeyValueModel.dart';
import '../Services/OnlineServices.dart';

class CustomSearchableDropdownList extends StatefulWidget {
  CustomSearchableDropdownList({
    Key? key,
    this.customLabelText,
    required this.dropDownItems,
    required this.onChanged,
    this.isRequired = false,
  }) : super(key: key);
  final String? customLabelText;
  final List<KeyValueModel> dropDownItems;
  final ValueChanged onChanged;
  final bool isRequired;

  @override
  State<CustomSearchableDropdownList> createState() =>
      _CustomSearchableDropdownListState();
}

class _CustomSearchableDropdownListState
    extends State<CustomSearchableDropdownList> {
  String? dropdownvalue;

  //functions
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<KeyValueModel>(
      mode: Mode.BOTTOM_SHEET,
      showSearchBox: true,
      items: widget.dropDownItems,
      itemAsString: (KeyValueModel? u) => u?.value ?? "",
      dropdownSearchDecoration:
          InputDecoration(labelText: widget.customLabelText),
      // onChanged: (newValue) {
      //   dropdownvalue = newValue?.key;
      //   widget.selectedValue = dropdownvalue.toString();
      //   //print("dropdownvalue: " + dropdownvalue.toString());
      // },
      onChanged: (newValue) {
        widget.onChanged((newValue as KeyValueModel).key);
      },
      validator: (val) {
        if (widget.isRequired) {
          return CustomMethods.isDropdownEmptyOrNull(
              val, widget.customLabelText);
        }
        return null;
      },
    );
  }
}
