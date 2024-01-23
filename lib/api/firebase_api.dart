import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_and_local_notification/main.dart';
import 'package:firebase_and_local_notification/ui/home_page.dart';

class FirebaseApi {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission(
        alert: true,
        announcement: true,
        badge: true,
        sound: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false);

    final fCMToken = await _firebaseMessaging.getToken();
    print("token $fCMToken");

    initPushNotification();
  }

  void handleMessage(RemoteMessage? message) async {
    if (message == null) return;

    navigatiorKey.currentState
        ?.pushNamed(HomePage.routeName, arguments: message);
  }

  Future initPushNotification() async {
    FirebaseMessaging.instance.getInitialMessage().then((handleMessage));
    FirebaseMessaging.onMessageOpenedApp.listen((handleMessage));
    FirebaseMessaging.onMessage.listen((message) {
      handleMessage(message);
    });
  }
}
