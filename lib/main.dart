import 'package:flutter/material.dart';
import 'package:bmi_calculator_task/screens/calculator_screen.dart';

void main() {
  runApp(BmiApp());
}

class BmiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bmi Calculator',
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.black,
        accentColor: Colors.orange,
        sliderTheme: SliderThemeData(
          activeTrackColor: Colors.orange,
          inactiveTrackColor: Colors.orange,
          trackHeight: 2,
          thumbColor: Colors.deepOrange,
          overlayColor: Colors.orange[700]!.withAlpha(90),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: CalculatorScreen(),
    );
  }
}
