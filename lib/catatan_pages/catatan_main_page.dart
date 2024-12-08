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
        title: Text('FlexiNotes'),
        actions: [],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Aksi tombol di sini
        },
        child: Icon(FontAwesomeIcons.plus),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                  hintText: 'Search Notes.....',
                  hintStyle: TextStyle(fontSize: 12),
                  prefixIcon: Icon(FontAwesomeIcons.magnifyingGlass),
                  fillColor: Colors.white,
                  filled: true,
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                  prefixIconConstraints: BoxConstraints(
                    minWidth: 42,
                    minHeight: 42,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: primary,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: primary,
                      )
                  )
              ),
            ),
            SizedBox(height: 16), // Spasi antar elemen
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(FontAwesomeIcons.arrowDown),
                    padding: EdgeInsets.zero,
                    visualDensity: VisualDensity.compact,
                    constraints: BoxConstraints(),
                    style: IconButton.styleFrom(tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    iconSize: 18,
                    color: Color(0xFF616161),
                  ),
                  SizedBox(width: 16),
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
                    isDense: true ,
                    items: dropdownOptions
                        .map(
                          (e) => DropdownMenuItem(
                        value: e,
                        child: Row(
                          children: [
                            Text(e),
                            if(e == dropdownValue ) ...[
                              SizedBox(width: 8),
                              Icon(Icons.check),
                            ],
                          ],
                        ),
                      ),
                    )
                        .toList(),
                    selectedItemBuilder:(context) =>
                        dropdownOptions.map((e) => Text(e)).toList(),
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
                itemBuilder: (context, int index) {
                  return Container(
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
                          'Object Oriented Programming',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Color(0xFF00008B)
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(3, (index) => Container(
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
                        Expanded(child: Text('Multithreading programming',
                          style :TextStyle(color: Colors.black),
                        ),
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

