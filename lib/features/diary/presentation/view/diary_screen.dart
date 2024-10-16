import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keep_fit/features/diary/data/models/meal_model.dart';
import 'package:keep_fit/features/diary/presentation/bloc/bloc/calendar_bloc/bloc/calendar_bloc.dart';
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
  final CalendarBloc bloc = CalendarBloc();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CalendarBloc(),
      child: Container(
          decoration: const BoxDecoration(gradient: AppColors.gradientApp),
          child: BlocBuilder<CalendarBloc, CalendarState>(
              bloc: bloc,
              builder: (context, state) {
                if (state is CalendarChangeDay) {
                  selectedDay = state.selectedDay;
                }
                return ListView(
                  children: [
                    const CalendarWidget(),
                    DataForDayWidget(
                        calories: 1000, carbs: 1000, fats: 1000, prots: 1000),
                    Column(
                      children: List.generate(listOfIcons.length, (index) {
                        return MealWidget(
                          name: listOfNames[index],
                          icon: listOfIcons[index],
                          color: listOfColors[index],
                          model: MealModel(ingredients: [], allCalories: 0, name: listOfNames[index], allWeight: 0, allProteins: 0, allCarbohydrates: 0, allFats: 0, date: selectedDay.toString()),
                        );
                      }),
                    ),
                  ],
                );
              })),
    );
  }
}
