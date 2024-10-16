part of 'meals_bloc_bloc.dart';

sealed class MealsBlocEvent extends Equatable {
  const MealsBlocEvent();

  @override
  List<Object> get props => [];
}

final class MealWeightPost extends MealsBlocEvent{
  final String name;
  final int weight;

  MealWeightPost({required this.name, required this.weight});
}