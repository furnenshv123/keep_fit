// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:keep_fit/features/diary/data/models/ingerdient_user_model.dart';

import 'package:keep_fit/features/diary/domain/entities/ingredient_user_entity.dart';
import 'package:keep_fit/features/diary/domain/entities/meal_entity.dart';

class MealModel extends Equatable {
  int allCalories;
  String name;
  int allWeight;
  int allProteins;
  int allFats;
  int allCarbohydrates;
  List<IngredientUserModel> ingredients;
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
      'allFats': allFats,
      'allCarbohydrates': allCarbohydrates,
      'ingredients': ingredients.map((x) => x.toMap()).toList(),
      'date': date,
    };
  }

  factory MealModel.fromMap(Map<String, dynamic> map) {
    return MealModel(
      allCalories: map['allCalories'] as int,
      name: map['name'] as String,
      allWeight: map['allWeight'] as int,
      allProteins: map['allProteins'] as int,
      allFats: map['allFats'] as int,
      allCarbohydrates: map['allCarbohydrates'] as int,
      ingredients: List<IngredientUserModel>.from(
        (map['ingredients'] as List<dynamic>).map<IngredientUserModel>(
          (x) => IngredientUserModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      date: map['date'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MealModel.fromJson(String source) =>
      MealModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

extension MealModelEx on MealModel {
  MealEntity toEntity() {
    return MealEntity(
        ingredients: ingredients.map((e) => e.toEntity()).toList(),
        allCalories: allCalories,
        name: name,
        allWeight: allWeight,
        allProteins: allProteins,
        allCarbohydrates: allCarbohydrates,
        allFats: allFats,
        date: date);
  }
}
