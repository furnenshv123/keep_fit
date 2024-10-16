// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:keep_fit/features/diary/domain/entities/ingredient_entity.dart';

class IngredientModel extends Equatable {
  
  final int calories;
  final String name;
  final int proteins;
  final int carbohydrates;
  final int fats;
  final String urlPicture;
  IngredientModel({ required this.calories, required this.name,  required this.proteins, required this.carbohydrates, required this.fats, required this.urlPicture});
  
  @override
  // TODO: implement props
  List<Object?> get props => [calories, name,  proteins, carbohydrates, fats,  urlPicture];
  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'calories': calories,
      'name': name,
      'proteins': proteins,
      'carbohydrates': carbohydrates,
      'fats': fats,
      'urlPicture': urlPicture,
    };
  }

  factory IngredientModel.fromMap(Map<String, dynamic> map) {
    return IngredientModel(
      calories: map['calories'] as int,
      name: map['name'] as String,
      proteins: map['proteins'] as int,
      carbohydrates: map['carbs'] as int,
      fats: map['fats'] as int,
      urlPicture: map['picture'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory IngredientModel.fromJson(String source) => IngredientModel.fromMap(json.decode(source) as Map<String, dynamic>);
}


extension IngredientModelEx on IngredientModel{
  IngredientEntity toEntity(){
    return IngredientEntity(calories: calories, name: name, proteins: proteins, carbohydrates: carbohydrates, fats: fats, urlPicture: urlPicture);
  }
}