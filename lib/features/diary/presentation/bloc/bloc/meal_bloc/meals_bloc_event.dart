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
}