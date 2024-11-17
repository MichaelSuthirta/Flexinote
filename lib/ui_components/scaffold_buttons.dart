import 'package:flutter/material.dart';

class HomeButton extends StatelessWidget{
  final Color color;
  final Widget icon; //Image must be within a widget, therefore Widget is used
  final VoidCallback? onPress;

  const HomeButton({super.key, 
                    this.onPress, 
                    this.color = const Color.fromRGBO(109, 103, 228, 1), 
                    this.icon = const Image(image: AssetImage('lib/ui_components/icons/home_icon.png')),
                    });

  @override
  Widget build(BuildContext context){
    return InkWell(
      customBorder: const CircleBorder(), //Makes the button circular
      onTap: onPress, //Action on button tap
      splashColor: Colors.white.withOpacity(0.2), //Ripple effect color
      child: Ink(
        height:120, //Button height
        width:120, //Button width
        decoration: const ShapeDecoration(
          shape: CircleBorder(
            //White border around button
            side: BorderSide(color: Colors.white, width: 5)
          ),
          color: Color.fromRGBO(109, 103, 228, 1),
        ),
        child:
        Center(child: icon) //Home icon
      )
    );
  }
}

class ProfileButton extends StatelessWidget{
  final Widget icon;
  final VoidCallback? onPress;

  const ProfileButton({
    super.key,
    this.icon = const Image(image: AssetImage('lib/ui_components/icons/profile_icon.png')),
    this.onPress
  });

  @override
  Widget build(BuildContext context){
    return InkWell(
      onTap: onPress,
      borderRadius: BorderRadius.circular(5),
      splashColor: Colors.white.withOpacity(0.2),
      child: Ink(
        width: 50, //Button width
        height: 50, //Button height
        padding: const EdgeInsets.fromLTRB(0, 0, 10, 0), //Gives left padding
        child: Center(child: icon), //Button icon
      )
    );
  }
}