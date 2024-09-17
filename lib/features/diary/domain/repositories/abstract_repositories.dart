import 'package:keep_fit/core/errors/failure.dart';
import 'package:keep_fit/features/diary/domain/entities/meal_entity.dart';
import 'package:dartz/dartz.dart';
abstract class IngredientRepository{
  Future<Either<Failure, List<IngredientEntity> >>getAllIngredients();
  Future<Either<Failure, List<IngredientEntity> >>searchIngredient(String query);
}

abstract class MealRepository{
  Future<Either<Failure, List<MealEntity> >>getMealsFromDate(DateTime date);
}