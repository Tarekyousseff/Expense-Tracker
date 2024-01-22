// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:gym_sup/bar_graph/bar_data.dart';

class CustomBarGraph extends StatelessWidget {
  final double? maxY;
  final double sunAmount;
  final double monAmount;
  final double tueAmount;
  final double wedAmount;
  final double thuAmount;
  final double friAmount;
  final double satAmount;
  const CustomBarGraph({
    Key? key,
    this.maxY,
    required this.sunAmount,
    required this.monAmount,
    required this.tueAmount,
    required this.wedAmount,
    required this.thuAmount,
    required this.friAmount,
    required this.satAmount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BarData myBarData = BarData(
        sunAmount: sunAmount,
        monAmount: monAmount,
        tueAmount: tueAmount,
        wedAmount: wedAmount,
        thuAmount: thuAmount,
        friAmount: friAmount,
        satAmount: satAmount);
    myBarData.initializeBarData();
    return BarChart(BarChartData(
        maxY: maxY,
        minY: 0,
        titlesData: FlTitlesData(
            show: true,
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                    showTitles: true, getTitlesWidget: getBottoomTitles))),
        gridData: FlGridData(show: false),
        borderData: FlBorderData(show: false),
        barGroups: myBarData.barData
            .map((data) => BarChartGroupData(x: data.x, barRods: [
                  BarChartRodData(
                      toY: data.y,
                      color: Colors.lightGreenAccent.withOpacity(0.8),
                      width: 15,
                      borderRadius: BorderRadius.circular(4),
                      backDrawRodData: BackgroundBarChartRodData(
                          show: true,
                          color: Colors.red.withOpacity(0.6),
                          toY: maxY))
                ]))
            .toList()));
  }
}

Widget getBottoomTitles(double value, TitleMeta meta) {
  const style =
      TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14);
  Widget text;
  switch (value.toInt()) {
    case 0:
      text = const Text(
        'S',
        style: style,
      );
      break;
    case 1:
      text = const Text(
        'M',
        style: style,
      );
      break;
    case 2:
      text = const Text(
        'T',
        style: style,
      );
      break;
    case 3:
      text = const Text(
        'W',
        style: style,
      );
      break;
    case 4:
      text = const Text(
        'T',
        style: style,
      );
      break;
    case 5:
      text = const Text(
        'F',
        style: style,
      );
      break;
    case 6:
      text = const Text(
        'S',
        style: style,
      );
      break;
    default:
      text = const Text(
        '',
        style: style,
      );
      break;
  }
  return SideTitleWidget(axisSide: meta.axisSide, child: text);
}
