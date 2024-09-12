import 'package:fitness_app/style/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ActivityItem extends StatelessWidget {
  final String name;
  final double doing;
  final double goal;
  final Color color;

  const ActivityItem({
    super.key,
    required this.name,
    required this.doing,
    required this.goal,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    // Calculate the progress as a fraction
    double progress = doing / goal;

    return Container(
      width: MediaQuery.of(context).size.width * 0.28,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // Shadow position
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Circular progress indicator

          // Activity name
          Container(
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              name,
              style: TextStyle(
                color: cardColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 20),
          // Activity details

          TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 0, end: progress),
            duration: const Duration(seconds: 1),
            builder: (context, value, child) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: 90.0,
                    width: 90.0,
                    child: CircularProgressIndicator(
                      value: value,
                      strokeWidth: 15,
                      backgroundColor: color.withOpacity(0.1),
                      strokeCap: StrokeCap.round,
                      valueColor: AlwaysStoppedAnimation<Color>(color),
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        '${doing} ',
                        style: TextStyle(
                          fontSize: 16,
                          color: primaryColor,
                        ),
                      ),
                      Text(
                        ' km',
                        style: TextStyle(
                          fontSize: 16,
                          color: primaryColor,
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}
