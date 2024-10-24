part of 'calendar_bloc.dart';

abstract class CalendarEvent extends Equatable {
  const CalendarEvent();

  @override
  List<Object> get props => [];
}


class LoadingCalendarEvent extends CalendarEvent{}

class InitialCalendarEvent extends CalendarEvent{
  final DateTime selectedDay;

  InitialCalendarEvent({required this.selectedDay});
  @override
  List<Object> get props => [selectedDay];
}

class CalendarDaySelected extends CalendarEvent{
  final DateTime selectedDay;

  CalendarDaySelected({required this.selectedDay});
  @override
  List<Object> get props => [selectedDay];
}

class CalendarCountPerDayEvent extends CalendarEvent{
  
}