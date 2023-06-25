import 'package:flutter/material.dart';

class ContactButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;

  const ContactButton({Key? key, required this.onPressed, required this.buttonText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: Colors.green,
        onPrimary: Colors.white,
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 32,
        ),
      ),
      child: Text(buttonText),
    );
  }
}
