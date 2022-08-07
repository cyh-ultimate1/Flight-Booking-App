import 'package:flutter/material.dart';

class GlobalConstants {
  static const GLOBALFONTFAMILY = "Raleway";

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
  static Color? APPPRIMARYCOLOUR = Colors.blue[500];
  static MaterialColor APPPRIMARYCOLOUR_SWATCH = MaterialColor(
    4280191205,
    <int, Color>{
      50: Color.fromRGBO(136, 14, 79, .1),
      100: Color.fromRGBO(136, 14, 79, .2),
      200: Color.fromRGBO(136, 14, 79, .3),
      300: Color.fromRGBO(136, 14, 79, .4),
      400: Color.fromRGBO(136, 14, 79, .5),
      500: Color.fromRGBO(136, 14, 79, .6),
      600: Color.fromRGBO(136, 14, 79, .7),
      700: Color.fromRGBO(136, 14, 79, .8),
      800: Color.fromRGBO(136, 14, 79, .9),
      900: Color.fromRGBO(136, 14, 79, 1),
    },
  );
}
