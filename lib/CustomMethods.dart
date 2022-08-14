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
}
