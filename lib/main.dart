import 'package:firebase_and_local_notification/ui/local_notification.dart';
import 'package:firebase_and_local_notification/ui/home_page.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// @pragma('vm:entry-point')
// void notificationTapBackground(NotificationResponse notificationResponse) {
//   // ignore: avoid_print
//   print('notification(${notificationResponse.id}) action tapped: '
//       '${notificationResponse.actionId} with'
//       ' payload: ${notificationResponse.payload}');
//   if (notificationResponse.input?.isNotEmpty ?? false) {
//     // ignore: avoid_print
//     print(
//         'notification action tapped with input: ${notificationResponse.input}');
//   }
// }

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService().initNotification();
  await NotificationService().getPermission();
  NotificationService().showNotification(title: 'title', body: 'body');
  // NotificationService().showNotification(
  //     body: 'Hello local notification is working', title: 'hi');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
