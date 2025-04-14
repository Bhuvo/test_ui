import 'dart:ui';

class ChartData {
  final String total;
  final List<SubData> sub;

  ChartData({required this.total, required this.sub});

  factory ChartData.fromJson(Map<String, dynamic> json) {
    return ChartData(
      total: json['total'] as String,
      sub: (json['sub'] as List)
          .map((e) => SubData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class SubData {
  final String name;
  final double val;
  final Color color;

  SubData({required this.name, required this.val, required this.color});

  factory SubData.fromJson(Map<String, dynamic> json) {
    return SubData(
      name: json['name'] as String,
      val: (json['val'] as num).toDouble(),
      color: Color(json['color']),
    );
  }
}
