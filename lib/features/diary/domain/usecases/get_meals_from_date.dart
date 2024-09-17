import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:keep_fit/core/errors/failure.dart';
import 'package:keep_fit/core/usecase/usecase.dart';
import 'package:keep_fit/features/diary/domain/entities/meal_entity.dart';
import 'package:keep_fit/features/diary/domain/repositories/abstract_repositories.dart';

class GetMealsFromDate extends Usecase<List<MealEntity>, GetMealsParams> {
  final MealRepository _mealRepostory;

  GetMealsFromDate({required MealRepository mealRepostory}) : _mealRepostory = mealRepostory;

  @override
  Future<Either<Failure, List<MealEntity>>> call(GetMealsParams params) async{
    return await _mealRepostory.getMealsFromDate(params.date);
  }

}

class GetMealsParams extends Equatable{
  final DateTime date;

  GetMealsParams({required this.date});

  @override
  // TODO: implement props
  List<Object?> get props => [date];

}