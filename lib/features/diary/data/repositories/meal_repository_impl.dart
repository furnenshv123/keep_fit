import 'package:dartz/dartz.dart';
import 'package:keep_fit/config/locator/locator.dart';
import 'package:keep_fit/features/diary/data/data_source/meal_firebase_service.dart';
import 'package:keep_fit/features/diary/data/models/meal_model.dart';
import 'package:keep_fit/features/diary/domain/repositories/meal_repository.dart';

class MealRepositoryImpl extends MealRepository{
  @override
  Future<Either> addMeals(MealModel meal) async{
    return await getInstance<MealFirebaseService>().addMeals(meal);
  }

  @override
  Future<Either> getMealsFromDate(DateTime date) async{
    return await getInstance<MealFirebaseService>().getMealsFromDate(date);
  }
}