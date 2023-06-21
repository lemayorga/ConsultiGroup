import 'package:fl_qr_reader/pages/home_page.dart';
import 'package:fl_qr_reader/pages/mapa_page.dart';
import 'package:fl_qr_reader/providers/scan_list_provider.dart';
import 'package:fl_qr_reader/providers/ui_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return  MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) =>  UiProviders()),
         ChangeNotifierProvider(create: (_) =>  ScanListProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QR reader',
        initialRoute: 'home',
        routes: {
            'mapa': (BuildContext context) => const MapaPage(),
            'home': (BuildContext context) => const HomePage()
        } ,
        theme: ThemeData(
          primaryColor:  Colors.deepPurple,
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Colors.deepPurple
          )
        )
      ),
    );
  }
}

