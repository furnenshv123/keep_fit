import 'package:flutter/material.dart';
import 'package:keep_fit/features/main/presentation/widgets/model_nav_bar.dart';
import 'package:keep_fit/themes/colors.dart';

class BottomNavBarItem extends StatefulWidget {
  BottomNavBarItem({
    super.key,
    required this.item,
    required this.indexPage,
    required this.onTap,
    this.selected = false
  });

  final ModelNavBar item;
  final int indexPage;
  bool selected;
  final Function onTap;
  @override
  State<BottomNavBarItem> createState() => _BottomNavBarItemState();
}

class _BottomNavBarItemState extends State<BottomNavBarItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {widget.onTap();},
      child: Container(
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Icon(
                  widget.item.icon,
                  color: widget.selected ? Colors.white : AppColors.unselectedBarItem,
                )),
            const SizedBox(height: 3),
            Text(
              widget.item.name,
              style: TextStyle(color: widget.selected ? Colors.white : AppColors.unselectedBarItem),
            )
          ],
        ),
      ),
    );
  }
}
