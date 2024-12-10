import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// const Color primary = Color(0xFF6200EE);
import '../constants.dart';

class NoteFab extends StatelessWidget {
  const NoteFab({
    required this.onPressed,
    super.key,
  });

  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            offset: Offset(4,4),
          ),
        ],
      ),
      child: FloatingActionButton(
        onPressed:onPressed,
        child: Icon(FontAwesomeIcons.plus),
        backgroundColor: Color(0xFF6200EE),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
              color: Colors.black
          ),
        ),
      ),
    );
  }
}