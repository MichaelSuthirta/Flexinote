import 'package:flutter/material.dart';
import '../ui_components/ebook_container.dart';
import 'ebook_list_fetcher.dart';
import 'ebook.dart';
import 'ebook_viewer.dart';
import 'dart:io';

class EbookScroll extends StatefulWidget{
  const EbookScroll({super.key});

  @override
  State<EbookScroll> createState() => _EbookScrollContent();
}

class _EbookScrollContent extends State<EbookScroll>{
  late Future<List<Ebook>> bookList;

  @override
  void initState(){
    super.initState();
    bookList = fetchEbooks();
  }

  @override
  Widget build(BuildContext context) {
    // return Container(
    //     padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
    //     child: EbookContainer(
    //       onPress: (){},
    //       title: "The Past, Present, and The Future: How Our Experiences Shape Our Life",
    //       author: "test",
    //     )
    // );
    return FutureBuilder<List<Ebook>>(
        future: bookList,
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator());
          }
          else if(snapshot.hasError){
            return Center(child: Text("Error - ${snapshot.error}"));
          }
          else if(!snapshot.hasData || snapshot.data!.isEmpty){
            return Center(child: Text("E-book list is empty. Directory: ${Directory.current.path}"));
          }
          else{
            final eBookList = snapshot.data!;
            return ListView.builder(
              itemCount: eBookList.length,
              itemBuilder: (context, index){
                return Padding(
                  padding: const EdgeInsets.fromLTRB(25, 12.5, 25, 12.5),
                  child: FutureBuilder<ImageProvider?>(
                    future: getCover(eBookList[index].getPath()),
                    builder: (context, coverSnapshot) {
                      if(coverSnapshot.connectionState == ConnectionState.waiting || coverSnapshot.hasError){
                        if(coverSnapshot.hasError){
                          print("Error: {$coverSnapshot.error}");
                        }
                        return EbookContainer(
                            title: eBookList[index].getTitle(),
                            author: eBookList[index].getAuthor(),
                            path: eBookList[index].getPath(),
                            onPress: () {}
                        );
                      }
                      return EbookContainer(
                          title: eBookList[index].getTitle(),
                          author: eBookList[index].getAuthor(),
                          path: eBookList[index].getPath(),
                          cover: coverSnapshot.data,
                          onPress: () {}
                      );
                    }
                  )
                );
              },
            );
          }
        }
    );
  }
}