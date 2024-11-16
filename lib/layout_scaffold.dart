import 'package:flutter/material.dart';

class LayoutScaffold extends StatelessWidget{
  //To store the active content/screen
  final Widget body;

  //Constructor
  const LayoutScaffold({super.key, required this.body});

  @override
  //To create the layout
  Scaffold build(BuildContext context){
    return Scaffold(
      //The top bar
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(69, 60, 103, 1),
      ),
      //The content area
      body: SafeArea(
        child: body
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromRGBO(69, 60, 103, 1),
        items: const<BottomNavigationBarItem>[]
        )
    );
  }
}