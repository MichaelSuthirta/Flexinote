import 'package:flutter/material.dart';
import '../layout_scaffold.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CatatanMainPage extends StatefulWidget {
  const CatatanMainPage({super.key});

  @override
  State<CatatanMainPage> createState() => _CatatanMainPageContent();
}

class _CatatanMainPageContent extends State<CatatanMainPage> {
  final List<String> dropdownOptions = ['Date modified', 'Date Created'];
  late String dropdownValue = dropdownOptions.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FlexiNotes'),
        actions: [
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Aksi tombol di sini
        },
        child: Icon(FontAwesomeIcons.plus), // Ikon dari FontAwesome
      ),

      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(labelText: 'Search Notes.....',
              prefixIcon: Icon(FontAwesomeIcons.magnifyingGlass),
            ),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(FontAwesomeIcons.arrowDown),
              ),
              DropdownButton(
                value: dropdownValue,
                items: dropdownOptions
                    .map(
                      (e) => DropdownMenuItem(
                      value: e,
                      child: Text(e)
                  ),
                )
                    .toList(),
                onChanged: (newValue){
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
              ),
              Spacer(),
              IconButton(onPressed: () {}, icon: Icon(FontAwesomeIcons.bars),
              ),
            ],
          ),
          Expanded(
            child: GridView.builder(
              itemCount: 15,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
              ),
              itemBuilder: (context, int index) {
                return Container(child: Column(children: [Text('Judul notes'),
                  Row(children: [Container(child: Text('OOPsesi11'),
                  ),
                  ],
                  ),
                  Text('Multithreading programming'),
                  Row(children:[Text('07 Dec, 2024'),
                    Icon(FontAwesomeIcons.trash),
                  ],
                  ),
                ],
                ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

