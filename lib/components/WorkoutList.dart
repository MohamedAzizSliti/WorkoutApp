import 'package:fitness_app/data/list_workout.dart';
import 'package:fitness_app/pages/workoutDetails_page.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/components/WorkItem.dart'; // Ensure this path is correct
import 'package:fitness_app/style/color.dart'; // Ensure this path is correct

class WorkoutList extends StatefulWidget {
  const WorkoutList({super.key});

  @override
  _WorkoutListState createState() => _WorkoutListState();
}

class _WorkoutListState extends State<WorkoutList> {
  final List<String> workouts = [
    'All type',
    'Cardio',
    'Strength',
    'Yoga',
    'Pilates',
    'CrossFit',
    'HIIT',
    'Zumba',
    'Dance',
    'Bodyweight',
    'Aerobics'
  ];

  String selectedWorkout = 'All type'; // Track the selected workout

  // Sample data for workout items

  @override
  Widget build(BuildContext context) {
    // Filter workoutItems based on selectedWorkout
    final filteredWorkoutItems = selectedWorkout == 'All type'
        ? workoutItems
        : workoutItems
            .where((item) => item['name'] == selectedWorkout)
            .toList();

    return SingleChildScrollView(
      child: Column(
        children: [
          // Horizontal workout type selector
          SizedBox(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: workouts.length,
              itemBuilder: (context, index) {
                final workout = workouts[index];
                final isSelected = workout == selectedWorkout;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedWorkout = workout; // Update selection
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? primaryColor
                            : Colors.transparent, // Selected state
                        border: Border.all(color: primaryColor, width: 2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          workout,
                          style: TextStyle(
                            color: isSelected ? Colors.white : primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          // const SizedBox(height: 20), // Space between selector and items

          // Expanded: Constrain the ListView inside the Column
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: filteredWorkoutItems.length,
            itemBuilder: (context, index) {
              final workoutItem = filteredWorkoutItems[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WorkoutDetailsPage(
                        workoutName: workoutItem['name']!,
                        instructor: workoutItem['instructor']!,
                        image: workoutItem['image']!,
                        duration: workoutItem['duration']!,
                        description: workoutItem['description']!,
                        tags: workoutItem['tags']!,
                      ),
                    ),
                  );
                },
                child: WorkoutItem(
                  days: workoutItem['days']!,
                  type: workoutItem['type']!,
                  name: workoutItem['name']!,
                  instructor: workoutItem['instructor']!,
                  date: workoutItem['date']!,
                  duration: workoutItem['duration']!,
                  image: workoutItem['image']!,
                ),
              );
            },
          ),
          const SizedBox(height: 20), // Space between items
        ],
      ),
    );
  }
}
