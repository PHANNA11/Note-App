import 'package:flutter/material.dart';
import 'package:note_app/model/note_model.dart';
import 'package:note_app/utility/database/NoteDataCon.dart';
import 'package:note_app/view/note/add_edit_note.dart';
import 'package:note_app/view/widget/note_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<NoteModel> listNode = [];
  getDataBase() async {
    await NoteDataCon().getNote().then((value) {
      setState(() {
        listNode = value;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataBase();
  }

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
