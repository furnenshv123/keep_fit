import 'package:flutter/material.dart';
import 'package:keep_fit/themes/colors.dart';

class TextFieldWidget extends StatefulWidget {
  TextFieldWidget(
      {super.key,
      required this.textLabel,
      required this.controller,
      this.obscureMod = false});
  final String textLabel;
  final TextEditingController controller;
  bool obscureMod;
  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.textLabel,
            style: const TextStyle(
              fontFamily: "Hanken",
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            cursorColor: AppColors.blackAppColor,
            decoration: const InputDecoration(
              
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(40))),
              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(40)),
                borderSide: BorderSide(width: 3)
              )
              
            ),
            controller: widget.controller,
            obscureText: widget.obscureMod,
          ),
        ],
      ),
    );
  }
}