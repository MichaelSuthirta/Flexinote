import 'package:flexinote/catatan_pages/new_or_edit_note_pages.dart';
import 'package:flexinote/models/note.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
const Color primary = Color(0xFF6200EE);

class NoteCard extends StatelessWidget {
  final String? title;
  const NoteCard({
    required this.note,
    required this.isInGrid,
    this.title,
    super.key,
  });
 final Note note;
  final bool isInGrid;

  @override
  Widget build(BuildContext context) {

    //If title is null, the title is "Untitled"
    String noteTitle = title ?? "Untitled";

    return GestureDetector(
        onTap : () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const NewOrEditNotePages(
            isNewNote: false, // Perbaiki ini
          ),
        ),
      );
    },
    child: Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border : Border.all(color: Color(0xFF6200EE),width: 2),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
               color: primary.withOpacity(0.5),
               offset: Offset(4,4),
             )
            ]
          ),
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            noteTitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Color(0xFF00008B)
            ),
          ),
          SizedBox(height: 4),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                3, (index) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Color(0xFFADD8E6),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 2,
                ),
                margin: EdgeInsets.only(right: 4),
                child: Text(
                  'OOPsesi11',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
              ),
              ),
            ),
          ),
          SizedBox(height: 4),
          if(isInGrid)
            Expanded(
              child: Text(
                'Multithreading programming',
                style :TextStyle(color: Colors.black),
              ),
            ) else
            Text(
              'Multithreading progamming',
              style: TextStyle(color :Colors.black),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '07 Dec, 2024',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight : FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              Icon(
                FontAwesomeIcons.trash,
                color: Colors.grey,
                size: 20,
              ),
            ],
          ),
        ],
      ),
     ),
    );
  }
}