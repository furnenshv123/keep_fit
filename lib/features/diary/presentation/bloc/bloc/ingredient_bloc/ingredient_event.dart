part of 'ingredient_bloc.dart';

sealed class IngredientEvent extends Equatable {
  const IngredientEvent();

  @override
  List<Object> get props => [];
}

final class IngredientGetEvent extends IngredientEvent{
}


final class IngredientWeightPost extends IngredientEvent{
  final String name;
  final int weight;

  IngredientWeightPost({required this.name, required this.weight});
}