import 'package:flexinote/catatan_pages/new_or_edit_note_pages.dart';
import 'package:flexinote/catatan_pages/search_field.dart';
import 'package:flutter/material.dart';
// import '../constants.dart';
// import '../layout_scaffold.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'note_card.dart';
import 'note_fab.dart';
import 'note_grid.dart';
// import 'note_icon_button_outlined.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text('FlexiNotes'),
        actions: [],
      ),
      floatingActionButton: NoteFab(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NewOrEditNotePages(),
            ),
          );
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            SearchField(),
            SizedBox(height: 16), // Spasi antar elemen
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
                        isDescending = !isDescending; // Ubah nilai isDescending
                      });
                    },
                  ),
                  SizedBox(width: 16), // Spasi antar elemen
                  DropdownButton<String>(
                    value: dropdownValue,
                    icon: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Icon(
                        FontAwesomeIcons.arrowDownWideShort,
                        size: 18,
                        color: Color(0xFF616161),
                      ),
                    ),
                    underline: SizedBox.shrink(),
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
                              SizedBox(width: 8),
                              Icon(Icons.check),
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
                    icon: isDescending
                        ? FontAwesomeIcons.tableCellsLarge
                        : FontAwesomeIcons.bars,
                    size: 18,
                    onPressed: () {
                      setState(() {
                        isGrid = !isGrid; // Ubah nilai isDescending
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 16), // Spasi antar elemen
            Expanded(
              child: isGrid ? NotesGrid() : NotesList(),
            ),
          ],
        ),
      ),
    );
  }
}