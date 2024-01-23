import 'package:firebase_and_local_notification/ui/local_notification.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  TimeOfDay selectedTime = TimeOfDay.now();
  DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Local_notification'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                TimeOfDay? pickedTime = await showTimePicker(
                  context: context,
                  initialTime: selectedTime,
                  
                );
                if (pickedTime != null) {
                  setState(() {
                    selectedTime = pickedTime;
                  });
                  DateTime scheduledDateTime = DateTime(
                    now.year,
                    now.month,
                    now.day,
                    pickedTime.hour,
                    pickedTime.minute,
                  );

                  // await NotificationService().scheduledNotification(
                  //       hour: selectedTime.hour, minute: selectedTime.minute);
                  await NotificationService().scheduleNotification(
                      scheduledTime: scheduledDateTime,
                      body: 'notification',
                      title: 'hello',
                      id: 0);

                  print('Selected Time: $selectedTime');
                }
              },
              child: const Center(
                child: Text("Schedule Notification"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
