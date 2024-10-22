

import 'package:equatable/equatable.dart';
import 'package:keep_fit/features/diary/data/models/ingerdient_user_model.dart';
import 'package:keep_fit/features/diary/data/models/meal_model.dart';
import 'package:keep_fit/features/diary/domain/entities/ingredient_user_entity.dart';

class MealEntity extends Equatable {
  int allCalories;
  String name;
  int allWeight;
  int allProteins;
  int allCarbohydrates;
  int allFats;
  List<IngredientUserEntity> ingredients;
  String date;
  MealEntity(
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
}


extension MaelEntityEx on MealEntity{
  MealModel toModel(){
    return MealModel(ingredients: ingredients.map((ingredient)=>ingredient.toModel()).toList(), allCalories: allCalories, name: name, allWeight: allWeight, allProteins: allProteins, allCarbohydrates: allCarbohydrates, allFats: allFats, date: date);
  }
  
}