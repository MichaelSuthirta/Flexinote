import 'package:flexinote/catatan_pages/new_or_edit_note_pages.dart';
//import 'package:flexinote/catatan_pages/search_field.dart';
import 'package:flexinote/change_notifier/new_note_controller.dart';
import 'package:flexinote/change_notifier/note_provider.dart';
import 'package:flexinote/models/note.dart';
import 'package:flexinote/layout_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'note_fab.dart';
import 'note_grid.dart';
import 'note_icon_button.dart';
import 'note_list.dart';

const Color primary = Color(0xFF6200EE);

class CatatanMainPage extends StatefulWidget {
  const CatatanMainPage({super.key});

  @override
  State<CatatanMainPage> createState() => _CatatanMainPageContent();
}

class _CatatanMainPageContent extends State<CatatanMainPage> {
  final List<String> dropdownOptions = ['Date modified', 'Date Created'];
  late String dropdownValue = dropdownOptions.first;
  bool isDescending = true;
  bool isGrid = true;

  @override
  Widget build(BuildContext context) {
    return LayoutScaffold(
      title: "Notes",
      button: NoteFab(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChangeNotifierProvider(
                create: (context) => NewNoteController(),
                child: const NewOrEditNotePages(
                  isNewNote: true,
                ),
              ),
            ),
          );
        },
      ),
      body: Consumer<NotesProvider>(
        builder: (context, notesProvider, child) {
          List<Note> notes = notesProvider.notes;
          return notes.isEmpty
              ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              Center(
                  child: Image.asset('assets/images/image_placeholder.png', // Tambahkan nama file gambar yang sesuai
                  width: MediaQuery.sizeOf(context).width * 0.75,
                )
              ),
              const Text(
                '\nNo notes found. Create one by pressing the plus button.',
                textAlign: TextAlign.center,
              )
            ],
          )
              : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      NoteIconButton(
                        icon: isDescending
                            ? FontAwesomeIcons.arrowDown
                            : FontAwesomeIcons.arrowUp,
                        size: 18,
                        onPressed: () {
                          setState(() {
                            isDescending = !isDescending;
                          });
                        },
                      ),
                      const SizedBox(width: 16),
                      DropdownButton<String>(
                        value: dropdownValue,
                        icon: const Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Icon(
                            FontAwesomeIcons.arrowDownWideShort,
                            size: 18,
                            color: Color(0xFF616161),
                          ),
                        ),
                        underline: const SizedBox.shrink(),
                        borderRadius: BorderRadius.circular(16),
                        isDense: true,
                        items: dropdownOptions
                            .map(
                              (e) => DropdownMenuItem(
                            value: e,
                            child: Row(
                              children: [
                                Text(e),
                                if (e == dropdownValue) ...[
                                  const SizedBox(width: 8),
                                  const Icon(Icons.check),
                                ],
                              ],
                            ),
                          ),
                        )
                            .toList(),
                        selectedItemBuilder: (context) =>
                            dropdownOptions.map((e) => Text(e)).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                      ),
                      const Spacer(),
                      NoteIconButton(
                        icon: isGrid
                            ? FontAwesomeIcons.tableCellsLarge
                            : FontAwesomeIcons.bars,
                        size: 18,
                        onPressed: () {
                          setState(() {
                            isGrid = !isGrid;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: isGrid
                      ? NotesGrid(notes: notes)
                      : NotesList(notes: notes),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
