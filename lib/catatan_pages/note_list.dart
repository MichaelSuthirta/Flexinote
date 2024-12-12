import 'package:flutter/material.dart';
import 'note_card.dart';

class  NotesList extends StatefulWidget {
  const NotesList({super.key});

  @override
  State<NotesList> createState() => _NotesListState();
}

class _NotesListState extends State<NotesList> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      clipBehavior: Clip.none,
      itemCount: 3,
      itemBuilder: (context, index) {
        return NoteCard(
          isInGrid: false,
          title: "OOP Sesi 11"
        );
      },
      separatorBuilder: (context, index) => SizedBox(height: 8),
    );
  }
}