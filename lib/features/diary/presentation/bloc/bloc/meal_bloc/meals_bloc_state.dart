part of 'meals_bloc_bloc.dart';

sealed class MealsBlocState extends Equatable {
  const MealsBlocState();
  
  @override
  List<Object> get props => [];
}

final class MealsBlocInitial extends MealsBlocState {}

final class MealsBlocLoaded extends MealsBlocState implements Equatable{


  
  @override
  List<Object> get props => [];
}

final class MealAcceptState extends MealsBlocState{
  final IngredientEntity ingredient;
  int index;
  final int weight;
  MealAcceptState({required this.ingredient, required this.index, required this.weight});
}

final class MealLoadFailure extends MealsBlocState{}