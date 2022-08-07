import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField(
      {Key? key,
      this.paddingTop = 10.0,
      this.paddingBottom = 10.0,
      this.textLabel = "",
      this.validator})
      : super(key: key);
  final String textLabel;
  final double paddingTop;
  final double paddingBottom;
  final String? Function(String?)? validator;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  final _searchFromController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(top: widget.paddingTop, bottom: widget.paddingBottom),
      child: TextFormField(
        controller: _searchFromController,
        decoration: InputDecoration(
          labelText: widget.textLabel,
          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(width: 3, color: Theme.of(context).primaryColor),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(width: 3, color: Theme.of(context).primaryColor),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        validator: widget.validator,
      ),
    );
  }
}
