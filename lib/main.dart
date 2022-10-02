import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:project_a/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

import 'Views/HomeEntryPage.dart';
import 'Views/LoginPage.dart';
import 'constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  Future<void> _initializeFirebase() async {
    var fb = await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    InitializationSettings initializationSettings =
        InitializationSettings(android: androidInitializationSettings);

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      // onSelectNotification: doSomething(),
    );

    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      description:
          'This channel is used for important notifications.', // description
      importance: Importance.max,
    );
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      // If `onMessage` is triggered with a notification, construct our own
      // local notification to show to users using the created channel.
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channelDescription: channel.description,
                icon: android.smallIcon,
                // other properties...
              ),
            ));
      }
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    _initializeFirebase();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: GlobalConstants.generateMaterialColor(
              GlobalConstants.APPPRIMARYCOLOUR!),
          fontFamily: GlobalConstants.GLOBALFONTFAMILY),
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
