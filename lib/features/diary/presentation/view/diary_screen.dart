import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:keep_fit/features/diary/presentation/widgets/calendar_widget.dart';
import 'package:keep_fit/features/diary/presentation/widgets/data_for_day_widget.dart';
import 'package:keep_fit/features/diary/presentation/widgets/meal_widget.dart';
import 'package:keep_fit/features/main/presentation/widgets/main_logo_app.dart';
import 'package:keep_fit/icons/app_icons.dart';
import 'package:keep_fit/icons/icons_app_icons.dart';
import 'package:keep_fit/themes/colors.dart';
import 'package:table_calendar/table_calendar.dart';

@RoutePage()
class DiaryScreen extends StatefulWidget {
  const DiaryScreen({super.key});

  @override
  State<DiaryScreen> createState() => _DiaryScreenState();
}

class _DiaryScreenState extends State<DiaryScreen> {
  List<String> listOfNames = ['Breakfast', 'Lunch', 'Dinner'];
  List<IconData> listOfIcons = [
    IconsApp.sunrise,
    IconsApp.sun,
    IconsApp.moon
  ];
  List<Color> listOfColors = [
    AppColors.colorForBreakfast,
    AppColors.lunchIconColor,
    AppColors.colorForDinner
  ];
  @override
  Widget build(BuildContext context) {
    
    return Container(
        decoration: const BoxDecoration(gradient: AppColors.gradientApp),
        child: ListView(
          children: [
            const CalendarWidget(),
            DataForDayWidget(calories: 1000, carbs: 1000, fats: 1000, prots: 1000),
            Column(
              children: List.generate(listOfIcons.length, (index) {
                return MealWidget(
                    name: listOfNames[index], icon: listOfIcons[index], color: listOfColors[index],);
              }),
            ),
            
          ],
        ));
  }
}
