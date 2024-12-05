import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:pdfx/pdfx.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

Future<ImageProvider?> getCover(String path) async{

  //Accesses the assets folder, then loads the specified file into the system byteData file
  final fileAsByte = await rootBundle.load(path);

  //getTemporaryDirectory() is a function to get the directory for temp files
  //Creates a temporary file, where the path is 'temporaryDirectory/pdfName'.
  final tempFile = File('${(await getTemporaryDirectory()).path}/${path.split('/').last}');
  //Writes the pdf byteData into the file
  await tempFile.writeAsBytes(fileAsByte.buffer.asUint8List());

  //Opens the temporary pdf file
  final document = await PdfDocument.openFile(tempFile.path);

  //Takes the first page of the file, which is the cover
  final page = await document.getPage(1);

  //Renders the page into an image
  final coverImage = await page.render(
    width: page.width * 2,
    height: page.height * 2,
    format: PdfPageImageFormat.png,
    backgroundColor: '#ffffff'
  );

  //Closes the page to free memory
  await page.close();

  return MemoryImage(coverImage!.bytes);
}