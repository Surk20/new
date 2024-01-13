import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/models/note.dart';
import 'package:flutter_application_1/screens/mainpage.dart';

class  EditScreen extends StatefulWidget {
  final Note? note;
   EditScreen({super.key,this.note});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {

   TextEditingController _titleController = TextEditingController();
   TextEditingController _contextController = TextEditingController();

  @override
  void initState(){
    //todo: implement initstate
    if(widget.note != null){
      _titleController = TextEditingController(text: widget.note!.title);
      _contextController = TextEditingController(text: widget.note!.content);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[800],
      body: Padding(
        padding: EdgeInsets.fromLTRB(16, 40, 16, 0),
        child: Column(
          children: [
            Expanded(child: ListView(
             children: [
               TextField(
                 controller: _titleController,
                 style: TextStyle(color: Colors.white,fontSize: 30),
                 decoration: InputDecoration(
                   border: InputBorder.none,
                   hintText: 'Title',
                   hintStyle: TextStyle(color: Colors.white,fontSize: 30)),
               ),
               TextField(
                 controller: _contextController,
                 style: TextStyle(color: Colors.white,fontSize: 30),
                 maxLines: null,
                 decoration: InputDecoration(
                     border: InputBorder.none,
                     hintText: 'Add notes here',
                     hintStyle: TextStyle(color: Colors.white,fontSize: 20)),
               ),
             ],
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.pop(context,[
          _titleController.text,_contextController.text
        ]);
      },
     elevation: 10,
          backgroundColor: Colors.white54,
        child: Icon(Icons.save),
      ),
    );
  }
}
