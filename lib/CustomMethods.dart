import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_a/Models/KeyValueModel.dart';

class CustomMethods {
  static String? isEmptyOrNull(String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }

  static String? isDateTimeEmptyOrNull(String? val) {
    if (val == null || val.isEmpty) {
      return 'Please select a date/time.';
    }
    return null;
  }

  static String? isDropdownEmptyOrNull(KeyValueModel? val, String? caption) {
    if (val == null) {
      return 'Please select a $caption.';
    }
    return null;
  }

  static void showToast(BuildContext context, {String textLabel = ""}) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(textLabel),
        action: SnackBarAction(
            textColor: Colors.yellow,
            label: 'HIDE',
            onPressed: scaffold.hideCurrentSnackBar),
        //duration: const Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
        elevation: 10.0,
      ),
    );
  }
}
