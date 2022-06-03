import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/note.dart';

class LunchScreen extends StatefulWidget {
  @override
  _LunchScreenState createState() => _LunchScreenState();
}

class _LunchScreenState extends State<LunchScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 7), () {
      Navigator.pushReplacementNamed(context, '/Note_Screen');
    });
  }

  
  
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
         child: Column(
          children: [
            SizedBox(height: 30,)
            ,
             Container(
               width: double.infinity,
               height: 200,
               
               child: Center(child: Text("Up Note",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40,fontFamily: 'Open Sans'),)),
             ),
                         SizedBox(height: 60,),

                     ElevatedButton(
               onPressed: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context) {
                   return  NoteApp();
                 },));},
               child: Text('Get Started'),
               style: ElevatedButton.styleFrom(
                 minimumSize: Size(double.infinity, 60),
                 primary: Color(0xff1321E0),
                 shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.all(
                     Radius.circular(15),
                   ),
                 ),
               ),
             ),
            
           ],
         ),
       ),
     );
   }
 }

