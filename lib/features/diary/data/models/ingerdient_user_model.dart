// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:keep_fit/features/diary/domain/entities/ingredient_user_entity.dart';

class IngredientUserModel extends Equatable {
  int calories;
  String name;
  int proteins;
  int carbohydrates;
  int fats;
  String urlPicture;
  int weight;

  IngredientUserModel(
      {required this.calories,
      required this.name,
      required this.proteins,
      required this.carbohydrates,
      required this.fats,
      required this.urlPicture,
      required this.weight});
  @override
  List<Object?> get props => [
        calories,
        name,
        proteins,
        carbohydrates,
        fats,
        urlPicture,
        weight,
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'calories': calories,
      'name': name,
      'proteins': proteins,
      'carbohydrates': carbohydrates,
      'fats': fats,
      'urlPicture': urlPicture,
      'weight': weight,
    };
  }

  factory IngredientUserModel.fromMap(Map<String, dynamic> map) {
    return IngredientUserModel(
      calories:  map['calories'] as int,
      name:  map['name'] as String,
      proteins:  map['proteins'] as int,
      carbohydrates:  map['carbohydrates'] as int,
      fats:  map['fats'] as int,
      urlPicture:  map['urlPicture'] as String,
      weight:  map['weight'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory IngredientUserModel.fromJson(String source) => IngredientUserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}


extension IngredientUserModelEx on IngredientUserModel{
  IngredientUserEntity toEntity(){
    return IngredientUserEntity(calories: calories, name: name, proteins: proteins, carbohydrates: carbohydrates, fats: fats, urlPicture: urlPicture, weight: weight);
  }
}