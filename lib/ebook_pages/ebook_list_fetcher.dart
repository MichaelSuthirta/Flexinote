import '../ebook_pages/ebook.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

Future<List<Ebook>> fetchEbooks() async{
  //Gathers data from assets folder, then creates a map
  final dataContent = await rootBundle.loadString('AssetManifest.json'); //Auto-generated json file
  final Map<String, dynamic> dataMap = json.decode(dataContent);

  final bookPaths = dataMap.keys.where(
      (name) => name.startsWith('assets/ebook_collection/') && name.endsWith('.pdf')
  ).toList();

  final List<Ebook> bookList = bookPaths.map(
          (path){
            final fileName = path.split('/').last.replaceAll('.pdf','');
            final nameComponents = fileName.split('_');

            return Ebook(
              //If the nameComponents list has 2 elements, the second one is the title
              title: nameComponents.length > 1 ? nameComponents[1] : 'No title',
              /*If the nameComponents list isn't empty, the first element is the author.
               *For now, it still can't differentiate author string and title string.
               */
              author: nameComponents.isNotEmpty ? nameComponents[0] : 'Unnamed author',
              filePath:path
            );
          }
  ).toList();

  return bookList;
}