import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_diseno/screens/screens.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      title: 'Material App',
      initialRoute: 'home_screen',
      routes: {
          'basic_design': (BuildContext context) => const BasiDesignScreen(),
          'scroll_design': (BuildContext context) => const ScrollScreen(),
          'home_screen': (BuildContext context) => const HomeScreen()
      } ,
    );
  }
}




