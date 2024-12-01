import 'package:flutter/material.dart';
import '../ui_components/ebook_container.dart';

class EbookScroll extends StatefulWidget{
  const EbookScroll({super.key});

  @override
  State<EbookScroll> createState() => _EbookScrollContent();
}

class _EbookScrollContent extends State<EbookScroll>{
  @override
  Widget build(BuildContext context){
    return Container(
        padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
        child: EbookContainer(
          onPress: (){},
          title: "The Past, Present, and The Future: Journey of Penacony and the Trailblaze",
          author: "test",
        )
    );
  }
}