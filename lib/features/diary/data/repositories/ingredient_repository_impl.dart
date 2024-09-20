import 'package:dartz/dartz.dart';
import 'package:keep_fit/core/errors/failure.dart';
import 'package:keep_fit/features/diary/data/models/ingredient_model.dart';
import 'package:keep_fit/features/diary/domain/entities/ingredient_entity.dart';
import 'package:keep_fit/features/diary/domain/repositories/ingredient_repository.dart';

class IngredientRepositoryImpl  implements IngredientRepository{
  @override
  Future<Either<Failure, List<IngredientModel>>> getAllIngredients() {
    // TODO: implement getAllIngredients
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<IngredientModel>>> searchIngredient(String query) {
    // TODO: implement searchIngredient
    throw UnimplementedError();
  }

}