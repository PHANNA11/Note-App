import 'package:flutter/material.dart';
import 'package:note_app/model/note_model.dart';
import 'package:note_app/view/note/add_edit_note.dart';
import 'package:note_app/view/widget/note_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<NoteModel> listNode = [
    NoteModel(
      id: 12,
      name: 'Flutter Dev',
      description: 'sedrftyubnkml,;.',
      category: 'person',
      date: DateTime.now(),
      colorCode: '#F08080',
    ),
    NoteModel(
      id: 1,
      name: 'Swift Dev',
      description: 'sedrftyubnkml,;.',
      category: 'person',
      date: DateTime.now(),
      colorCode: '#FFFACD',
    ),
    NoteModel(
      id: 12,
      name: 'React native Dev',
      description: 'sedrftyubnkml,;.',
      category: 'Teamwork',
      date: DateTime.now(),
      colorCode: '#FFC0CB',
    ),
    NoteModel(
      id: 12,
      name: 'Flutter Dev',
      description: 'sedrftyubnkml,;.',
      category: 'person',
      date: DateTime.now(),
      colorCode: '#F08080',
    ),
    NoteModel(
      id: 1,
      name: 'Swift Dev',
      description: 'sedrftyubnkml,;.',
      category: 'person',
      date: DateTime.now(),
      colorCode: '#FFFACD',
    ),
    NoteModel(
      id: 12,
      name: 'React native Dev',
      description: 'sedrftyubnkml,;.',
      category: 'Teamwork',
      date: DateTime.now(),
      colorCode: '#FFC0CB',
    ),
    NoteModel(
      id: 12,
      name: 'Flutter Dev',
      description: 'sedrftyubnkml,;.',
      category: 'person',
      date: DateTime.now(),
      colorCode: '#F08080',
    ),
    NoteModel(
      id: 1,
      name: 'Swift Dev',
      description: 'sedrftyubnkml,;.',
      category: 'person',
      date: DateTime.now(),
      colorCode: '#FFFACD',
    ),
    NoteModel(
      id: 12,
      name: 'React native Dev',
      description: 'sedrftyubnkml,;.',
      category: 'Teamwork',
      date: DateTime.now(),
      colorCode: '#FFC0CB',
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(),
      appBar: AppBar(
        title: Text('Notes'),
      ),
      body: ListView.builder(
        itemCount: listNode.length,
        itemBuilder: (context, index) =>
            NoteWidget().noteWidget(note: listNode[index]),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[300],
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddEditNote(),
              ));
        },
        child: const Icon(
          Icons.add,
          size: 35,
        ),
      ),
    );
  }
}
