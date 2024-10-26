import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WeightDataWidget extends StatefulWidget {
  const WeightDataWidget({super.key, required this.weight, required this.date});
  final double weight;
  final DateTime date;
  @override
  State<WeightDataWidget> createState() => _WeightDataWidgetState();
}

class _WeightDataWidgetState extends State<WeightDataWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            DateFormat.yMMMd().format(widget.date),
            style: const TextStyle(
                fontFamily: "Hanken", fontSize: 20, color: Colors.white),
          ),
          Container(
            child: Row(
              children: [
                Text(
                  widget.weight.toString() + ' kg',
                  style: const TextStyle(
                      fontFamily: "Hanken", fontSize: 20, color: Colors.white),
                ),
                const Icon(Icons.arrow_drop_down, color: Colors.green,),
              ],
            ),
          )
        ],
      ),
    );
  }
}
