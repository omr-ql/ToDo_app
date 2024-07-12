import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String name;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;

  const Button({
    super.key,
    required this.name,
    required this.onPressed,
    required this.color,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: textColor,
        backgroundColor: color,
      ),
      child: Text(name),
    );
  }
}
