import 'package:fitness_app/components/NotificationTile.dart';
import 'package:fitness_app/data/Notification_data.dart';
import 'package:fitness_app/style/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundColor: const Color(0xffF1F2F5),
                  radius: 24,
                  child: Icon(
                    Icons.map,
                    color: primaryColor,
                  ),
                ),
                const Text("Notification",
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 24)),
                CircleAvatar(
                  backgroundColor: const Color(0xffF1F2F5),
                  radius: 24,
                  child: Icon(Icons.settings, color: primaryColor),
                ),
              ],
            ),
            const SizedBox(height: 10),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: dummyNotifications.length,
              itemBuilder: (context, index) {
                final notification = dummyNotifications[index];
                return Slidable(
                  key: ValueKey(notification.id),
                  startActionPane: ActionPane(
                    motion: const DrawerMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (context) {
                          // Handle delete action
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text('${notification.title} deleted')),
                          );
                        },
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        label: 'Delete',
                      ),
                      SlidableAction(
                        onPressed: (context) {
                          // Handle share action
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text('Shared: ${notification.title}')),
                          );
                        },
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        icon: Icons.share,
                        label: 'Share',
                      ),
                    ],
                  ),
                  child: NotificationTile(notification: notification),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
