import 'package:fitness_app/model/Notification_modal.dart';
import 'package:flutter/material.dart';

class NotificationTile extends StatelessWidget {
  final NotificationModal notification;

  const NotificationTile({required this.notification, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blueGrey[100],
          child: Icon(Icons.fitness_center, color: Colors.blueGrey[800]),
        ),
        title: Text(notification.title,
            style: TextStyle(
              color: const Color(0xfff768be), // Secondary color for title
              fontWeight: FontWeight.bold,
            )),
        subtitle: Text(notification.subtitle),
        trailing: Text(
          notification.timeAgo,
          style: TextStyle(color: Colors.grey[600]),
        ),
      ),
    );
  }
}


