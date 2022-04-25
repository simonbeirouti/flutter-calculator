import 'package:flutter/material.dart';
import 'package:flutter_calculator/widgets/neu_button.dart';
import 'package:math_expressions/math_expressions.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String userQuestion = '';
  String userAnswer = '';
  final List buttons = [
    'C',
    'DEL',
    '%',
    '÷',
    '7',
    '8',
    '9',
    'x',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    '0',
    '.',
    '00',
    '=',
  ];

  void pressedButton(String button) {
    if (button == 'C') {
      setState(() {
        userQuestion = '';
        userAnswer = '';
      });
    } else if (button == 'DEL') {
      if (userQuestion.isEmpty) {
        userQuestion = '';
      } else {
        setState(() {
          userQuestion = userQuestion.substring(0, userQuestion.length - 1);
        });
      }
    } else if (button == '=') {
      calculateExpression();
    } else {
      setState(() {
        userQuestion += button;
      });
    }
  }

  void calculateExpression() {
    String finalQuestion;
    finalQuestion = userQuestion.replaceAll('÷', '/');
    finalQuestion = finalQuestion.replaceAll('x', '*');
    Parser p = Parser();
    Expression expression = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = expression.evaluate(EvaluationType.REAL, cm);

    setState(() {
      userAnswer = eval.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[500],
      body: Column(
        children: [
          // Display questions and answers
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 25, right: 25, top: 100),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        userQuestion,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        userAnswer,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Display the buttons
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                itemCount: buttons.length,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemBuilder: (context, index) {
                  if (index == 19) {
                    return NeuButton(
                      child: buttons[index],
                      buttonColor: Colors.green[500],
                      textColor: Colors.white,
                      function: () {
                        pressedButton(buttons[index]);
                      },
                    );
                  }
                  if (index == 0 || index == 1) {
                    return NeuButton(
                      child: buttons[index],
                      buttonColor: Colors.green[500],
                      textColor: Colors.white,
                      function: () {
                        pressedButton(buttons[index]);
                      },
                    );
                  }
                  if (index == 2 ||
                      index == 3 ||
                      index == 7 ||
                      index == 11 ||
                      index == 15) {
                    return NeuButton(
                      child: buttons[index],
                      buttonColor: Colors.green[500],
                      textColor: Colors.white,
                      function: () {
                        pressedButton(buttons[index]);
                      },
                    );
                  } else {
                    return NeuButton(
                      child: buttons[index],
                      buttonColor: Colors.green[500],
                      textColor: Colors.white,
                      function: () {
                        pressedButton(buttons[index]);
                      },
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
