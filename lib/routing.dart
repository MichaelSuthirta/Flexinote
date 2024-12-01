import 'package:flexinote/catatan_pages/catatan_main_page.dart';
import 'package:flexinote/ebook_pages/ebook_main_page.dart';
import 'package:flutter/material.dart';
import 'main_menu.dart';

class Routes {
  //Returns definitions for strings, which are the widgets they represent
  static Map<String, WidgetBuilder> getRoute() {
    return {
      '/': (context) => const MainMenuHolder(),
      '/ebook/main': (context) => const EbookMainPage(),
      '/catatan/main': (context) => const CatatanMainPage()
    };
  }
}
