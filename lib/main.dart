import 'package:flutter/material.dart';
import 'package:bmi_calculator/BMIscreen/bmiscreen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: bmiscreen(),
    );
  }
}

