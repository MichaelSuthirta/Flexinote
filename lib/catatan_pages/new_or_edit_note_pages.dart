import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';
import 'note_icon_button.dart';
import 'note_icon_button_outlined.dart';

class NewOrEditNotePages extends StatefulWidget {
  const NewOrEditNotePages({super.key});

  @override
  State<NewOrEditNotePages> createState() => _NewOrEditNotePagesState();
}

class _NewOrEditNotePagesState extends State<NewOrEditNotePages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: NoteIconButtonOutlined(
            icon: FontAwesomeIcons.chevronLeft,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        title: const Text('New Notes'),
        actions: [
          NoteIconButtonOutlined(
            icon: FontAwesomeIcons.pen,
            onPressed: () {},
          ),
          NoteIconButtonOutlined(
            icon: FontAwesomeIcons.check,
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Untuk sejajarkan teks
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: TextField(
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              decoration: InputDecoration(
                hintText: 'Title Notes',
                hintStyle: const TextStyle(color: gray300),
                border: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Untuk menyebar isi row
              children: [
                const Text(
                  'Last Modified',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: gray500,
                  ),
                ),
                const Text(
                  '07 December 2023, 03:35 PM',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: gray500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Created',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: gray500,
                  ),
                ),
                const Text(
                  '06 December 2023, 03:35 PM',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: gray500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Row(
                  children: [
                    const Text(
                      'Tags',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: gray500,
                      ),
                    ),
                    NoteIconButton(
                      icon: FontAwesomeIcons.circlePlus,
                      onPressed: () {},
                    ),
                  ],
                ),
                const SizedBox(width: 16),
                const Text(
                  'No tags added',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: gray500,
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Divider(
              color: gray700,
              thickness: 2,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextField(
                maxLines: null, // Agar TextField fleksibel
                expands: true, // TextField mengisi sisa ruang
                decoration: const InputDecoration(
                  hintText: 'Type here......',
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
