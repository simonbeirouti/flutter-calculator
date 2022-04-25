import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String child;
  // ignore: prefer_typing_uninitialized_variables
  final buttonColor;
  // ignore: prefer_typing_uninitialized_variables
  final textColor;
  // ignore: prefer_typing_uninitialized_variables
  final function;

  const MyButton(
      {required this.child,
      required this.buttonColor,
      required this.textColor,
      required this.function,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: 100,
            width: 100,
            color: buttonColor,
            child: Center(
              child: Text(
                child,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: textColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
