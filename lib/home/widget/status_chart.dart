import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../model/percent_model.dart';
import '../../widget/space.dart';

List<SubData> list = [
  SubData(name: 'All Programs', val: 30, color: Color(0xFF1954BF)),
  SubData(name: 'Active', val: 30, color: Color(0xFF7BA6E6)),
  SubData(name: 'Completed', val: 30, color: Color(0xFFDCEBFB)),
];

class ProgramStatusChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top:10),
      width: double.maxFinite,
      height: 300,
      child: Column(
        children: [
          Expanded(
            child: BarChart(
              BarChartData(
                groupsSpace: 50,
                barGroups: [
                  makeGroupData(0, 10, 8, 30),
                  makeGroupData(1, 35, 35, 35),
                  makeGroupData(2, 55, 30, 55),
                ],
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(axisNameSize:20,
                    sideTitles: SideTitles(showTitles: true,getTitlesWidget: (value, meta) {
                      return Text('${value.toInt()}');
                    },),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: bottomTitleWidgets,
                    ),
                  ),
                  topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                ),
                gridData: FlGridData(show: true,drawVerticalLine: false,getDrawingHorizontalLine: (val)=>FlLine(color: Colors.grey.shade300,strokeWidth: 1)),
                borderData: FlBorderData(show: true,border: Border(left: BorderSide(color: Colors.grey.shade300),bottom: BorderSide(color: Colors.grey.shade300))),
                barTouchData: BarTouchData(enabled: true),
                alignment: BarChartAlignment.spaceAround,
              ),
            ),
          ),
          Space(),
          Wrap(
            children: list.map((e){
              return Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      backgroundColor: e.color,radius: 5,
                    ),
                    Space(5),
                    Text('${e.name}',style: Theme.of(context).textTheme.titleSmall,),
                  ],
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }

  BarChartGroupData makeGroupData(int x, double completed, double active, double allPrograms) {
    return BarChartGroupData(x: x,
        barsSpace: 8,
        barRods: [
      BarChartRodData(toY: completed, width: 10, color: const Color(0xFFDCEBFB),borderRadius: BorderRadius.circular(0)),  // Completed
      BarChartRodData(toY: active, width: 10, color: const Color(0xFF7BA6E6),borderRadius: BorderRadius.circular(0)),     // Active
      BarChartRodData(toY: allPrograms, width: 10, color: const Color(0xFF1954BF),borderRadius: BorderRadius.circular(0)),// All programs
    ]);
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(color: Colors.black, fontWeight: FontWeight.bold);
    switch (value.toInt()) {
      case 0:
        return Text('Jan', style: style);
      case 1:
        return Text('Feb', style: style);
      case 2:
        return Text('Mar', style: style);
      default:
        return const SizedBox.shrink();
    }
  }
}
