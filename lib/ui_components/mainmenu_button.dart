import 'package:flutter/material.dart';

class MenuButton extends StatefulWidget{
  final String text;

  const MenuButton({required this.text, super.key});

  String getText(){
    return this.text;
  }

  @override
  State<MenuButton> createState() => _MenuButtonState();
  // Widget build(BuildContext context){
  //   return ElevatedButton(
  //     child: InkWell(
  //       onTap: (){

  //       }
  //     )
  //   );
  // }
}

class _MenuButtonState extends State<MenuButton>{
  
  Color buttonColor = Color.fromRGBO(109, 103, 228, 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: InkWell(
        onTap: (){
          setState((){
            buttonColor = Color.fromRGBO(109, 103, 228, 1);
          });
        },
        child: 
          Ink(
            //Temporary height and width
            height: 400,
            width: 1000,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25)
            )
          )
      )
      )
    );
  }
}