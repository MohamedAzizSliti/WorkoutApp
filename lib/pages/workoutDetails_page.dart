import 'package:fitness_app/style/color.dart'; // Import your color file
import 'package:flutter/material.dart';

class WorkoutDetailsPage extends StatefulWidget {
  final String workoutName;
  final String instructor;
  final String image;
  final String duration;
  final String description;
  final List<Map<String, Object>> tags; // List of maps for tags

  const WorkoutDetailsPage({
    super.key,
    required this.workoutName,
    required this.instructor,
    required this.image,
    required this.duration,
    required this.description,
    required this.tags,
  });

  @override
  State<WorkoutDetailsPage> createState() => _WorkoutDetailsPageState();
}

class _WorkoutDetailsPageState extends State<WorkoutDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Workout Header Section
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 2,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    // Top Row with Back Icon and Title
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_back),
                        ),
                        Text(
                          widget.workoutName,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: const Color(0xffF1F2F5),
                          radius: 24,
                          child: Icon(Icons.more_horiz, color: primaryColor),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Workout Image Section
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Hero(
                          tag: "local-tag-${widget.image}",
                          child: Image.asset(
                            widget.image,
                            width: double.infinity,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),

                    // Exercise Name Section
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        widget.workoutName,
                        style: const TextStyle(
                          fontSize: 22,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.instructor,
                      style: TextStyle(
                        fontSize: 24,
                        color: secondColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Certified Trainer",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[700],
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Workout Tags Section with Icons, Text, and Custom Background Color
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: widget.tags.map((tag) {
                          return _buildDetailWithIcon(
                            tag['icon'] as IconData,
                            tag['text'] as String,
                            tag['color'] as Color,
                          );
                        }).toList(),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Buttons for Try Workout and Preview Workout
                    Column(
                      children: [
                        _buildActionButton(
                          context,
                          "Try Workout",
                          secondColor,
                          Colors.white,
                        ),
                        const SizedBox(height: 8),
                        _buildActionButton(
                          context,
                          "Preview Workout",
                          Colors.white,
                          primaryColor,
                          icon: Icons.play_arrow,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Workout Description
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.description,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[700],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to build a detail widget with an icon, text, and custom background color
  Widget _buildDetailWithIcon(
      IconData icon, String text, Color backgroundColor) {
    return Container(
      height: 30,
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(icon, color: primaryColor, size: 20),
          const SizedBox(width: 6),
          Text(
            text,
            style: TextStyle(
              fontSize: 14,
              color: primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  // Function to build action buttons
  Widget _buildActionButton(
      BuildContext context, String label, Color bgColor, Color textColor,
      {IconData? icon}) {
    return GestureDetector(
      onTap: () {
        // Handle button tap
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: icon != null ? primaryColor : secondColor),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) Icon(icon, color: primaryColor),
            if (icon != null) const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                color: textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
