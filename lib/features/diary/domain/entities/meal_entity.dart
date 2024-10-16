

import 'package:equatable/equatable.dart';
import 'package:keep_fit/features/diary/domain/entities/ingredient_entity.dart';

class MealEntity extends Equatable {
  final int id;
  final int allCalories;
  final String name;
  final int allWeight;
  final int allProteins;
  final int allCarbohydrates;
  final int allFats;
  final List<String> ingredients;
  final DateTime date;
  MealEntity(
      {required this.id,required this.ingredients,
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
        id,
        date
      ];
}
