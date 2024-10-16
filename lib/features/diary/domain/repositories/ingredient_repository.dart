import 'package:keep_fit/core/errors/failure.dart';
import 'package:keep_fit/features/diary/domain/entities/ingredient_entity.dart';

import 'package:dartz/dartz.dart';
abstract class IngredientRepository{
  Future<Either>getAllIngredients();
  Future<Either>getIngredientByName(String name);
}
