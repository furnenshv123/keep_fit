import 'package:dartz/dartz.dart';
import 'package:keep_fit/config/locator/locator.dart';
import 'package:keep_fit/core/usecase/usecase.dart';
import 'package:keep_fit/features/diary/domain/repositories/ingredient_repository.dart';

class GetIngredientByNameUsecase extends Usecase<Either, dynamic>{
  @override
  Future<Either> call(params) async{
    return await getInstance<IngredientRepository>().getIngredientByName(params);
  }
}