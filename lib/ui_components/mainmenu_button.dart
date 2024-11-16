import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color color;

  const MenuButton({
    required this.text,
    this.onPressed,
    super.key,
    this.color = const Color.fromRGBO(69, 69, 69, 1),
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(25), // Smooth edges for ripple
      splashColor: Colors.white.withOpacity(0.2), // Ripple effect color
      child: Ink(
        height: 60, // Button height
        width: double.infinity, // Button width
        decoration: BoxDecoration(
          color: const Color.fromRGBO(109, 103, 228, 1), // Default button color
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
