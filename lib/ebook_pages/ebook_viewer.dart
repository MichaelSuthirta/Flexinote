import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdfx/pdfx.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flexinote/layout_scaffold.dart';
import 'dart:io';

/// Creates a temporary file to store the content of the actual files
Future<String> loadTempFile(String filePath) async{
  //Creates a temporary file, where the path is 'temporaryDirectory/pdfName'.
  final tempFile = File('${(await getTemporaryDirectory()).path}/${filePath.split('/').last}');
  //Returns the path
  return tempFile.path;
}

/// Cover fetcher
Future<ImageProvider?> getCover(String path) async{

  final String tempFilePath = await loadTempFile(path);

  //Opens the temporary pdf file
  final document = await PdfDocument.openFile(tempFilePath);

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

  //If the image isn't null, returns it
  return MemoryImage(coverImage!.bytes);
}

/// Book viewer
class BookViewer extends StatefulWidget{
  final String path;

  const BookViewer({
    super.key,
    required this.path,
  });

  @override
  State<BookViewer> createState() => _BookViewerState();
}

class _BookViewerState extends State<BookViewer>{
  PdfControllerPinch? viewer;

  void setPath () async{
    String bookPath = await loadTempFile(widget.path);
    setState((){
      viewer = PdfControllerPinch(document: PdfDocument.openFile(bookPath)); //Opens the file path
    });
    print(widget.path);
  }

  @override
  void initState(){
    super.initState();
    setPath();
  }
  //
  @override
  void dispose(){
    viewer!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    Widget loadingIndicator = const Center(
      child: CircularProgressIndicator(),
    );

    return LayoutScaffold(
      body:
        //If the controller (viewer) is null, displays loading indicator. If not, displays the pdf.
        viewer == null ? loadingIndicator : PdfViewPinch(controller: viewer!)
    );
  }
}