import 'package:flutter/material.dart';
import '../layout_scaffold.dart';

class CatatanMainPage extends StatefulWidget {
  const CatatanMainPage({super.key});

  @override
  State<CatatanMainPage> createState() => _CatatanMainPageContent();
}

class _CatatanMainPageContent extends State<CatatanMainPage> {
  @override
  Widget build(BuildContext context) {
    return const LayoutScaffold(
        body: Text("ini main page cacatan ",
            style: const TextStyle(fontSize: 200)));
  }
}
