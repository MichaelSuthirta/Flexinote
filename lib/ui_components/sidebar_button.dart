import 'package:flutter/material.dart';

class SidebarButton extends StatelessWidget{
  final VoidCallback? onPress;
  final Widget icon;
  final Color color;

  const SidebarButton({
    super.key,
    this.onPress,
    this.icon = const Image(image: AssetImage('lib/ui_components/icons/sidebar_icon_2.png')),
    this.color = const Color.fromRGBO(109, 103, 228, 1),
  });

  @override
  Widget build(BuildContext context){
    return InkWell(
      onTap: onPress,
      splashColor: Colors.white.withOpacity(0.2),
      borderRadius: BorderRadius.circular(10),
      child: Ink(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(109, 103, 228, 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: icon,
      )
    );
  }
}