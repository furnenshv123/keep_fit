// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:keep_fit/features/weight/domain/entities/weight_entity.dart';

class WeightModel {
  final double weight;
  final String date;

  WeightModel({required this.weight, required this.date});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'weight': weight,
      'date': date,
    };
  }

  factory WeightModel.fromMap(Map<String, dynamic> map) {
    return WeightModel(
      weight: map['weight'] as double,
      date: map['date'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory WeightModel.fromJson(String source) => WeightModel.fromMap(json.decode(source) as Map<String, dynamic>);
}


extension WeightModelEx on WeightModel{
  WeightEntity toEntity(){
    return WeightEntity(weight: weight, date: DateFormat("MMM d, yyyy").parse(date));
  }
}