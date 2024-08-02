import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NotificationPage(),
    );
  }
}

class NotificationPage extends StatelessWidget {
  final List<Map<String, String>> notifications = [
    {
      'title': 'Payment Due',
      'content': 'Your payment of \$2000 for the purchase of 2,000 bales of hay is due in 3 days.',
    },
    {
      'title': 'New Task1',
      'content': 'You have been assigned a new task. Task: Planting Corn on Field 1',
    },
    {
      'title': 'New Task2',
      'content': 'You have been assigned a new task. Task: Harvesting Wheat on Field 2',
    },
    {
      'title': 'New Task3',
      'content': 'You have been assigned a new task. Task: Watering Plants on Field 4',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              title: Text(notifications[index]['title']!),
              subtitle: Text(notifications[index]['content']!),
            ),
          );
        },
      ),
    );
  }
}
