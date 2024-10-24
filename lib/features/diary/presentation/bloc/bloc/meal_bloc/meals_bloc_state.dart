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
  @override
  List<Object> get props=>[ingredient, index, weight];
}

final class MealLoadFailure extends MealsBlocState{}

final class MealDeleteProductState extends MealsBlocState{
  final int index;

  MealDeleteProductState({required this.index});
  @override
  // TODO: implement props
  List<Object> get props => [index];
}

final class MealReCount extends MealsBlocState {
  final List<IngredientUserEntity> ingredients;

  MealReCount({required this.ingredients});
  @override
  // TODO: implement props
  List<Object> get props => [ingredients];
}

final class MealAddRemoteDataState extends MealsBlocState{
  
}

final class MealUpdateState extends MealsBlocState{}

final class MealAddProductState extends MealsBlocState{}