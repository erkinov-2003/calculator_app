import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback buttonPressed;
  final Color buttonColor;
  final Color textColor;
  final bool isSelected;

  const CustomButton({
    required this.text,
    required this.buttonPressed,
    Key? key,
    required this.buttonColor,
    required this.textColor,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: buttonPressed,
      child: AnimatedContainer(
        duration: const Duration(seconds: 200),
        height: size.height * 0.100,
        width: size.height * 0.216,
        decoration: BoxDecoration(
          color: buttonColor,
          shape: BoxShape.circle,
          boxShadow: isSelected ? [
            const BoxShadow(
              color: Colors.grey,
              offset: Offset(7, 7),
              blurRadius: 15,
            ),
            const BoxShadow(
              color: Colors.white,
              blurRadius: 15,
              offset: Offset(-7, -7),
            ),
          ]: null,
        ),
        child: Center(
          child: Text(
            text,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: textColor,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
      ),
    );
  }
}
