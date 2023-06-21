import 'package:fl_qr_reader/providers/ui_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomNavigatorBar extends StatelessWidget {
   
  const CustomNavigatorBar({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final uiProvider = Provider.of<UiProviders>(context);
    final currenIndex =  uiProvider.selectMenuOpt;

    return BottomNavigationBar(
      onTap: (index) => uiProvider.selectMenuOpt = index,
      elevation: 0,
      currentIndex: currenIndex,
      items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Mapa'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.compass_calibration),
            label: 'Direcciones'
          )          
      ]
    );
  }
}