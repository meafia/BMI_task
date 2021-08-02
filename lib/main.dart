import 'package:flutter/material.dart';
import 'package:bmi_calculator_task/screens/calculator_screen.dart';

void main() {
  runApp(BmiApp());
}

class BmiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bmi Calculator',
      theme: ThemeData.dark().copyWith(
        accentColor: Color(0xFFfcbd00),
        scaffoldBackgroundColor: Color(0xFF011627),
        sliderTheme: SliderThemeData(
          activeTrackColor: Color(0xFFfcbd00),
          inactiveTrackColor: Color(0xFFfcbd00),
          trackHeight: 2,
          thumbColor: Colors.deepOrange,
          overlayColor: Colors.deepOrange.withAlpha(90),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(Colors.deepOrange),
          ),
        ),
        radioTheme: RadioThemeData(
          splashRadius: 12,
          fillColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return Colors.deepOrange;
            }
          }),
          overlayColor: MaterialStateProperty.all<Color>(
              Color(0xFFfcbd00).withAlpha(150)),
        ),
      ),
      home: CalculatorScreen(),
    );
  }
}
