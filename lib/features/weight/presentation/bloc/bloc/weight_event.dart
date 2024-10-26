part of 'weight_bloc.dart';

sealed class WeightEvent extends Equatable {
  const WeightEvent();

  @override
  List<Object> get props => [];
}



final class WeightInitEvent extends WeightEvent{

}

final class WeightAddEvent extends WeightEvent{
  final DateTime date;
  final double weight;

  WeightAddEvent({required this.date, required this.weight});
  @override
  // TODO: implement props
  List<Object> get props => [date, weight];
}