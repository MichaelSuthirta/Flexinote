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
    return const LayoutScaffold(
      body: Text("Test", style: const TextStyle(fontSize: 30))
    );
  }
}