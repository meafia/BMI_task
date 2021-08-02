import 'package:flutter/material.dart';
import 'package:bmi_calculator_task/calculator.dart';
import 'dart:math';

enum Gender { male, female }

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  Gender? gender = Gender.male;
  double height = 180;
  double weight = 80;

  double customPadding = 10;

  Widget? resultWidget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: Center(
          child: Text(
            'Bmi Calculator',
            style: TextStyle(fontSize: 25),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
        child: Column(
          children: [
            Flexible(
              flex: 2,
              fit: FlexFit.tight,
              child: Container(
                child: Column(
                  children: [
                    Text('Height ( ${height.toInt()}cm )'),
                    Slider(
                      value: height,
                      min: 120,
                      max: 200,
                      onChanged: (value) {
                        setState(() {
                          height = value;
                        });
                      },
                    ),
                    Text('Weight ( ${weight.toInt()}kg )'),
                    Slider(
                      value: weight,
                      min: 50,
                      max: 130,
                      onChanged: (value) {
                        setState(() {
                          weight = value;
                        });
                      },
                    ),
                    Text('Gender'),
                    ListTile(
                      leading: Radio<Gender>(
                        value: Gender.male,
                        groupValue: gender,
                        onChanged: (Gender? value) {
                          setState(() {
                            gender = value;
                          });
                        },
                      ),
                      title: Text('male'),
                    ),
                    ListTile(
                      leading: Radio<Gender>(
                        value: Gender.female,
                        groupValue: gender,
                        onChanged: (Gender? value) {
                          setState(() {
                            gender = value;
                          });
                        },
                      ),
                      title: Text('female'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Calculator calc = Calculator(
                            height: height.toInt(), weight: weight.toInt());
                        setState(
                          () {
                            resultWidget = Container(
                              width: 600,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text: 'your BMI is  ',
                                      style: TextStyle(fontSize: 22),
                                      children: [
                                        TextSpan(
                                          text: calc.calculateBMI(),
                                          style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF011627),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    calc.getResult(),
                                    style: TextStyle(fontSize: 22),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    calc.getInteroretation(),
                                    style: TextStyle(fontSize: 22),
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: Text('Calculate'),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    customPadding = Random().nextDouble() * 30;
                  });
                },
                child: AnimatedPadding(
                  duration: Duration(seconds: 1),
                  padding: EdgeInsets.all(customPadding),
                  child: Container(
                    color: Colors.amber,
                    child: Center(
                      child: resultWidget ??
                          Text(
                            'Press Calculate button',
                            style: TextStyle(fontSize: 40),
                            textAlign: TextAlign.center,
                          ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
