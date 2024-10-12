import 'package:flutter/material.dart';

class DataForDayWidget extends StatefulWidget {
  DataForDayWidget(
      {super.key,
      required this.calories,
      required this.carbs,
      required this.fats,
      required this.prots});
  int fats;
  int prots;
  int carbs;
  int calories;
  @override
  State<DataForDayWidget> createState() => _DataForDayWidgetState();
}

class _DataForDayWidgetState extends State<DataForDayWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ConstrainedBox(
              constraints: const BoxConstraints(
                  maxHeight: 70, maxWidth: 100, minWidth: 50),
              child: Text(
                'Fats\n' + widget.fats.toString(),
                style: const TextStyle(
                    fontFamily: "Hanken", fontSize: 22, color: Colors.white),
              ),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(
                  maxHeight: 70, maxWidth: 100, minWidth: 50),
              child: Text(
                'Prots\n' + widget.prots.toString(),
                style: const TextStyle(
                    fontFamily: "Hanken", fontSize: 22, color: Colors.white),
              ),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(
                  maxHeight: 70, maxWidth: 100, minWidth: 50),
              child: Text(
                'Carbs\n' + widget.carbs.toString(),
                style: const TextStyle(
                    fontFamily: "Hanken", fontSize: 22, color: Colors.white),
              ),
            ),
            const VerticalDivider(color: Colors.white, thickness: 2,),
            ConstrainedBox(
              constraints: const BoxConstraints(
                  maxHeight: 70, maxWidth: 100, minWidth: 50),
              child: Text(
                'Calories\n' + widget.calories.toString(),
                style: const TextStyle(
                    fontFamily: "Hanken", fontSize: 22, color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
