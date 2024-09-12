import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fitness_app/components/ActivityItem.dart';
import 'package:fitness_app/style/color.dart';
import 'package:flutter/material.dart';

class ActivtyScroll extends StatefulWidget {
  const ActivtyScroll({super.key});

  @override
  State<ActivtyScroll> createState() => _ActivtyScrollState();
}

class _ActivtyScrollState extends State<ActivtyScroll> {
  int pageIndex = 0;

  final List<Map<String, dynamic>> _activities = [
    {'name': 'Jogging', 'doing': 22.7, "goal": 34, "color": Color(0xff8B5BF1)},
    {
      'name': 'Cycling',
      'doing': 73.2,
      "goal": 220.0,
      "color": Color(0xff56D39F)
    },
    {'name': 'Swimming', 'doing': 3.8, "goal": 7.5, "color": Color(0xffD384E0)},
    {'name': 'Jogging', 'doing': 22.7, "goal": 34, "color": Color(0xff8B5BF1)},
    {
      'name': 'Cycling',
      'doing': 73.2,
      "goal": 220.0,
      "color": Color(0xff56D39F)
    },
    {'name': 'Swimming', 'doing': 3.8, "goal": 7.5, "color": Color(0xffD384E0)},
    {'name': 'Jogging', 'doing': 22.7, "goal": 34, "color": Color(0xff8B5BF1)},
    {
      'name': 'Cycling',
      'doing': 73.2,
      "goal": 220.0,
      "color": Color(0xff56D39F)
    },
    {'name': 'Swimming', 'doing': 3.8, "goal": 7.5, "color": Color(0xffD384E0)},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Activity",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
            ),
            CarouselIndicator(
              count: (_activities.length / 3).ceil(),
              index: pageIndex,
              color: Color(0xffD3D3D2),
              activeColor: primaryColor,
              width: 8,
              height: 8,
            ),
          ],
        ),
        CarouselSlider.builder(
          itemCount: (_activities.length / 3).ceil(), // Number of slides
          options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 2.0,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              setState(() {
                pageIndex = index;
              });
            },
          ),
          itemBuilder: (BuildContext context, int index, int realIndex) {
            final startIndex = index * 3;
            final endIndex = (startIndex + 3) > _activities.length
                ? _activities.length
                : startIndex + 3;

            final items = _activities.sublist(startIndex, endIndex);

            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: items.map((activity) {
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ActivityItem(
                    name: activity['name'],
                    doing: activity['doing'].toDouble(), // Ensure double type
                    goal: activity['goal'].toDouble(), color: activity['color'],
                  ),
                );
              }).toList(),
            );
          },
        ),
      ],
    );
  }
}
