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

  MealAcceptState({required this.ingredient});
}

final class MealLoadFailure extends MealsBlocState{}