import 'package:flutter/material.dart';

class CGITaskSegmentedButton extends StatelessWidget {
  const CGITaskSegmentedButton({
    super.key,
    required this.text,
    required this.buttonTextStyle,
    required this.buttonStyle,
    required this.onPressed,
  });

  final String text;
  final TextStyle buttonTextStyle;
  final ButtonStyle buttonStyle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: buttonStyle,
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Text(
          text,
          style: buttonTextStyle,
        ),
      ),
    );
  }
}
