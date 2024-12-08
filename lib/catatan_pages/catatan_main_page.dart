import 'package:flutter/material.dart';
import '../layout_scaffold.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
const Color primary = Color(0xFF6200EE);

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
<<<<<<< Updated upstream
        title: Text('FlexiNotes'),
        actions: [],
=======
<<<<<<< HEAD
        title: const Text('FlexiNote'),
        actions: [
        ],
=======
        title: Text('FlexiNotes'),
        actions: [],
>>>>>>> 427db07be15e6785771adca238f9c9180bffd790
>>>>>>> Stashed changes
      ),
      floatingActionButton: FloatingActionButton.large(
        onPressed: () {
          // Aksi tombol di sini
        },
<<<<<<< Updated upstream
        child: Icon(FontAwesomeIcons.plus),
      ),
=======
<<<<<<< HEAD
        child: const Icon(FontAwesomeIcons.plus), // Ikon dari FontAwesome
      ),

      body: Column(
        children: [
          TextField(
            decoration: const InputDecoration(labelText: 'Search Notes.....',
              prefixIcon: Icon(FontAwesomeIcons.magnifyingGlass),
            ),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon:const  Icon(FontAwesomeIcons.arrowDown),
=======
        child: Icon(FontAwesomeIcons.plus),
      ),
>>>>>>> Stashed changes
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Search Notes.....',
                prefixIcon: Icon(FontAwesomeIcons.magnifyingGlass),
                fillColor: Colors.white,
                filled: true,
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: primary),
                ),
<<<<<<< Updated upstream
=======
>>>>>>> 427db07be15e6785771adca238f9c9180bffd790
>>>>>>> Stashed changes
              ),
            ),
            SizedBox(height: 16), // Spasi antar elemen
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(FontAwesomeIcons.arrowDown),
                ),
                DropdownButton<String>(
                  value: dropdownValue,
                  items: dropdownOptions
                      .map(
                        (e) => DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    ),
                  )
                      .toList(),
                  onChanged: (newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                ),
                Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(FontAwesomeIcons.bars),
                ),
              ],
            ),
            SizedBox(height: 16), // Spasi antar elemen
            Expanded(
              child: GridView.builder(
                itemCount: 15,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'OOP',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text('OOPsesi11'),
                            ),
                          ],
                        ),
                        Text('Multithreading programming'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('07 Dec, 2024'),
                            Icon(
                              FontAwesomeIcons.trash,
                              color: Colors.red,
                            ),
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
      ),
    );
  }
}

