
import 'package:dartz/dartz.dart';
import 'package:keep_fit/core/errors/failure.dart';

import '../entities/meal_entity.dart';

abstract class MealRepository{
  Future<Either<Failure, List<MealEntity> >>getMealsFromDate(DateTime date);
}