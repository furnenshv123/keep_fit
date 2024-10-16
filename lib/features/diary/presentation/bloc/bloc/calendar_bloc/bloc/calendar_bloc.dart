import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'calendar_event.dart';
part 'calendar_state.dart';

class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  CalendarBloc() : super(CalendarInitial()) {
    on<CalendarDaySelected>((event, emit) {
      emit(CalendarChangeDay(selectedDay: event.selectedDay));
    });
  }
}
