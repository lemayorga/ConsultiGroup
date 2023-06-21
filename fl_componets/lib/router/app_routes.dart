import 'package:fl_componets/models/models.dart';
import 'package:flutter/material.dart';

import '../screens/screens.dart';

class AppRoutes {
  static const initialRoute = 'home';
  static final menuOption = <MenuOption>[
  //  MenuOption(route: 'home', icon: Icons.home, name: 'Hpme Screen', screens: const HomeScreen()),
    MenuOption(route: 'listview1', icon: Icons.list_alt, name: 'listview1 Screen', screens: const LisView1Screen()),
    MenuOption(route: 'listview2', icon: Icons.list, name: 'listview2 Screen', screens: const LisView2Screen()),
    MenuOption(route: 'alert', icon: Icons.add_alert_outlined, name: 'alert Screen', screens: const AlertScreen()),
    MenuOption(route: 'card', icon: Icons.add_alert_outlined, name: 'card Screen', screens: const CardScreen()),
    MenuOption(route: 'avatar', icon: Icons.supervised_user_circle_outlined, name: 'Circle Avatar', screens: const AvatarScreen()),
    MenuOption(route: 'animated', icon: Icons.play_circle_outline_rounded, name: 'Animate container', screens: const AnimatedScreen()),
    MenuOption(route: 'inputs', icon: Icons.input_rounded, name: 'Text Input', screens: const InputScreen()),
    MenuOption(route: 'slider', icon: Icons.slow_motion_video_rounded, name: 'Sliders && Checks', screens: const SliderScreen()),
    MenuOption(route: 'listviewbuilder', icon: Icons.build_circle_outlined, name: 'InfineteScroll & Pull to refresh', screens: const ListViewBuilderScreen()),
  ];

  // static Map<String, Widget Function(BuildContext)> routes = {
  //     'home': (BuildContext context) => const HomeScreen(),
  //     'listview1': (BuildContext context) => const LisView1Screen(),
  //     'listview2': (BuildContext context) => const LisView2Screen(),
  //     'alert': (BuildContext context) => const AlertScreen(),
  //     'card': (BuildContext context) => const CardScreen(),
  // };

 static Map<String, Widget Function(BuildContext)> getAppRoutes(){
   Map<String, Widget Function(BuildContext)> appRoutes = {};

  appRoutes.addAll({ 'home' : (BuildContext context) =>   const HomeScreen() });

  
    for (final options in menuOption) {
      appRoutes.addAll({
         options.route:(BuildContext context) =>  options.screens
      });
    }

   return appRoutes;
  }

  static Route<dynamic>  onGenerateRoute (RouteSettings setting){
    return MaterialPageRoute(
      builder: (context) => const AlertScreen()
    );
  }
}