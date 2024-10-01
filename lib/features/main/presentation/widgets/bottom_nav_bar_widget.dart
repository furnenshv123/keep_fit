import 'package:flutter/material.dart';
import 'package:keep_fit/features/main/presentation/widgets/bottom_nav_bar_item.dart';
import 'package:keep_fit/themes/colors.dart';

class BottomNavBarWidget extends StatefulWidget {
  BottomNavBarWidget(
      {super.key,
      required this.items,
      required this.onTap,
      required this.currentIndex});
  int currentIndex;
  final List<BottomNavBarItem> items;
  final Function(int)? onTap;

  @override
  State<BottomNavBarWidget> createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
              child: Container(
                margin:
                    EdgeInsets.only(bottom: 15, right: 24, left: 24, top: 16),
                height: 63,
                decoration: const BoxDecoration(
                    color: AppColors.blackAppColor,
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                    border: Border(
                        top:
                            BorderSide(color: AppColors.bordersColor, width: 3),
                        left:
                            BorderSide(color: AppColors.bordersColor, width: 3),
                        right:
                            BorderSide(color: AppColors.bordersColor, width: 3),
                        bottom: BorderSide(
                            color: AppColors.bordersColor, width: 3))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(
                      widget.items.length,
                      (index) => BottomNavBarItem(item: widget.items[index],
                      indexPage: index, onTap: (){},
                            
                            
                          )),
                ),
              ),
            )
  }
}
