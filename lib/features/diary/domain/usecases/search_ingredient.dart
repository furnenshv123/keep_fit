
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:keep_fit/core/errors/failure.dart';
import 'package:keep_fit/core/usecase/usecase.dart';
import 'package:keep_fit/features/diary/domain/entities/meal_entity.dart';
import 'package:keep_fit/features/diary/domain/repositories/abstract_repositories.dart';

class SearchIngredient extends Usecase<List<IngredientEntity>, SearchIngredientParams>{
  

  SearchIngredient({required IngredientRepository ingredientRepository}):_ingredientRepository = ingredientRepository;
  final IngredientRepository _ingredientRepository;
  Future<Either<Failure, List<IngredientEntity>>> call(SearchIngredientParams params) async{
    return await _ingredientRepository.searchIngredient(params.query);
  }

}


class SearchIngredientParams extends Equatable{
  final String query;

  SearchIngredientParams({required this.query});

  @override
  // TODO: implement props
  List<Object?> get props => [query];
}