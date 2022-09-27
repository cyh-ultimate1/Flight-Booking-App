import 'dart:math';

import 'package:flutter/material.dart';

class GlobalConstants {
  static const GLOBALFONTFAMILY = "Ubuntu";
  static const SERVER_ADDRESS = "http://yourserveraddress/projectA";
  static const API_URL = "$SERVER_ADDRESS/api";
  static const API_SESSION = "$API_URL/Authenticate/";
  static const storageKeyLoggedInUserID = "loggedInUserID";
  static const jwt = "jwt";
  static const userID = "userID";
  static const SessionKey = "SessionKey";

  static LinearGradient customLinearGradient = LinearGradient(
    colors: <Color>[
      generateMaterialColor(APPPRIMARYCOLOUR!).shade700,
      Colors.lightBlue,
    ],
  );

  static Color? APPPRIMARYCOLOUR = const Color.fromRGBO(0, 48, 160, 1);
  static MaterialColor generateMaterialColor(Color color) {
    return MaterialColor(color.value, {
      50: tintColor(color, 0.5),
      100: tintColor(color, 0.4),
      200: tintColor(color, 0.3),
      300: tintColor(color, 0.2),
      400: tintColor(color, 0.1),
      500: tintColor(color, 0),
      600: tintColor(color, -0.1),
      700: tintColor(color, -0.2),
      800: tintColor(color, -0.3),
      900: tintColor(color, -0.4),
    });
  }

  static int tintValue(int value, double factor) =>
      max(0, min((value + ((255 - value) * factor)).round(), 255));

  static Color tintColor(Color color, double factor) => Color.fromRGBO(
      tintValue(color.red, factor),
      tintValue(color.green, factor),
      tintValue(color.blue, factor),
      1);
}
