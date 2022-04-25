import 'package:flutter/material.dart';

class NeuButton extends StatelessWidget {
  final String child;
  // ignore: prefer_typing_uninitialized_variables
  final buttonColor;
  // ignore: prefer_typing_uninitialized_variables
  final textColor;
  // ignore: prefer_typing_uninitialized_variables
  final function;

  const NeuButton(
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
        padding: const EdgeInsets.all(12.0),
        child: Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            color: buttonColor,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.green.shade800,
                offset: const Offset(4, 4),
                blurRadius: 15,
                spreadRadius: 1,
              ),
              BoxShadow(
                color: Colors.green.shade200,
                offset: const Offset(-4, -4),
                blurRadius: 15,
                spreadRadius: 1,
              ),
            ],
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.green.shade200,
                Colors.green.shade400,
              ],
              stops: const [
                0,
                0.4,
              ],
            ),
          ),
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
    );
  }
}
