import 'package:flutter/material.dart';
import 'package:keep_fit/themes/colors.dart';

class TargetWidget extends StatefulWidget {
  TargetWidget({super.key, required this.currentWeight, required this.endWeight, required this.startWeight});

  double startWeight;
  double currentWeight;
  double endWeight;
  @override
  State<TargetWidget> createState() => _TargetWidgetState();
}

class _TargetWidgetState extends State<TargetWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20, left: 20, top: 30, bottom: 35),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            child: Column(
              children: [
                Container(
                    decoration: const BoxDecoration(
                        color: AppColors.blackAppColor,
                        borderRadius: BorderRadius.all(Radius.circular(40))),
                    padding:
                        const EdgeInsets.symmetric(vertical: 9, horizontal: 7),
                    child: Text(
                      widget.startWeight.toString() +'kg',
                      style: const TextStyle(
                          fontSize: 20,
                          fontFamily: "Hanken",
                          color: Colors.white),
                    )),
                    Text('Start', style: const TextStyle(
                          fontSize: 20,
                          fontFamily: "Hanken",
                          color: Colors.white),)
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Container(
                    decoration: const BoxDecoration(
                        color: AppColors.blackAppColor,
                        borderRadius: BorderRadius.all(Radius.circular(40))),
                    padding:
                        const EdgeInsets.symmetric(vertical: 12, horizontal: 13),
                    child: Text(
                      widget.currentWeight.toString() +'kg',
                      style: const TextStyle(
                          fontSize: 25,
                          fontFamily: "Hanken",
                          color: Colors.white),
                    )),
                    Text('Current', style: const TextStyle(
                          fontSize: 20,
                          fontFamily: "Hanken",
                          color: Colors.white),)
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Container(
                    decoration: const BoxDecoration(
                        color: AppColors.blackAppColor,
                        borderRadius: BorderRadius.all(Radius.circular(40))),
                    padding:
                        const EdgeInsets.symmetric(vertical: 9, horizontal: 7),
                    child: Text(
                      widget.endWeight.toString() +'kg',
                      style: const TextStyle(
                          fontSize: 20,
                          fontFamily: "Hanken",
                          color: Colors.white),
                    )),
                    Text('Wanted', style: const TextStyle(
                          fontSize: 20,
                          fontFamily: "Hanken",
                          color: Colors.white),)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
