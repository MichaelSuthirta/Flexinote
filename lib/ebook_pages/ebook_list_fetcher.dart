import '../ebook_pages/ebook.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

Future<List<Ebook>> fetchEbooks() async{
  //Gathers data from assets folder, then creates a mapping
  final dataContent = await rootBundle.loadString('AssetManifest.json'); //Auto-generated json file
  final Map<String, dynamic> dataMap = json.decode(dataContent);

  final bookPaths = dataMap.keys.where(
      (path) => path.startsWith('assets/ebook_collection/') && path.endsWith('.pdf')
  ).toList();

  final List<Ebook> bookList = bookPaths.map(
          (path){
            final fileName = path.split('/').last.replaceAll('.pdf','');
            final nameComponents = fileName.split('_');
            return Ebook(
              title: nameComponents.length > 1 ? nameComponents[1] : 'No title',
              author: nameComponents.isNotEmpty ? nameComponents[0] : 'Unknown author',
              filePath:path
            );
          }
  ).toList();

  return bookList;
}