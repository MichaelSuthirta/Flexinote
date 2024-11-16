import 'package:flutter/material.dart';

class HomeButton extends StatelessWidget{
  final Color color;
  final Widget icon;
  final VoidCallback? onPress;

  const HomeButton({super.key, 
                    this.onPress, 
                    this.color = const Color.fromRGBO(109, 103, 228, 1), 
                    this.icon = const Image(image: AssetImage('lib/ui_components/icons/home_icon.png'))
                    });

  @override
  Widget build(BuildContext context){
    return InkWell(
      customBorder: const CircleBorder(), //Makes the button circular
      onTap: onPress, //Action on button tap
      splashColor: Colors.white.withOpacity(0.2), //Ripple effect color
      child: Ink(
        height:120,
        width:120,
        decoration: const ShapeDecoration(
          shape: CircleBorder(
            //White border around button
            side: BorderSide(color: Colors.white, width: 5)
          ),
          color: Color.fromRGBO(109, 103, 228, 1),
          ),
          child:
          Center(child: icon)
      )
    );
  }
}