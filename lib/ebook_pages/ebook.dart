class Ebook{
  final String title;
  final String author;
  final String filePath;

  const Ebook({
    required this.title,
    required this.author,
    required this.filePath,
  });

  //Title getter
  String getTitle(){
    return title;
  }

  //Author getter
  String getAuthor(){
    return author;
  }

  //Path getter
  String getPath(){
    return filePath;
  }
}