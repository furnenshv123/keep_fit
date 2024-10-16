
import 'package:dartz/dartz.dart';
import 'package:keep_fit/core/errors/failure.dart';
import 'package:keep_fit/features/diary/data/models/meal_model.dart';

import '../entities/meal_entity.dart';

abstract class MealRepository{
  Future<Either> getMealsFromDate(DateTime date);
  Future<Either> addMeals(MealModel meal);
}