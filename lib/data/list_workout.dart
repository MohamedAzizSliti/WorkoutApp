import 'package:flutter/material.dart';

final List<Map<String, dynamic>> workoutItems = [
    {
      'days': '3 Days',
      'type': 'Popular',
      'name': 'Stretching',
      'instructor': 'Zaina Riddle',
      'date': 'Friday, 20 Oct.',
      'duration': '60 mins',
      'image': 'assets/images/stretching.png',
      'description':
          'This stretching workout is designed to improve flexibility, relieve tension, and enhance muscle recovery.',
      'tags': [
        {
          'icon': Icons.timer,
          'text': '60 mins',
          'color': Colors.blue.withOpacity(0.5)
        },
        {
          'icon': Icons.local_fire_department,
          'text': '120 kcal',
          'color': Colors.red
        },
        {
          'icon': Icons.fitness_center,
          'text': 'Low Intensity',
          'color': Colors.orange.withOpacity(0.5)
        },
        {
          'icon': Icons.directions_run,
          'text': 'Stretching',
          'color': Colors.green.withOpacity(0.5)
        },
      ],
    },
    {
      'days': '5 Days',
      'type': 'Popular',
      'name': 'HIIT',
      'instructor': 'John Doe',
      'date': 'Monday, 16 Oct.',
      'duration': '45 mins',
      'image': 'assets/images/hit.png',
      'description':
          'This high-intensity interval training (HIIT) workout will push you to your limits, increasing both strength and endurance.',
      'tags': [
        {
          'icon': Icons.timer,
          'text': '45 mins',
          'color': Colors.blue.withOpacity(0.5)
        },
        {
          'icon': Icons.local_fire_department,
          'text': '300 kcal',
          'color': Colors.red
        },
        {
          'icon': Icons.fitness_center,
          'text': 'High Intensity',
          'color': Colors.orange.withOpacity(0.5)
        },
        {
          'icon': Icons.directions_run,
          'text': 'HIIT',
          'color': Colors.green.withOpacity(0.5)
        },
      ],
    },
    {
      'days': '7 Days',
      'type': 'New',
      'name': 'Yoga',
      'instructor': 'Jane Smith',
      'date': 'Wednesday, 18 Oct.',
      'duration': '30 mins',
      'image': 'assets/images/pngegg (2).png',
      'description':
          'This yoga session is perfect for beginners and focuses on mindfulness, balance, and controlled breathing.',
      'tags': [
        {
          'icon': Icons.timer,
          'text': '30 mins',
          'color': Colors.blue.withOpacity(0.5)
        },
        {
          'icon': Icons.local_fire_department,
          'text': '100 kcal',
          'color': Colors.red
        },
        {
          'icon': Icons.fitness_center,
          'text': 'Medium Intensity',
          'color': Colors.orange.withOpacity(0.5)
        },
        {
          'icon': Icons.directions_run,
          'text': 'Yoga',
          'color': Colors.green.withOpacity(0.5)
        },
      ],
    },
  ];
