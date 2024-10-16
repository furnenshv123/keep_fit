part of 'ingredient_bloc.dart';

sealed class IngredientState extends Equatable {
  const IngredientState();
  
  @override
  List<Object> get props => [];
}

final class IngredientInitial extends IngredientState {}

final class IngredientLoading extends IngredientState{}
final class IngerdientLoaded extends IngredientState{
  final List<IngredientEntity> listIngredients;

  IngerdientLoaded({required this.listIngredients});
}

final class IngredientLoadFailure extends IngredientState{
  
}

final class IngredientAcceptState extends IngredientState{
  final IngredientEntity ingredient;

  IngredientAcceptState({required this.ingredient});
}