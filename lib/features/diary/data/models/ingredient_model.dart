import 'package:keep_fit/features/diary/domain/entities/ingredient_entity.dart';

class IngredientModel extends IngredientEntity {
  IngredientModel(
      {required super.id,
      required super.calories,
      required super.name,
      required super.weight,
      required super.proteins,
      required super.carbohydrates,
      required super.fats});

  factory IngredientModel.fromJson(Map<String, dynamic> json) =>
      IngredientModel(
          id: json['id'] ?? 0,
          calories: json['calories'] ?? 0,
          name: json['name'] ?? "",
          weight: json['weight'] ?? 0,
          proteins: json['proteins'] ?? 0,
          carbohydrates: json['carbohydrates'] ?? 0,
          fats: json['fats']?? 0);
}
