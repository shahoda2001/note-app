import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/note_provider.dart';
import 'package:flutter_application_1/screens/lunch_screen.dart';
import 'package:flutter_application_1/screens/new_note.dart';
import 'package:flutter_application_1/screens/note.dart';
import 'package:flutter_application_1/storage/db/db_provider.dart';
import 'package:provider/provider.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
    await DbProvider().initDb();
  runApp( MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<NoteProvider>(create: (_) => NoteProvider()),
      ],
      child: MyMaterialApp(),
    );
  }
}

class MyMaterialApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
          debugShowCheckedModeBanner: false,
        initialRoute: '/Lunch_Screen',
        routes: {
          '/Lunch_Screen' : (context) =>  LunchScreen(),
          '/Note_Screen' : (context) =>  NoteApp(),
          '/New_Note' : (context) =>  NewNote(),
        },
      );
  }
}