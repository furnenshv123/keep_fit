import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:keep_fit/config/router/router.gr.dart';
import 'package:keep_fit/features/main/presentation/widgets/bottom_nav_bar_widget.dart';
import 'package:keep_fit/features/main/presentation/widgets/main_logo_app.dart';
import 'package:keep_fit/features/main/presentation/widgets/model_nav_bar.dart';
import 'package:keep_fit/icons/app_icons.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: [DiaryRoute(), WeightRoute(), AuthNavigationRoute()],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        const ListOfIcons = [
          AppIcons.vector__1_,
          AppIcons.weight,
          AppIcons.user_outline
        ];
        const  listOfModels = [
          ModelNavBar(icon: AppIcons.vector__1_, name: 'Diary'),
          ModelNavBar(icon: AppIcons.weight, name: 'Weight'),
          ModelNavBar(icon: AppIcons.user_outline, name: 'Profile'),
        ];
        int selectedIndex = tabsRouter.activeIndex;
        return Scaffold(
            appBar: const PreferredSize(preferredSize: Size(double.infinity, 150), child:  MainLogoApp()),
            body: child,
            extendBody: true,
            extendBodyBehindAppBar: true,
            bottomNavigationBar: BottomNavBarWidget(
                items: listOfModels,
                onTap: (value) {
                  selectedIndex = value;
                  _setCurrentIndex(selectedIndex, tabsRouter);
                },
                currentIndex: selectedIndex));
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
