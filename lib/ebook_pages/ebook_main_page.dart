import 'package:flexinote/ui_components/sidebar_button.dart';
import 'package:flutter/material.dart';
import '../layout_scaffold.dart';

class EbookMainPage extends StatefulWidget{
  const EbookMainPage({super.key});

  @override
  State<EbookMainPage> createState() => _EbookMainPageContent();
}

class _EbookMainPageContent extends State<EbookMainPage>{
  @override
  Widget build(BuildContext context){
    return LayoutScaffold(
      body: Column(
          children: [
            Container(
              width: 105,
              height: 100,
              padding: const EdgeInsets.all(20),
              child: SidebarButton(
                onPress: (){},
              ),
            ),
            Container(
              // color: Colors.grey,
                child: Text(
                    "Test",
                    style: TextStyle(fontSize: 30)
                )
            ),
          ]
      )
    );
  }
}