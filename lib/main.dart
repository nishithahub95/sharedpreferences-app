import 'package:flutter/material.dart';
import 'package:sharedpreferences_app/home_screen.dart';
import 'package:sharedpreferences_app/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      ),
      home:SplashScreen()
    );
  }
}

