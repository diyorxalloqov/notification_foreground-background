import 'package:firebase_and_local_notification/widgets/local_notification.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_and_local_notification/api/firebase_api.dart';
import 'package:firebase_and_local_notification/firebase_options.dart';
import 'package:firebase_and_local_notification/ui/home_page.dart';
import 'package:flutter/material.dart';

/* DOCUMENTATION Firebase CLI

  npm install -g firebase-tools

  dart pub global activate flutterfire_cli

  FIREBASE LOGIN

  flutterfire configure
  

 */

final navigatiorKey = GlobalKey<NavigatorState>();
/////   for background messaging working on background
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.messageId}");
}

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService().initNotification();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseApi().initNotifications();
  FirebaseMessaging.onBackgroundMessage((_firebaseMessagingBackgroundHandler));
  NotificationService().showNotification(
      body: 'Hello local notification is working', title: 'hi');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      routes: {
        HomePage.routeName: (_) => const HomePage(),
      },
    );
  }
}
