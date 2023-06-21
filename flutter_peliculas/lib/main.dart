import 'package:flutter/material.dart';
import 'package:flutter_peliculas/providers/movies_providers.dart';
import 'package:provider/provider.dart';
import 'package:flutter_peliculas/screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Peliculas  Demo',
      initialRoute: 'home',
      routes: {
        'home': (_) => const HomeScreen(),
        'details': (_) => const DetailsScreen(),
      },
      theme: ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(
          color: Colors.indigo
        )
      ),
    );
  }
}


class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
     providers:[
        ChangeNotifierProvider(create: (_) => MoviesProviders(), lazy:  false),
     ]
    );
  }
}