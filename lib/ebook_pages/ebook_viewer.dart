import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdfx/pdfx.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flexinote/layout_scaffold.dart';
import 'dart:io';

/// Cover fetcher
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

  Future<String> loadTempFile(String filePath) async{
    final data = await rootBundle.load(widget.path);

    //Creates a temporary file, where the path is 'temporaryDirectory/pdfName'.
    final tempFile = File('${(await getTemporaryDirectory()).path}/${widget.path.split('/').last}');
    //Writes the pdf byteData into the file
    await tempFile.writeAsBytes(data.buffer.asUint8List());

    //Returns the path
    return tempFile.path;
  }
  //
  void setPath () async{
    String bookPath = await loadTempFile(widget.path);
    setState((){
      viewer = PdfControllerPinch(document: PdfDocument.openFile(bookPath));
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
    // if(viewer != null) {
      viewer!.dispose();
    // }
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    Widget loadingIndicator = const Center(
      child: CircularProgressIndicator(),
    );

    return LayoutScaffold(
      body:
        viewer == null ? loadingIndicator : PdfViewPinch(controller: viewer!)
    );
  }
}