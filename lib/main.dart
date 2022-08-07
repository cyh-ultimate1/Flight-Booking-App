import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'Views/HomeEntryPage.dart';
import 'Views/LoginPage.dart';
import 'constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: GlobalConstants.APPPRIMARYCOLOUR_SWATCH,
      ),
      home: const MainPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key, required this.title}) : super(key: key);
  final String title;
  final secureStorage = const FlutterSecureStorage();

  Future<bool> getSessionKey() async {
    String sessionKey =
        await secureStorage.read(key: GlobalConstants.SessionKey) ?? "";
    return sessionKey.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getSessionKey(),
      builder: (_, snapshot) {
        if (snapshot.hasData) {
          return (snapshot.data as bool) ? const HomeEntryPage() : LoginPage();
        } else {
          return const Center(
            child: SizedBox(
              height: 40,
              width: 40,
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
    // bool isLoggedIn = getSessionKey();
    //   return isLoggedIn
    //   ? HomePage()
    //   : LoginPage();
  }
}
