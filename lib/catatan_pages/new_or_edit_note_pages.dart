import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../change_notifier/new_note_controller.dart';
import '../constants.dart';
import 'note_icon_button.dart';
import 'note_icon_button_outlined.dart';

class NewOrEditNotePages extends StatefulWidget {
  const NewOrEditNotePages({
    required this.isNewNote,
    super.key,
  });

  final bool isNewNote;

  @override
  State<NewOrEditNotePages> createState() => _NewOrEditNotePagesState();
}

class _NewOrEditNotePagesState extends State<NewOrEditNotePages> {
  late final NewNoteController newNoteController;
  late final FocusNode focusNode;
  late bool readOnly;

  @override
  void initState() {
    super.initState();

    newNoteController = context.read<NewNoteController>();

    focusNode = FocusNode();

    if (widget.isNewNote) {
      focusNode.requestFocus();
      newNoteController.readOnly = false;
    } else {
      newNoteController.readOnly = true;
    }
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: NoteIconButtonOutlined(
            icon: FontAwesomeIcons.chevronLeft,
            onPressed: () {
              Navigator.maybePop(context);
            },
          ),
        ),
        title: Text(widget.isNewNote ? 'New Notes' : 'Edit Note'),
        actions: [
          Selector<NewNoteController, bool>(
            selector: (context, newNoteController) => newNoteController.readOnly,
            builder: (context, readOnly, child) => NoteIconButtonOutlined(
              icon: readOnly ? FontAwesomeIcons.pen : FontAwesomeIcons.bookOpen,
              onPressed: () {
                setState(() {
                  this.readOnly = !this.readOnly;

                  if (this.readOnly) {
                    FocusScope.of(context).unfocus();
                  } else {
                    focusNode.requestFocus();
                  }
                });
              },
            ),
          ),
          NoteIconButtonOutlined(
            icon: FontAwesomeIcons.check,
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              decoration: const InputDecoration(
                hintText: 'Title Notes',
                hintStyle: TextStyle(color: gray300),
                border: InputBorder.none,
              ),
              readOnly: readOnly,
            ),
            if (!widget.isNewNote)
              ...[
                const Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Text(
                        'Last Modified',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: gray500,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Text(
                        '07 December 2023, 03:35 PM',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: gray500,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Text(
                        'Created',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: gray500,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Text(
                        '06 December 2023, 03:35 PM',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: gray500,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Row(
                        children: [
                          Text(
                            'Tags',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: gray500,
                            ),
                          ),
                          const SizedBox(width: 8),
                          NoteIconButton(
                            icon: FontAwesomeIcons.circlePlus,
                            onPressed: () {
                              // Tambahkan logika untuk menambahkan tag
                            },
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Row(
                        children: [
                          const Text(
                            'No tags added',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          NoteIconButton(
                            icon: FontAwesomeIcons.circlePlus,
                            onPressed: () {
                              // Tambahkan logika untuk menambahkan tag
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Divider(
                color: gray700,
                thickness: 2,
              ),
            ),
            TextField(
              focusNode: focusNode,
              decoration: const InputDecoration(
                hintText: 'Note here......',
                border: OutlineInputBorder(),
              ),
              readOnly: readOnly,
              maxLines: null,
              keyboardType: TextInputType.multiline,
            ),
          ],
        ),
      ),
    );
  }
}
