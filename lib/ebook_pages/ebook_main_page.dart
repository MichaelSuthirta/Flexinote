import 'package:flexinote/ebook_pages/ebook_scroll.dart';
import 'package:flexinote/ui_components/sidebar_button.dart';
import 'package:flexinote/ui_components/search_field.dart';
import 'package:flutter/material.dart';
import '../layout_scaffold.dart';

class EbookMainPage extends StatelessWidget{
  const EbookMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutScaffold(
        body: Column(
            children: [
              //Top area
              //Sidebar button and search box
              Row(
                  children:[
                    //Sidebar button
                    Container(
                      width: 105,
                      height: 100,
                      padding: const EdgeInsets.all(20), //Distance from edges
                      child: SidebarButton(
                        onPress: (){},
                      ),
                    ),

                    // const SearchField()

                    //Search bar placeholder
                    Container(
                        alignment: Alignment.center,
                        color: const Color.fromRGBO(190, 190, 190, 1),
                        width: 300,
                        height: 30,
                        child: const Text(
                            "Search",
                            style: TextStyle(
                                fontSize: 18
                            )
                        )
                    ),
                  ]
              ),

              //Content
              const Expanded (
                  child: EbookScroll()
              ),
            ]
        )
    );
  }
}
