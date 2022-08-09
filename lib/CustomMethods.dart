class CustomMethods {
  static String? isEmptyOrNull(String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }
}
