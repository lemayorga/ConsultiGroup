
import 'package:fl_productos_app/screens/screens.dart';
import 'package:fl_productos_app/services/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
        ChangeNotifierProvider(create: (_) => ProductsService())
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowMaterialGrid: false,
      initialRoute: 'checking',
      routes: {
        'checking': ( _ ) => const CheckAuthScreen(),
        'login':(context) => const LoginScreen(),
        'register':(context) => const RegisterScreen(),
        'home':(context) => const HomeScreen(),
        'product':(context) => const ProducScreen()
      },
      scaffoldMessengerKey: NotificationsService.messengerKey,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.grey,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          color:  Colors.indigo
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.indigo,
          elevation:  0
        )
      ),
    );
  }
}