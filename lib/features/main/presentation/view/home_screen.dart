import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:keep_fit/config/router/router.gr.dart';



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
      routes: [
        DiaryRoute(),
        WeightRoute(),
        ProfileRoute()
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context); 
        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) => _setCurrentIndex(index, tabsRouter),
            currentIndex: tabsRouter.activeIndex,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.restaurant), label: 'Meals diary'),
              BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.scaleBalanced), label: 'Weight'),
              BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.person), label: 'Profile')
            ],
          ),
        );
      },
    );
  }
  void _setCurrentIndex(int index, TabsRouter tabsRouter){
    tabsRouter.setActiveIndex(index);
  }
}