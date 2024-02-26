import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Color buttonColor;
  final String text;
  final VoidCallback buttonPressed;

  const CustomButton({
    required this.buttonColor,
    required this.text,
    required this.buttonPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: buttonPressed,
      style: TextButton.styleFrom(
        backgroundColor: buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: buttonColor == Colors.grey ? Colors.white : Colors.black,
          fontSize: 24,
        ),
      ),
    );
  }
}