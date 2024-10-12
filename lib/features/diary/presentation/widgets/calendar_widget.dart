import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:keep_fit/themes/colors.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({super.key});

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(40)),
          color: Color.fromRGBO(255, 255, 255, 0.8)),
      child: Column(
        children: [
          TableCalendar(
            daysOfWeekStyle: const DaysOfWeekStyle(
              weekdayStyle: TextStyle(color: AppColors.selectedDayColor, fontFamily: "Hanken", fontSize: 12),
              weekendStyle: TextStyle(color: AppColors.selectedDayColor, fontFamily: "Hanken", fontSize: 12),
            ),
            rowHeight: 70,
            startingDayOfWeek: StartingDayOfWeek.monday,
            focusedDay: _focusedDay,
            firstDay: DateTime.utc(2024, 9, 30),
            lastDay: DateTime.utc(2034, 10, 30),
            calendarFormat: CalendarFormat.week,
            daysOfWeekVisible: true,
            selectedDayPredicate: (day) => isSameDay(day, _selectedDay),
            availableGestures: AvailableGestures.all,
            calendarBuilders: CalendarBuilders(
              selectedBuilder: _selectedBuilder,
              todayBuilder: _todayBuilder,
              defaultBuilder: _defaultBuilder,
              outsideBuilder: _defaultBuilder
              
            ),
            onDaySelected: (selectedDay, focusedDay) {
              if (!isSameDay(_selectedDay, selectedDay)) {
                // Call `setState()` when updating the selected day
                setState(() {
                  if(focusedDay.isBefore(DateTime.now())){
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                  }
                });
              }
            },
            headerStyle: const HeaderStyle(
                formatButtonVisible: false,
                leftChevronVisible: false,
                rightChevronVisible: false,
                titleCentered: true,
                headerMargin: EdgeInsets.symmetric(vertical: 10),
                titleTextStyle: TextStyle(color: AppColors.selectedDayColor, fontFamily: "Hanken", fontSize: 16)),
          ),

        ],
      ),
    );
  }

  Widget? _todayBuilder(context, day, focusedDay) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
          decoration: const BoxDecoration(shape: BoxShape.circle),
          child: Column(
            children: [
              Container(
                
                alignment: Alignment.center,
                child: Text(day.day.toString(), style: const TextStyle(color: Colors.white, fontFamily: "Hanken", fontSize: 25),),
                width: 40,
                height: 40,
                decoration:
                    const BoxDecoration(color: AppColors.defaultDayColor, shape: BoxShape.circle),
              ),
              const SizedBox(height: 4,),
              const Icon(Icons.star, color: AppColors.lunchIconColor, size: 10, weight: 5,)
            ],
          ),
          
        );
        }

  Widget? _defaultBuilder(context, day, focusedDay) {
          return  Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
          decoration: const BoxDecoration(shape: BoxShape.circle),
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                child: Text(day.day.toString(), style: const TextStyle(color: Colors.white, fontFamily: "Hanken", fontSize: 25),),
                width: 40,
                height: 40,
                
                decoration:
                    const BoxDecoration(color: AppColors.defaultDayColor, shape: BoxShape.circle),
              ),
              
            ],
          ),
          
        );
        }

  Widget? _selectedBuilder(context, day, focusedDay) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Text(focusedDay.day.toString(), style: const TextStyle(color: Colors.white, fontFamily: "Hanken", fontSize: 25),),
                  width: 40,
                  height: 40,
                  decoration:
                      const BoxDecoration(color: AppColors.selectedDayColor, shape: BoxShape.circle),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  width: 5,
                  height: 5,
                  decoration: const BoxDecoration(shape: BoxShape.circle, color: AppColors.selectedDayColor),
                  child: null,
                )
              ],
            ),
            
          );
        }
}




// Container(
//               child: Text(
//                 DateFormat('MMMM').format(day) + ' ,' + day.year.toString(),
//                 style: const TextStyle(
//                     fontFamily: "Hanken", color: Colors.white, fontSize: 16),
//               ),
//             );