import 'package:dartz/dartz.dart';
import 'package:keep_fit/config/locator/locator.dart';
import 'package:keep_fit/core/usecase/usecase.dart';
import 'package:keep_fit/features/diary/data/models/meal_model.dart';
import 'package:keep_fit/features/diary/domain/repositories/meal_repository.dart';

class MealAddUsecase extends Usecase<Either, dynamic>{
  @override
  Future<Either> call(params){
    return getInstance<MealRepository>().addMeals(params);
  }
}