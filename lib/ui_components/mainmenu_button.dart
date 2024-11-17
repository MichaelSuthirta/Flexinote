import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  final String text; //Button text
  final VoidCallback? onPressed;
  final Color color;
  final String iconPath; //Button icon directory

  const MenuButton({
    required this.iconPath,
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
        height: 250, // Button height
        width: double.infinity, // Button width
        decoration: BoxDecoration(
          color: const Color.fromRGBO(109, 103, 228, 1), // Default button color
          borderRadius: BorderRadius.circular(25), //Smooth edges
        ),
        child:Row(
          children:[
            Container
            (
              padding: const EdgeInsets.all(20), //Icon spacing
              child:Image(image: AssetImage(iconPath)) //Icon
            ),
            Text(
              text,
              style: const TextStyle(
                fontFamily: 'Odor Mean Chey',
                color: Colors.white,
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
          ]
        )
      ),
    );
  }
}
