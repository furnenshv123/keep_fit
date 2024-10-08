import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:keep_fit/features/main/presentation/widgets/main_logo_app.dart';
import 'package:keep_fit/themes/colors.dart';



@RoutePage()
class DiaryScreen extends StatefulWidget {
  const DiaryScreen({super.key});

  @override
  State<DiaryScreen> createState() => _DiaryScreenState();
}

class _DiaryScreenState extends State<DiaryScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: AppColors.gradientApp
      ),
      child: Column(
        children: [
          
        ],
      ),
    );
  }
}