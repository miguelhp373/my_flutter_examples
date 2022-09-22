import 'dart:ffi';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    //after 3 seconds, redirect to login page

    Future.delayed(
      const Duration(seconds: 3),
    ).then(
      (_) => Navigator.of(context).pushReplacementNamed('/loginPage'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green.shade900,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
