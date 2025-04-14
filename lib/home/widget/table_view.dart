import 'package:flutter/material.dart';

class TopProgramTable extends StatelessWidget {
  final List<Map<String, String>> programs = [
    {'name': 'Leadership Growth', 'category': 'Engineer'},
    {'name': 'Tech Mentorship', 'category': 'Doctor'},
    {'name': 'Career Guidance', 'category': 'Artist'},
    {'name': 'Business Skills', 'category': 'Chef'},
    {'name': 'Business Skills', 'category': 'Chef'},
    {'name': 'Business Skills', 'category': 'Chef'},
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),side: BorderSide(color: Colors.grey.shade400)),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                headingRowColor: WidgetStateProperty.all(
                  const Color(0xFFE8F0FA),
                ),border: TableBorder(
                borderRadius: BorderRadius.circular(10),
                horizontalInside: BorderSide(
                    color: Colors.grey.shade50
                )
                  ),headingTextStyle: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.black),
                 dataTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.black,fontWeight: FontWeight.w200),
                columns: const [
                  DataColumn(label: Text('Program Name')),
                  DataColumn(label: Text('Category')),
                  DataColumn(label: Text('Category')),
                  DataColumn(label: Text('Category')),
                  DataColumn(label: Text('Category')),
                  DataColumn(label: Text('Category')),
                  DataColumn(label: Text('Category')),
                ],
                rows: programs
                    .take(5).map(
                      (program) => DataRow(
                    cells: [
                      DataCell(Text(program['name']!)),
                      DataCell(Text(program['category']!)),
                      DataCell(Text(program['category']!)),
                      DataCell(Text(program['category']!)),
                      DataCell(Text(program['category']!)),
                      DataCell(Text(program['category']!)),
                      DataCell(Text(program['category']!)),
                    ],
                  ),
                )
                    .toList(),
              ),
            ),
        ],
      ),
    );
  }
}
