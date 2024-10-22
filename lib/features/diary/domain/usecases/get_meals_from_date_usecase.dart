import 'package:dartz/dartz.dart';
import 'package:keep_fit/config/locator/locator.dart';
import 'package:keep_fit/core/usecase/usecase.dart';
import 'package:keep_fit/features/diary/domain/repositories/meal_repository.dart';

class GetMealsFromDateUsecase extends Usecase<Either, dynamic>{
  @override
  Future<Either> call(params) async{
    return await getInstance<MealRepository>().getMealsFromDate(params);
  }
}