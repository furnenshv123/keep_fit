import 'package:flutter/material.dart';
import 'package:keep_fit/icons/app_icons.dart';
import 'package:keep_fit/themes/colors.dart';

class MealWidget extends StatefulWidget {
  MealWidget(
      {super.key,
      required this.name,
      required this.icon,
      this.fats = 0,
      this.proteins = 0,
      this.calories = 0,
      this.carbs = 0, required this.color});
  int fats;
  int carbs;
  int proteins;
  int calories;
  final String name;
  final IconData icon;
  final Color color;
  @override
  State<MealWidget> createState() => _MealWidgetState();
}

class _MealWidgetState extends State<MealWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(40),
          ),
          color: AppColors.colorForMealWidgets),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  children: [
                    Icon(widget.icon, color: widget.color,),
                    Text(
                      widget.name,
                      style: const TextStyle(
                          color: Colors.white, fontFamily: "Hanken", fontSize: 22),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    child: Column(
                      children: [
                        Text(
                          widget.calories.toString(),
                          style: const TextStyle(
                              color: Colors.white,
                              fontFamily: "Hanken",
                              fontSize: 22),
                        ),
                        const Text(
                          'calories',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Hanken",
                              fontSize: 16),
                        )
                      ],
                    ),
                  ),
                  IconButton(
                      splashColor: Colors.black,
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add,
                        color: AppColors.colorForIconButtons,
                      )),
                ],
              )
            ],
          ),
          const Divider(
          
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                widget.fats.toString(),
                style: const TextStyle(
                    fontFamily: "Hanken", fontSize: 22, color: Colors.white),
              ),
              Text(
                widget.proteins.toString(),
                style: const TextStyle(
                    fontFamily: "Hanken", fontSize: 22, color: Colors.white),
              ),
              Text(
                widget.carbs.toString(),
                style: const TextStyle(
                    fontFamily: "Hanken", fontSize: 22, color: Colors.white),
              ),
              DropdownButton(items: [
                DropdownMenuItem(child: Container())
              ], onChanged: (value) {}, )
            ],
          )
        ],
      ),
    );
  }
}
