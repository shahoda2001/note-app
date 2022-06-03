import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/note_provider.dart';
import 'package:provider/provider.dart';
import '../widgets/note_card.dart';

class NoteApp extends StatefulWidget {
  @override
  State<NoteApp> createState() => _NoteAppState();
}

class _NoteAppState extends State<NoteApp> {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        elevation: 2,
        backgroundColor:  Colors.blueAccent,
        centerTitle: true,
        title: Text(
          'New Note',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.normal,
            fontFamily: 'Open Sans',
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Container(
          width: 60,
          height: 60,
          child:  Icon(
            Icons.add,
            size: 40,
          ),
          decoration:  BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
                colors: [Color.fromARGB(255, 177, 151, 127), Color.fromARGB(255, 171, 30, 20)],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight),
          ),
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/New_Note');
        },
      ),
      body:
          Consumer<NoteProvider>(builder: (context, NoteProvider value, child) {
        if (value.notes.isEmpty) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
              Image(image: AssetImage('images/note1.png')),
                Text(
                  'NO NOTES',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          );
        } else {
          return ListView.builder(
            itemCount: value.notes.length,
            itemBuilder: (context, index) {
              return NoteCard(
                id: value.notes[index].id,
                title: value.notes[index].title,
                content: value.notes[index].content,
                note_color: value.notes[index].note_color,
              );
            },
          );
        }
      }),
    );
  }
}
