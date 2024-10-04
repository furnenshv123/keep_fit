import 'package:flutter/material.dart';
import 'package:keep_fit/features/main/presentation/widgets/bottom_nav_bar_item.dart';
import 'package:keep_fit/features/main/presentation/widgets/model_nav_bar.dart';
import 'package:keep_fit/icons/app_icons.dart';
import 'package:keep_fit/themes/colors.dart';

class BottomNavBarWidget extends StatefulWidget {
  BottomNavBarWidget(
      {super.key,
      required this.items,
      required this.onTap,
      required this.currentIndex});
  int currentIndex;
  final List<ModelNavBar> items;
  final Function(int)? onTap;

  @override
  State<BottomNavBarWidget> createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  @override
  Widget build(BuildContext context) {
    
      
    
    return Container(
      width: double.infinity,
      
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          
          AppColors.secondForGradient,
          Color.fromRGBO(50, 65, 65, 1),
        ],
        begin: Alignment.bottomLeft,
        end: Alignment.topRight)
      ),
      child: Container(
        margin:
            const EdgeInsets.only(bottom: 30, right: 24, left: 24, top: 16),
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
              indexPage: index, onTap: (){setState(() {
                  widget.currentIndex = index;
                  widget.onTap!(widget.currentIndex);
              });
               
              },
              selected: widget.currentIndex == index,
                    
                    
                  )),
        ),
      ),
    );
  }
}
