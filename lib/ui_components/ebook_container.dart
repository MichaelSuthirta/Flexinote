import 'package:flutter/material.dart';

class EbookContainer extends StatelessWidget{
  //For display
  final String title, author, path;
  final String? src; // Source for cover
  final ImageProvider? cover; //If the cover is directly from an image

  //For button press
  final VoidCallback? onPress;

  const EbookContainer({
    super.key,
    required this.title,
    required this.author,
    required this.path,
    this.src, // For path string
    this.cover, // For image
    this.onPress,
  });

  @override
  Widget build(BuildContext context){

    //Create a string for image source. If src is null, uses default image.
    // ?? = if null
    String coverSource = src ?? "lib/ui_components/images/image_placeholder.png";
    //If cover image is null, uses the String path.
    ImageProvider coverImage = cover ?? AssetImage(coverSource);

    //Return the e-book box
    return InkWell(
          borderRadius: BorderRadius.circular(25), // Rounded edge
          onTap: onPress,
          splashColor: Colors.white.withOpacity(0.2),
          child: Ink(
            width: double.infinity,
            height: 300,
            // Color and rounded edge
            decoration: BoxDecoration(
              color: const Color.fromRGBO(211, 208, 252, 1),
              borderRadius: BorderRadius.circular(25), // Rounded edge
            ),
            //Content
            child: Container(
              padding: const EdgeInsets.all(20), // Padding for content
              child: Column(
                children: [
                  //Picture
                  SizedBox(
                    width: double.infinity, //Image width is maximized to the box width (including padding)
                    height: 170, //Image height
                    child: Image(
                      image: coverImage,
                      fit: BoxFit.fitWidth, //Crops the image to the box width
                    ),
                  ),
                  //Title
                  Container (
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                    child: Text(
                        title,
                        style: const TextStyle(
                          fontFamily: "Paprika",
                          fontSize: 22,
                        ),
                        overflow: TextOverflow.ellipsis, //Replacing overflowing text with '...'
                    )
                  ),
                  //Author
                  Container (
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
                    child: Text(
                      author,
                      style: const TextStyle(
                        fontFamily: "Paprika",
                        fontSize: 18,
                      ),
                      overflow: TextOverflow.ellipsis, //Replacing overflowing text with '...'
                    )
                  ),
                ],
              )
            )
          )
    );
  }
}