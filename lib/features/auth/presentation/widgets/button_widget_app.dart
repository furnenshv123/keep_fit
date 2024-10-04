import 'package:flutter/material.dart';
import 'package:keep_fit/themes/colors.dart';

class ButtonWidgetApp extends StatefulWidget {
  const ButtonWidgetApp(
      {super.key,
      required this.labelText,
      required this.height,
      required this.width,
      required this.fontSize});
  final String labelText;
  final double height;
  final double width;
  final double fontSize;
  @override
  State<ButtonWidgetApp> createState() => _ButtonWidgetAppState();
}

class _ButtonWidgetAppState extends State<ButtonWidgetApp> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Container(
        alignment: Alignment.center,
        height: widget.height,
        width: widget.width,
        child: Text(widget.labelText),
      ),
      style: ButtonStyle(
          textStyle: WidgetStatePropertyAll(TextStyle(
              fontFamily: "Hanken",
              
              fontSize: widget.fontSize)),
          foregroundColor: const WidgetStatePropertyAll(Colors.white),
          backgroundColor: const WidgetStatePropertyAll(AppColors.blackAppColor)
    ));
  }
}
