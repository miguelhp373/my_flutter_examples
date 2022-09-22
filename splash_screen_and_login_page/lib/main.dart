import 'package:flutter/material.dart';
import 'package:splash_screen_and_login_page/pages/login_page.dart';
import 'package:splash_screen_and_login_page/pages/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Sample SplashScreen and Login Page',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/splash',
        routes: {
          '/splash': (_) => const SplashScreen(),
          '/loginPage': (_) => const LoginPage(),
        });
  }
}
