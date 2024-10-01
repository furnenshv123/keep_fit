import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:keep_fit/config/router/router.gr.dart';
import 'package:keep_fit/themes/colors.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: [DiaryRoute(), WeightRoute(), AuthRoute()],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
            body: child,
            bottomNavigationBar: Container(
              margin: EdgeInsets.only(bottom: 30, right: 24, left: 24, top: 16),
              height: 63,
              decoration: const BoxDecoration(
                  color: AppColors.blackAppColor,
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  border: Border(
                      top: BorderSide(color: AppColors.bordersColor, width: 3),
                      left: BorderSide(color: AppColors.bordersColor, width: 3),
                      right:
                          BorderSide(color: AppColors.bordersColor, width: 3),
                      bottom:
                          BorderSide(color: AppColors.bordersColor, width: 3))),
              child: Placeholder(),
            ));
      },
    );
  }

  void _setCurrentIndex(int index, TabsRouter tabsRouter) {
    tabsRouter.setActiveIndex(index);
  }
}

// BottomNavigationBar(
//             onTap: (index) => _setCurrentIndex(index, tabsRouter),
//             currentIndex: tabsRouter.activeIndex,
//             items: [
//               BottomNavigationBarItem(icon: Icon(Icons.restaurant), label: 'Meals diary'),
//               BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.scaleBalanced), label: 'Weight'),
//               BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.person), label: 'Profile')
//             ],
//           ),