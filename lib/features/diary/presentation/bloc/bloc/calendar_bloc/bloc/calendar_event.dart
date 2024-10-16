part of 'calendar_bloc.dart';

abstract class CalendarEvent extends Equatable {
  const CalendarEvent();

  @override
  List<Object> get props => [];
}


class CalendarDaySelected extends CalendarEvent{
  final DateTime selectedDay;

  CalendarDaySelected({required this.selectedDay});
}