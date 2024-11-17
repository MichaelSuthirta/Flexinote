import 'package:flexinote/ui_components/scaffold_buttons.dart';
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
        toolbarHeight: 70, //AppBar size
        elevation: 20,
        shadowColor: Colors.black,
        backgroundColor: const Color.fromRGBO(69, 60, 103, 1),
        actions: [
          ProfileButton(
            onPress: (){},
          )
        ],
      ),
      //The content area
      body: SafeArea(
        child: body //Screen content
      ),
      floatingActionButton: HomeButton(
        onPress: (){}
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked, //Home button position
      bottomNavigationBar: const BottomAppBar(
        color:  Color.fromRGBO(69, 60, 103, 1),
        shape: CircularNotchedRectangle(),
      ),
    );
  }
}