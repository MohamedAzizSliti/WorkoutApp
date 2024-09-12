import 'package:fitness_app/style/color.dart';
import 'package:flutter/material.dart';

class WorkoutItem extends StatelessWidget {
  final String days;
  final String type;
  final String name;
  final String instructor;
  final String date;
  final String duration;
  final String image; // Added image parameter

  const WorkoutItem({
    super.key,
    required this.days,
    required this.type,
    required this.name,
    required this.instructor,
    required this.date,
    required this.duration,
    required this.image, // Required image parameter
  });

  @override
  Widget build(BuildContext context) {
    // Define icons for different types
    IconData getTypeIcon(String type) {
      switch (type) {
        case 'Popular':
          return Icons.star; // Example icon for Popular
        case 'New':
          return Icons.new_releases; // Example icon for New
        // Add more cases for other types as needed
        default:
          return Icons.fitness_center; // Default icon
      }
    }

    // Define colors for different types
    Color getTypeColor(String type) {
      switch (type) {
        case 'Popular':
          return secondColor;
        case 'New':
          return Colors.greenAccent;
        // Add more cases for other types as needed
        default:
          return Colors.blueAccent;
      }
    }

    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          margin: const EdgeInsets.symmetric(vertical: 10),
          padding: const EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          height: 150,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Row: Days and Type with Icon
              Row(
                children: [
                  Text(
                    days,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                    decoration: BoxDecoration(
                      color: getTypeColor(type).withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          getTypeIcon(type),
                          color: getTypeColor(type),
                          size: 18,
                        ),
                        SizedBox(width: 10),
                        Text(
                          type,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              // Workout Title and Instructor
              Text(
                name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                "Instructor: $instructor",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 10),
              // Date and Time
              Row(
                children: [
                  Icon(Icons.calendar_today, size: 14, color: Colors.grey),
                  const SizedBox(width: 5),
                  Text(
                    date,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(width: 20),
                  Icon(Icons.access_time, size: 14, color: Colors.grey),
                  const SizedBox(width: 5),
                  Text(
                    duration,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          right: 10, // Adjust as needed
          bottom: 15, // Adjust as needed
          child: Hero(
            tag: "local-tag-${image}",
            child: Image.asset(
              image, // Use image parameter here
              width: 130, // Adjust size as needed
            ),
          ),
        ),
      ],
    );
  }
}
