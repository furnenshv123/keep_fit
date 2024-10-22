import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:keep_fit/config/locator/locator.dart';
import 'package:keep_fit/features/diary/domain/entities/meal_entity.dart';
import 'package:keep_fit/features/diary/domain/usecases/get_meals_from_date_usecase.dart';
import 'package:table_calendar/table_calendar.dart';

part 'calendar_event.dart';
part 'calendar_state.dart';

class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  CalendarBloc() : super(CalendarInitial()) {
    on<LoadingCalendarEvent>(
      (event, emit) {
        emit(CalendarLoadedState());
      },
    );
    on<CalendarDaySelected>((event, emit) async {
      var result =
          await getInstance<GetMealsFromDateUsecase>().call(event.selectedDay);
      result.fold((l) {
        emit(CalendarLoadFailure());
      }, (data) {
        List<MealEntity> listOfMeals = data;
        if (listOfMeals.length == 1) {
          for (var i = 0; i < 2; i++) {
            listOfMeals.add(MealEntity(
                ingredients: [],
                allCalories: 0,
                name: 'name',
                allWeight: 0,
                allProteins: 0,
                allCarbohydrates: 0,
                allFats: 0,
                date: event.selectedDay.day.toString() +
                    event.selectedDay.month.toString() +
                    event.selectedDay.year.toString()));
          }
        } else if (listOfMeals.length == 2) {
          listOfMeals.add(MealEntity(
              ingredients: [],
              allCalories: 0,
              name: 'name',
              allWeight: 0,
              allProteins: 0,
              allCarbohydrates: 0,
              allFats: 0,
              date: event.selectedDay.day.toString() +
                  event.selectedDay.month.toString() +
                  event.selectedDay.year.toString()));
        }else if (listOfMeals.length == 0) {
          for (var i = 0; i < 3; i++) {
            listOfMeals.add(MealEntity(
                ingredients: [],
                allCalories: 0,
                name: 'name',
                allWeight: 0,
                allProteins: 0,
                allCarbohydrates: 0,
                allFats: 0,
                date: event.selectedDay.day.toString() +
                    event.selectedDay.month.toString() +
                    event.selectedDay.year.toString()));
          }
        }
        List<String> priorityOrder = ['Breakfast', 'Lunch', 'Dinner'];
        listOfMeals.sort(
          (a, b) {
            int indexA = priorityOrder.indexOf(a.name);
            int indexB = priorityOrder.indexOf(b.name);
            return indexA.compareTo(indexB);
          },
        );
        emit(CalendarChangeDay(
            selectedDay: event.selectedDay, listOfMeals: listOfMeals));
      });
    });
    on<InitialCalendarEvent>((event, emit) async {
      var result =
          await getInstance<GetMealsFromDateUsecase>().call(event.selectedDay);
      result.fold((l) {
        emit(CalendarLoadFailure());
      }, (data) {
        List<MealEntity> listOfMeals = data;
        if (listOfMeals == null) {
          listOfMeals = [];
          for (var i = 0; i < 3; i++) {
            listOfMeals.add(MealEntity(
                ingredients: [],
                allCalories: 0,
                name: 'name',
                allWeight: 0,
                allProteins: 0,
                allCarbohydrates: 0,
                allFats: 0,
                date: event.selectedDay.day.toString() +
                    event.selectedDay.month.toString() +
                    event.selectedDay.year.toString()));
          }
        } else if (listOfMeals.length == 1) {
          for (var i = 0; i < 2; i++) {
            listOfMeals.add(MealEntity(
                ingredients: [],
                allCalories: 0,
                name: 'name',
                allWeight: 0,
                allProteins: 0,
                allCarbohydrates: 0,
                allFats: 0,
                date: event.selectedDay.day.toString() +
                    event.selectedDay.month.toString() +
                    event.selectedDay.year.toString()));
          }
        } else if (listOfMeals.length == 2) {
          listOfMeals.add(MealEntity(
              ingredients: [],
              allCalories: 0,
              name: 'name',
              allWeight: 0,
              allProteins: 0,
              allCarbohydrates: 0,
              allFats: 0,
              date: event.selectedDay.day.toString() +
                  event.selectedDay.month.toString() +
                  event.selectedDay.year.toString()));
        } else if (listOfMeals.length == 0) {
          for (var i = 0; i < 3; i++) {
            listOfMeals.add(MealEntity(
                ingredients: [],
                allCalories: 0,
                name: 'name',
                allWeight: 0,
                allProteins: 0,
                allCarbohydrates: 0,
                allFats: 0,
                date: event.selectedDay.day.toString() +
                    event.selectedDay.month.toString() +
                    event.selectedDay.year.toString()));
          }
        }
        List<String> priorityOrder = ['Breakfast', 'Lunch', 'Dinner'];
        listOfMeals.sort(
          (a, b) {
            int indexA = priorityOrder.indexOf(a.name);
            int indexB = priorityOrder.indexOf(b.name);
            return indexA.compareTo(indexB);
          },
        );
        emit(InitCalendarState(listOfMeals: listOfMeals));
      });
    });
  }
}
