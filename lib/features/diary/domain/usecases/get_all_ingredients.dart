import 'package:dartz/dartz.dart';
import 'package:keep_fit/core/errors/failure.dart';
import 'package:keep_fit/features/diary/domain/entities/meal_entity.dart';
import 'package:keep_fit/features/diary/domain/repositories/abstract_repositories.dart';

class GetAllIngredients{
  

  GetAllIngredients({required IngredientRepository ingredientRepository}):_ingredientRepository = ingredientRepository;
  final IngredientRepository _ingredientRepository;
  Future<Either<Failure, List<IngredientEntity>>> call() async{
    return await _ingredientRepository.getAllIngredients();
  }

}