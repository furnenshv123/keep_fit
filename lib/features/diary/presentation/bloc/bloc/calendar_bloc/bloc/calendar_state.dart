part of 'calendar_bloc.dart';

abstract class CalendarState extends Equatable {
  const CalendarState();
  
  @override
  List<Object> get props => [];
}

final class CalendarInitial extends CalendarState {

}

final class CalendarLoadedState extends CalendarState{}

final class InitCalendarState extends CalendarState{
  final List<MealEntity> listOfMeals;

  InitCalendarState({required this.listOfMeals});
  @override
  List<Object> get props=>[listOfMeals];
}

final class CalendarChangeDay extends CalendarState{
  final DateTime selectedDay;
  final List<MealEntity> listOfMeals;
  CalendarChangeDay({required this.selectedDay, required this.listOfMeals});
  @override
  List<Object> get props=>[listOfMeals, selectedDay];
}

final class CalendarLoadFailure extends CalendarState{

}

final class CalendarCountPerDayState extends CalendarState{
  
}