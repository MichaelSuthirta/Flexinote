import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NoteIconButton extends StatefulWidget {
  const NoteIconButton({
    required this.icon,
    this.size,
    required this.onPressed,
    super.key,
  });

  final IconData icon;
  final double? size;
  final VoidCallback? onPressed;

  @override
  State<NoteIconButton> createState() => _NoteIconButtonState();
}

class _NoteIconButtonState extends State<NoteIconButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: widget.onPressed,
      icon: Icon(widget.icon),
      padding: EdgeInsets.zero,
      visualDensity: VisualDensity.compact,
      constraints: const BoxConstraints(),
      style: IconButton.styleFrom(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      iconSize: widget.size,
      color: Color(0xFF6200EE),
    );
  }
}
