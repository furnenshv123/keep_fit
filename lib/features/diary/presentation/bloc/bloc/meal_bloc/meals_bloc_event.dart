part of 'meals_bloc_bloc.dart';

sealed class MealsBlocEvent extends Equatable {
  const MealsBlocEvent();

  @override
  List<Object> get props => [];
}

final class MealLoading extends MealsBlocEvent{}

final class MealWeightPost extends MealsBlocEvent{
  final String name;
  final int weight;
  int index;
  MealWeightPost({required this.index, required this.name, required this.weight});
  @override
  List<Object> get props => [name, weight, index];
}

final class MealTransferDataEvent extends MealsBlocEvent{
  final List<IngredientUserEntity> ingredients;

  MealTransferDataEvent({required this.ingredients});
  @override
  List<Object> get props => [ingredients];
}


final class MealAddRemoteEvent extends MealsBlocEvent{
  final MealEntity entity;

  MealAddRemoteEvent({required this.entity});
  @override
  List<Object> get props => [entity];
}