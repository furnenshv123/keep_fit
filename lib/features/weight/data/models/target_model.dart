// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:keep_fit/features/weight/domain/entities/target_entity.dart';

class TargetModel {
  final double startWeight;
  final double endWeight;
  final String startDate;

  TargetModel(
      {required this.startWeight, required this.endWeight, required this.startDate});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'startWeight': startWeight,
      'endWeight': endWeight,
      'startDate': startDate,
    };
  }

  factory TargetModel.fromMap(Map<String, dynamic> map) {
    return TargetModel(
      startWeight: map['startWeight'] as double,
      endWeight: map['endWeight'] as double,
      startDate: map['startDate'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TargetModel.fromJson(String source) =>
      TargetModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

extension TargetModelEx on TargetModel {
  TargetEntity toEntity() {
    return TargetEntity(
        startWeight: startWeight,
        endWeight: endWeight,
        date: DateFormat("MMM d, yyyy").parse(startDate));
  }
}
