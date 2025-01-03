import 'package:flexinote/models/note.dart';
import 'package:flutter/material.dart';
import 'note_card.dart';

class NotesList extends StatelessWidget {
  const NotesList({
    required this.notes,
    super.key,
  });

  final List<Note> notes;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      clipBehavior: Clip.none,
      itemCount: notes.length,
      itemBuilder: (context, index) {
        return NoteCard(
          note: notes[index],
          isInGrid: false,
        );
      },
      separatorBuilder: (context, index) => SizedBox(height: 8),
    );
  }
}
