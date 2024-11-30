import 'package:flutter/material.dart';
import 'routing.dart';
import 'layout_scaffold.dart';
import 'ui_components/mainmenu_button.dart';

class MainMenuHolder extends StatefulWidget {
  const MainMenuHolder({super.key});

  @override
  State<MainMenuHolder> createState() => _MainMenuContent();
}

class _MainMenuContent extends State<MainMenuHolder> {
  @override
  Widget build(BuildContext context) {
    return LayoutScaffold(
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  //Gap between screen edge, adjacent button and this button
                  padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
                  //Content (button)
                  child: MenuButton(
                    iconPath: "lib/ui_components/icons/notes_icon.png",
                    //Button icon
                    text: "Catatan",
                    //Button text
                    onPressed: () {
                      //action
                      Navigator.pushNamed(context, '/catatan/main');
                    },
                  )
                ),
                Container(
                  //Gap between screen edge, adjacent button and this button
                  padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
                  //Content (button)
                  child: MenuButton(
                    iconPath: "lib/ui_components/icons/book_icon.png",
                    //Button icon
                    text: "e-Book",
                    //Button text
                    onPressed: () {
                      //Directs the page to e-book main page
                      Navigator.pushNamed(context, '/ebook/main');
                    },
                  )
                ),
              ],
            )
        )
    );
  }
}
