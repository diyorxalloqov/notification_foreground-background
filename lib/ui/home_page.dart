import 'dart:async';

import 'package:firebase_and_local_notification/widgets/local_notification.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const String routeName = "Home_page";
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController _timeController;

  @override
  void initState() {
    _timeController = TextEditingController();
    Timer.periodic(
        const Duration(minutes: 100),
        (timer) => NotificationService().showNotification(
            title: 'Hello', body: 'It works successfully 👍🏼'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final RemoteMessage message =
    //     ModalRoute.of(context)?.settings.arguments as RemoteMessage;

    return Scaffold(
        appBar: AppBar(
          title: Text("Firebase and_local_Notification"),
        ),
        body: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  NotificationService().showNotification(
                      title: 'Hello', body: 'It works successfully 👍🏼');
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: const Center(
                  child: Text("Local notification"),
                ))
          ],
        ));
  }
}
