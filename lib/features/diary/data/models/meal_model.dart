// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class MealModel extends Equatable {

  int allCalories;
  String name;
  int allWeight;
  int allProteins;
   int allCarbohydrates;
   int allFats;
   List<String> ingredients;
   String date;
  MealModel(
      {required this.ingredients,
      required this.allCalories,
      required this.name,
      required this.allWeight,
      required this.allProteins,
      required this.allCarbohydrates,
      required this.allFats,
      required this.date});

  @override
  // TODO: implement props
  List<Object?> get props => [
        allCalories,
        allCarbohydrates,
        allFats,
        allProteins,
        allWeight,
        name,
        ingredients,
        
        date
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{

      'allCalories': allCalories,
      'name': name,
      'allWeight': allWeight,
      'allProteins': allProteins,
      'allCarbohydrates': allCarbohydrates,
      'allFats': allFats,
      'ingredients': ingredients,
      'date': date,
    };
  }

  factory MealModel.fromMap(Map<String, dynamic> map) {
    return MealModel(
      
      allCalories:  map['allCalories'] as int,
      name:  map['name'] as String,
      allWeight:  map['allWeight'] as int,
      allProteins:  map['allProteins'] as int,
      allCarbohydrates:  map['allCarbohydrates'] as int,
      allFats:  map['allFats'] as int,
      date: map['date'] as String,
      ingredients:  List<String>.from((map['ingredients'] as List<String>),
      
    ));
  }

  String toJson() => json.encode(toMap());

  factory MealModel.fromJson(String source) => MealModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
