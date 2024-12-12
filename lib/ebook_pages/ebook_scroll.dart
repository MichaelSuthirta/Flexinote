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
  late List<Ebook> bookList; //Book list, will be filled after fetching data

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<List<Ebook>>(
        future: fetchEbooks(), //Fetches the list of books
        //The content that will be created
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if(snapshot.hasData){
            bookList = snapshot.data; //Makes a list based on the data if it isn't null
            return ListView.builder(
              itemCount: bookList.length,
              itemBuilder: (BuildContext context, int index){
                return Padding(
                    padding: const EdgeInsets.fromLTRB(25, 12.5, 25, 12.5),
                    child: FutureBuilder<ImageProvider?>(
                        future: getCover(bookList[index].getPath()), //Gets cover of each book
                        builder: (context, coverSnapshot) {
                          //If the cover is still not acquired yet
                          if(coverSnapshot.connectionState == ConnectionState.waiting){
                            return EbookContainer(
                                title: bookList[index].getTitle(),
                                author: bookList[index].getAuthor(),
                                path: bookList[index].getPath(),
                                //The image parameter is null, therefore it'll use placeholder image
                                onPress: () {
                                  print(bookList[index].getPath());
                                  Navigator.pushNamed(
                                      context,
                                      '/ebook/book-content',
                                      arguments: bookList[index].getPath()
                                  );
                                }
                            );
                          }
                          //If error happens
                          if(coverSnapshot.hasError){
                            print("Error: {$coverSnapshot.error}"); //Shows error on debug log
                            return EbookContainer(
                                title: bookList[index].getTitle(),
                                author: bookList[index].getAuthor(),
                                path: bookList[index].getPath(),
                                //The image parameter is null, therefore it'll use placeholder image
                                onPress: () {}
                            );
                          }
                          //If there's no error and cover successfully fetched
                          return EbookContainer(
                              title: bookList[index].getTitle(),
                              author: bookList[index].getAuthor(),
                              path: bookList[index].getPath(),
                              cover: coverSnapshot.data, //Passes the acquired image to the argument
                              onPress: () {
                                print(bookList[index].getPath());
                                Navigator.pushNamed(
                                    context,
                                    '/ebook/book-content',
                                    arguments: bookList[index].getPath()
                                );
                              }
                          );
                        }
                    )
                );
              },
            );
          }
          //If the list has an error
          else if(snapshot.hasError){
            return Center(child: Text("Error - ${snapshot.error}"));
          }
          //If the list is empty.
          else if(!snapshot.hasData || snapshot.data!.isEmpty){
            return Center(child: Text("E-book list is empty. Directory: ${Directory.current.path}"));
          }
          //If still waiting for fetch
          else{
            return const Center(child: CircularProgressIndicator());
          }
        }
    );
  }
}