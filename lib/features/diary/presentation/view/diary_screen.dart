import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:keep_fit/features/diary/domain/entities/meal_entity.dart';
import 'package:keep_fit/features/diary/domain/usecases/get_meals_from_date_usecase.dart';
import 'package:keep_fit/features/diary/presentation/bloc/bloc/calendar_bloc/bloc/calendar_bloc.dart';
import 'package:keep_fit/features/diary/presentation/bloc/bloc/meal_bloc/meals_bloc_bloc.dart';
import 'package:keep_fit/features/diary/presentation/widgets/calendar_widget.dart';
import 'package:keep_fit/features/diary/presentation/widgets/data_for_day_widget.dart';
import 'package:keep_fit/features/diary/presentation/widgets/meal_widget.dart';

import 'package:keep_fit/icons/icons_app_icons.dart';
import 'package:keep_fit/themes/colors.dart';

@RoutePage()
class DiaryScreen extends StatefulWidget {
  const DiaryScreen({super.key});

  @override
  State<DiaryScreen> createState() => _DiaryScreenState();
}

class _DiaryScreenState extends State<DiaryScreen> {
  List<String> listOfNames = ['Breakfast', 'Lunch', 'Dinner'];
  List<IconData> listOfIcons = [IconsApp.sunrise, IconsApp.sun, IconsApp.moon];
  List<Color> listOfColors = [
    AppColors.colorForBreakfast,
    AppColors.lunchIconColor,
    AppColors.colorForDinner
  ];

  DateTime selectedDay = DateTime.now();
  List<MealEntity> listOfMeals = [];

  @override
  Widget build(BuildContext context) {
   

    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) {
        final bloc = CalendarBloc();
        bloc.add(InitialCalendarEvent(selectedDay: selectedDay));
        return bloc;
      
      }),
      BlocProvider(create: (context){
        final mealBloc = MealsBlocBloc();
        return mealBloc;
      })]
          ,
      child: Container(
          decoration: const BoxDecoration(gradient: AppColors.gradientApp),
          child: BlocBuilder<CalendarBloc, CalendarState>(
              builder: (context, state) {
            if (state is InitCalendarState) {
              listOfMeals = state.listOfMeals;
              return ListView(
              children: [
                CalendarWidget(
                  bloc: context.read<CalendarBloc>(),
                ),
                DataForDayWidget(
                    calories: 1000, carbs: 1000, fats: 1000, prots: 1000),
                Column(
                  children: List.generate(listOfIcons.length, (index) {
                    return MealWidget(
                      bloc: context.read<MealsBlocBloc>(),
                        selectedDay: selectedDay,
                        name: listOfNames[index],
                        icon: listOfIcons[index],
                        color: listOfColors[index],
                        model: listOfMeals[index]);
                  }),
                ),
              ],
            );
            }
            if (state is CalendarChangeDay) {
              selectedDay = state.selectedDay;
              listOfMeals = state.listOfMeals;
              return ListView(
              children: [
                CalendarWidget(
                  bloc: context.read<CalendarBloc>(),
                ),
                DataForDayWidget(
                    calories: 1000, carbs: 1000, fats: 1000, prots: 1000),
                Column(
                  children: List.generate(listOfIcons.length, (index) {
                    return MealWidget(
                        bloc: context.read<MealsBlocBloc>(),
                        selectedDay: selectedDay,
                        name: listOfNames[index],
                        icon: listOfIcons[index],
                        color: listOfColors[index],
                        model: listOfMeals[index]);
                  }),
                ),
              ],
            );
            }
            if (state is CalendarLoadFailure) {
              return const Text('Error!');
            }
            return const Center(child: CircularProgressIndicator(color: AppColors.blackAppColor,));
          })),
    );
  }
}
