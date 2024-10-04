import 'package:flutter/material.dart';
import 'package:keep_fit/themes/colors.dart';

class ChangeAuthMode extends StatefulWidget {
  ChangeAuthMode({super.key, required this.change, required this.mode});
  final String mode;
  Function() change;
  @override
  State<ChangeAuthMode> createState() => _ChangeAuthModeState();
}

class _ChangeAuthModeState extends State<ChangeAuthMode> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text(widget.mode == 'Sign in'? 'Do you have an account?': "You don't have an account?",
              style: const TextStyle(
                fontFamily: "Hanken",
                color: Colors.white,
                fontSize: 20
              ),),
          TextButton(
              onPressed: widget.change,
                
              
              child: Text(
                widget.mode,
                style: const TextStyle(
                  fontFamily: "Hanken",
                  color: AppColors.dedicatedText,
                  fontSize: 20
                ),
              ))
        ],
      ),
    );
  }
}
