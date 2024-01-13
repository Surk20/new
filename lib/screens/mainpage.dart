import 'package:flutter_application_1/models/note.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/models/note.dart';
import 'package:flutter_application_1/screens/edit.dart';
import 'package:intl/intl.dart';
import 'package:flutter_application_1/screens/edit.dart';
class Mymainpage extends StatefulWidget {
  const Mymainpage({super.key});

  @override
  State<Mymainpage> createState() => _MymainpageState();
}

class _MymainpageState extends State<Mymainpage> {
  List<Note> filteredNotes =[];

  @override
  void initState(){
    super.initState();
    filteredNotes = sampleNote;
  }
  void onSearchTextChanged(String searchText){
    setState(() {
      filteredNotes = sampleNote.where((note) => note.content.toLowerCase().contains(searchText.toLowerCase())
          || note.title.toLowerCase().contains(searchText.toLowerCase())).toList();
    });
  }
  void deleteNote(int index){
    setState(() {
      filteredNotes.removeAt(index);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image:
              AssetImage('assets/Wallpaper_idea.jpeg'),
              fit: BoxFit.cover)),
        child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          child: Padding(
            padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.10,
                right: 35,
                left: 35),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    Text("Today's essentials",style: TextStyle(fontSize: 30,color: Colors.black54),),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  onChanged: onSearchTextChanged,
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade50,
                    filled: true,
                    hintText: 'Search',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40)),prefixIcon: Icon(Icons.search,),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Expanded(
                    child: ListView.builder(
                  itemCount: filteredNotes.length,
                  itemBuilder: (context , index){
                    return Card(
                      color: Colors.white70,
                      elevation: 5,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: EdgeInsets.all(9.0),
                        child: ListTile(
                          onTap: () async {
                            final result = await Navigator.push(context,
                              MaterialPageRoute(builder: (BuildContext context) => EditScreen(note: filteredNotes[index],),

                              ),
                            );
                            if (result !=null){
                              setState(() {
                                int originalIndex = sampleNote.indexOf(filteredNotes[index]);
                                sampleNote[originalIndex]=
                                    Note(id: sampleNote[originalIndex].id,
                                        title: result[0],
                                        content: result[1],
                                        modifiedTime: DateTime.now());
                                
                                filteredNotes[index] =
                                    Note(id: filteredNotes[index].id,
                                    title: result[0],
                                    content: result[1],
                                    modifiedTime: DateTime.now());
                              });

                            }
                          },
                          title: RichText(
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            text: TextSpan(text: '${filteredNotes[index].title} \n',
                            style: TextStyle(
                              color: Colors.lightGreen[800],fontWeight: FontWeight.bold,fontSize: 25,height: 2
                          ),
                          children: [
                            TextSpan(text: filteredNotes[index].content,
                            style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                              height: 1.5
                            ),),
                          ],),
                          ),
                          subtitle: Padding(padding: EdgeInsets.only(top: 8.0),
                          child: Text(
                           'Edited: ${DateFormat('EEE MMM d, yyyy h:mm a').format(filteredNotes[index].modifiedTime)}',
                           style: TextStyle(fontSize: 10,
                           fontStyle: FontStyle.italic,color: Colors.grey.shade800),
                          )),
                          trailing: IconButton(onPressed: ()async{
                            final result = await showDialog(context: context, builder: (BuildContext context){
                              return AlertDialog(
                               backgroundColor: Colors.white70,
                                icon: Icon(Icons.info,color: Colors.white,),
                                title: Text('Do you want to delete this note?',
                                  style: TextStyle(color: Colors.black54),),
                                content: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    ElevatedButton(onPressed: (){
                                     Navigator.pop(context,true);
                                    },style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                                      child: SizedBox(width: 60,
                                      child:Text('Yes',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black54),),
                              ),),
                                    ElevatedButton(onPressed: (){
                                      Navigator.pop(context,false);
                                    },style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                                      child: SizedBox(width: 60,
                                        child:Text('No',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(color: Colors.black54),),
                                      ),
                                    )
                                  ],

                                ),
                              );
                            });
                            if(result){
                              deleteNote(index);
                            }

                          }, icon: Icon(Icons.delete,size: 28,)),
                        ),
                      ),
                    );
                  },
                ))
              ],
            ),
          ),
        ),
      floatingActionButton: FloatingActionButton(onPressed: ()async{
      final result = await Navigator.push(context,
      MaterialPageRoute(builder: (BuildContext context) => EditScreen(),
      ),
      );
      if (result !=null){
        setState(() {
          sampleNote.add(
              Note(id: sampleNote.length, title: result[0], content: result[1], modifiedTime: DateTime.now())
          );
          filteredNotes = sampleNote;
        });

      }
      },
        backgroundColor: Colors.lightGreen[800],child: Icon(Icons.add,color: Colors.white,),
      ),
        ),
    );
  }
}
