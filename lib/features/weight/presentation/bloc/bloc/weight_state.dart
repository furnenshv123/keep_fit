part of 'weight_bloc.dart';

sealed class WeightState extends Equatable {
  const WeightState();
  
  @override
  List<Object> get props => [];
}

final class WeightInitial extends WeightState {}


final class WeightLoaded extends WeightState{}

final class WeightLoadFailure extends WeightState{}

final class WeightInitTargetsWeights extends WeightState{
  final TargetEntity entity;
  final List<WeightEntity> weights;
  WeightInitTargetsWeights({required this.entity, required this.weights});
  @override
  // TODO: implement props
  List<Object> get props => [entity, weights];
}

final class WeightAddDay extends WeightState{
  final WeightEntity entity;

  WeightAddDay({required this.entity});
  @override
  // TODO: implement props
  List<Object> get props => [entity];
}