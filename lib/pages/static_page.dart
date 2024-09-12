import 'package:fitness_app/components/LineChartSample.dart';
import 'package:fitness_app/style/color.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/model/fitness_model.dart';

class StaticPage extends StatefulWidget {
  const StaticPage({super.key});

  @override
  State<StaticPage> createState() => _StaticPageState();
}

class _StaticPageState extends State<StaticPage> {
  // Data for weekly distances (in kilometers) for each workout type
  final Map<String, List<FitnessData>> workoutDataWeekly = {
    'Cardio': [
      FitnessData('Mon', 5),
      FitnessData('Tue', 4),
      FitnessData('Wed', 6),
      FitnessData('Thu', 5),
      FitnessData('Fri', 7),
      FitnessData('Sat', 3),
      FitnessData('Sun', 2),
    ],
    'Strength': [
      FitnessData('Mon', 2),
      FitnessData('Tue', 2.5),
      FitnessData('Wed', 3),
      FitnessData('Thu', 2),
      FitnessData('Fri', 3.5),
      FitnessData('Sat', 2),
      FitnessData('Sun', 2),
    ],
    'Yoga': [
      FitnessData('Mon', 1),
      FitnessData('Tue', 1.5),
      FitnessData('Wed', 2),
      FitnessData('Thu', 2.5),
      FitnessData('Fri', 1),
      FitnessData('Sat', 2),
      FitnessData('Sun', 3),
    ],
    // Add more workout types as needed
  };

  // Data for monthly distances (in kilometers) for each workout type
  final Map<String, List<FitnessData>> workoutDataMonthly = {
    'Cardio': [
      FitnessData('Jan', 50),
      FitnessData('Feb', 60),
      FitnessData('Mar', 70),
      FitnessData('Apr', 65),
      FitnessData('May', 75),
      FitnessData('Jun', 80),
      FitnessData('Jul', 85),
      FitnessData('Aug', 90),
      FitnessData('Sep', 85),
      FitnessData('Oct', 80),
      FitnessData('Nov', 70),
      FitnessData('Dec', 65),
    ],
    'Strength': [
      FitnessData('Jan', 30),
      FitnessData('Feb', 35),
      FitnessData('Mar', 40),
      FitnessData('Apr', 38),
      FitnessData('May', 45),
      FitnessData('Jun', 50),
      FitnessData('Jul', 55),
      FitnessData('Aug', 60),
      FitnessData('Sep', 58),
      FitnessData('Oct', 55),
      FitnessData('Nov', 50),
      FitnessData('Dec', 45),
    ],
    'Yoga': [
      FitnessData('Jan', 20),
      FitnessData('Feb', 25),
      FitnessData('Mar', 30),
      FitnessData('Apr', 28),
      FitnessData('May', 35),
      FitnessData('Jun', 40),
      FitnessData('Jul', 45),
      FitnessData('Aug', 50),
      FitnessData('Sep', 48),
      FitnessData('Oct', 45),
      FitnessData('Nov', 40),
      FitnessData('Dec', 35),
    ],
    // Add more workout types as needed
  };

  String selectedWorkout = 'Cardio'; // Track the selected workout

  @override
  Widget build(BuildContext context) {
    // Get the current weekly and monthly data for the selected workout
    List<FitnessData> weeklyData = workoutDataWeekly[selectedWorkout]!;
    List<FitnessData> monthlyData = workoutDataMonthly[selectedWorkout]!;

    return Scaffold(
        body: SingleChildScrollView(
            child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
              const Text("Statistics",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24)),
              CircleAvatar(
                backgroundColor: const Color(0xffF1F2F5),
                radius: 24,
                child: Icon(Icons.settings, color: primaryColor),
              ),
            ],
          ),
          const SizedBox(height: 10), // Space between selector and items

          SizedBox(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: workoutDataWeekly.keys.length,
              itemBuilder: (context, index) {
                final workout = workoutDataWeekly.keys.elementAt(index);
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
          const SizedBox(height: 20), // Space between selector and items
          const Text(
            "Week 21 Aug. - 28 Aug.",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Distance ",
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                  const Text(
                    "32.7km",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Text(
                "  |  ",
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Time ",
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                  const Text(
                    "8.42 h",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Text(
                "  |  ",
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Height ",
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                  const Text(
                    "153 m",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10), // Space between selector and items

          // Weekly data chart
          SimpleLineChart(
            data: weeklyData,
          ),
          const SizedBox(height: 10), // Space between selector and items
          const Text(
            "Monthly intensity",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          Text(
            "Your total training time",
            style: TextStyle(fontSize: 14, color: Colors.grey[600]),
          ),
          const SizedBox(height: 10), // Space between selector and items

          // Monthly data chart
          SimpleLineChart(
            data: monthlyData,
          ),
        ],
      ),
    )));
  }
}
