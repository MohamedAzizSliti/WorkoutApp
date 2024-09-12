import 'package:fitness_app/components/ActivtyScroll.dart';
import 'package:fitness_app/components/WorkoutList.dart';
import 'package:fitness_app/components/headerUser.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xffF8F8FA),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              headerUser(),
              ActivtyScroll(),
              Text(
                "Workout",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
              ),
              SizedBox(height: 10), // Space between selector and items

              WorkoutList(),
            ],
          ),
        ),
      ),
    );
  }
}
