import 'package:fl_componets/router/app_routes.dart';
import 'package:flutter/material.dart';

import '../theme/app_theme.dart';


class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final menuOptions = AppRoutes.menuOption;

    return  Scaffold(
      appBar:  AppBar (
        title: const Text('Home'),
      //  elevation: 0,
      ),
      body:  ListView.separated(
        itemCount: AppRoutes.menuOption.length,
        itemBuilder: (context, index) =>  ListTile(
            title:  Text(menuOptions[index].name),
            leading:  Icon(menuOptions[index].icon, color: AppTheme.primary),
            onTap: () {
                Navigator.pushNamed(context, menuOptions[index].route);
            },
        ),
        separatorBuilder:  (_, index) =>  const Divider(),
      ),
    );
  }
}