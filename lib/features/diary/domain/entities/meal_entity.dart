import 'package:equatable/equatable.dart';

class MealEntity extends Equatable {
  final int id;
  final int allCalories;
  final String name;
  final int allWeight;
  final double allProteins;
  final double allCarbohydrates;
  final double allFats;
  final List<IngredientEntity> ingredients;
  MealEntity(
      {required this.id,required this.ingredients,
      required this.allCalories,
      required this.name,
      required this.allWeight,
      required this.allProteins,
      required this.allCarbohydrates,
      required this.allFats});

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
        id
      ];
}

class IngredientEntity extends Equatable{
  final int id;
  final int calories;
  final String name;
  final int weight;
  final double proteins;
  final double carbohydrates;
  final double fats;
  
  IngredientEntity({required this.id, required this.calories, required this.name, required this.weight, required this.proteins, required this.carbohydrates, required this.fats});
  
  @override
  // TODO: implement props
  List<Object?> get props => [calories, name, weight, proteins, carbohydrates, fats, id];
}
