import 'package:fitness_app/style/color.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:fitness_app/model/fitness_model.dart';

class SimpleLineChart extends StatelessWidget {
  final List<FitnessData> data;
  final bool animate;

  SimpleLineChart({this.animate = true, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      height: 200, // Reducing the chart size
      child: SfCartesianChart(
        primaryXAxis: const CategoryAxis(),
        legend: Legend(isVisible: false, backgroundColor: secondColor),
        tooltipBehavior: TooltipBehavior(enable: false),
        series: <CartesianSeries<FitnessData, String>>[
          AreaSeries<FitnessData, String>(
            gradient: LinearGradient(
              colors: [secondColor.withOpacity(0.4), Colors.white],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderColor: secondColor,
            borderWidth: 2,
            dataSource: data,
            xValueMapper: (FitnessData km, _) => km.day,
            yValueMapper: (FitnessData km, _) => km.kilometers,
            name: 'Kilometers',
            markerSettings: const MarkerSettings(
                isVisible: true,
                height: 10, // Smaller marker size
                width: 10),
            dataLabelSettings: const DataLabelSettings(isVisible: false),
          ),
        ],
      ),
    );
  }
}
