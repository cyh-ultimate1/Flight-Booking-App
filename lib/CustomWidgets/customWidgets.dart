import 'package:flutter/material.dart';

class customWidgets {
  static Widget errorDialog(title, text) =>
      AlertDialog(title: Text(title), content: Text(text));

  static SizedBox emptyHorizontalSpace({
    double customHeight = 20,
  }) {
    return SizedBox(
      height: customHeight,
    );
  }

  static Widget okButton({required Function f}) {
    return ElevatedButton(
      child: const Text("OK"),
      onPressed: () async => f,
    );
  }

  static Widget submitButton({required Function f}) {
    return ElevatedButton(
      child: Text("Submit".toUpperCase()),
      onPressed: () async => f,
    );
  }

  static Widget customLabelButton(
      {required Function() onPressed,
      required String customLabel,
      ButtonStyle? buttonStyle,
      Color? textColor}) {
    return ElevatedButton(
      style: buttonStyle,
      child: Text(
        customLabel.toUpperCase(),
        style: TextStyle(fontWeight: FontWeight.bold, color: textColor),
      ),
      onPressed: onPressed,
    );
  }
}
