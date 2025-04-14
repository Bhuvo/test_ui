import 'package:demo/home/widget/py_chart.dart';
import 'package:demo/home/widget/status_chart.dart';
import 'package:demo/home/widget/table_view.dart';
import 'package:demo/widget/main_card.dart';
import 'package:flutter/material.dart';

import '../model/percent_model.dart';

Map<String ,dynamic> data =
{
  'total' : '94',
  'sub' : [
    {
      'name' : 'Premium',
      'val' : 40.0,
      'color' : 0xFFFFBB01
    },
    {
      'name' : 'Free',
      'val' : 54.0,
      'color': 0xFF1954BF
    }
  ]
};

Map<String ,dynamic> dataMode =
{
  'total' : '96',
  'sub' : [
    {
      'name' : 'Virtual',
      'val' : 36.0,
      'color' : 0xFFFFBB01
    },
    {
      'name' : 'Physical',
      'val' : 50.0,
      'color': 0xFF1954BF
    }
  ]
};


final chartDataType = ChartData.fromJson(data);
final chartDataMode = ChartData.fromJson(dataMode);

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isTablet = MediaQuery.of(context).size.width > 600;
    final planedProgram = MainCard(title: 'Planed Program');
    final programStatus = MainCard(title: 'Program Status Metrics',child: ProgramStatusChart(),);
    final programType = MainCard(title: 'Program Type Metrics',child: PyChart(data: chartDataType,),);
    final programMode = MainCard(title: 'Program Mode Metrics',child: PyChart(data: chartDataMode,),);
    return SingleChildScrollView(
      child: Column(children: [
        isTablet? Row(
          children: [
            Expanded(child: planedProgram),
            Expanded(child: programStatus),
          ],
        ) : Column(
          children: [
            planedProgram,
            programStatus
          ],
        ),
        MainCard(title: 'Top Program',child: TopProgramTable(),titleAction: IconButton(onPressed: (){}, icon: Image.asset('assets/share.png'),)),
        MainCard(title: 'Top Mentors',child: TopProgramTable(),titleAction: IconButton(onPressed: (){}, icon: Image.asset('assets/share.png'),)),
       isTablet ? Row(
         children: [
           Expanded(child: programType),
           Expanded(child: programMode),
         ],
       ) : Column(
         children: [
           programType,
           programMode
         ],
       )
      ],),
    );
  }
}


