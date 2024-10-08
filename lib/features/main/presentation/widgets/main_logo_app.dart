import 'package:flutter/material.dart';
import 'package:keep_fit/resources/resources.dart';
import 'package:keep_fit/themes/colors.dart';

class MainLogoApp extends StatelessWidget {
  const MainLogoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          
          AppColors.secondForGradient,
          Color.fromRGBO(50, 65, 65, 1),
        ],
        begin: Alignment.bottomLeft,
        end: Alignment.topRight)
      ),
      padding: EdgeInsets.only(top: 50),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image: AssetImage(Images.tape)),
          SizedBox(width: 5,),
          Text(
            'KeepFit', style: TextStyle(fontFamily: "Holtwood", color: AppColors.defaultText, fontSize: 35),
          )
        ],
      ),
    );
  }
}