part of 'calendar_bloc.dart';

abstract class CalendarState extends Equatable {
  const CalendarState();
  
  @override
  List<Object> get props => [];
}

final class CalendarInitial extends CalendarState {}


final class CalendarChangeDay extends CalendarState{
  final DateTime selectedDay;

  CalendarChangeDay({required this.selectedDay});
}