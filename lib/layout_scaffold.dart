import 'package:flexinote/ui_components/scaffold_buttons.dart';
import 'package:flutter/material.dart';

class LayoutScaffold extends StatelessWidget {
  //To store the active content/screen
  final Widget body;
  final String? title;
  final button;
  //Constructor
  const LayoutScaffold({super.key, required this.body, this.title, this.button});

  @override
  //To create the layout
  Scaffold build(BuildContext context) {
    String screenTitle = title ?? "Flexinote";

    return Scaffold(
      appBar: AppBar(
        title: Text(screenTitle),
        actions: [],
      ),
      floatingActionButton: button,
      body: body,
    );
  }
}
