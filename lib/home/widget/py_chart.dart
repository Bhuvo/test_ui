import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import '../../model/percent_model.dart';
import '../../widget/space.dart';



class PyChart extends StatelessWidget {
  final ChartData data;
  const PyChart({super.key, required this.data, });


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 300,
      child: Column(
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                PieChart(
                    duration: Duration(milliseconds: 150), // Optional
                    curve: Curves.linear,
                    PieChartData(
                        sections: (data.sub).map((e) => PieChartSectionData( title: '',
                          color: e.color,
                          value: e.val,
                          // title: '50%',
                          radius: 30,
                        )).toList(),
                      borderData: FlBorderData(
                        border: Border.all(
                          color: Colors.grey,
                          width: 2,
                        )
                      )
                  )
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Total Programs',style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 20),),
                    Space(10),
                    Text('${data.total}%',style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),),
                  ],
                )
              ],
            ),
          ),
          Space(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: data.sub.map((e){
              return Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: e.color,radius: 5,
                    ),
                    Space(5),
                    Text('${e.name} ${e.val.toInt()}',style: Theme.of(context).textTheme.titleSmall,),
                  ],
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
