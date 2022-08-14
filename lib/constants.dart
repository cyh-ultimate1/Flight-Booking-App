import 'dart:math';

import 'package:flutter/material.dart';

class GlobalConstants {
  static const GLOBALFONTFAMILY = "Ubuntu";

  //static const SERVER_URL = "http://10.0.2.2/MVW_API/api/";
  //static const SERVER_ADDRESS = "192.168.0.117";
  static const SERVER_ADDRESS = "http://192.168.0.117/projectA";

  //static const API_URL = "http://$SERVER_ADDRESS/MVW_API/api/";
  //static const API_AUTHENTICATE = API_URL + "Authenticate/";

  static const API_URL = "$SERVER_ADDRESS/api";
  static const API_SESSION = "$API_URL/Authenticate/";
  static const storageKeyLoggedInUserID = "loggedInUserID";
  static const jwt = "jwt";
  static const SessionKey = "SessionKey";

  // static MaterialColor APPPRIMARYCOLOUR_SWATCH = MaterialColor(
  //   0x0030A0,
  //   <int, Color>{
  //     50: Color.fromRGBO(136, 14, 79, .1),
  //     100: Color.fromRGBO(136, 14, 79, .2),
  //     200: Color.fromRGBO(136, 14, 79, .3),
  //     300: Color.fromRGBO(136, 14, 79, .4),
  //     400: Color.fromRGBO(136, 14, 79, .5),
  //     500: Color.fromRGBO(136, 14, 79, .6),
  //     600: Color.fromRGBO(136, 14, 79, .7),
  //     700: Color.fromRGBO(136, 14, 79, .8),
  //     800: Color.fromRGBO(136, 14, 79, .9),
  //     900: Color.fromRGBO(136, 14, 79, 1),
  //   },
  // );
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
