import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/mainpage.dart';
import 'package:intl/intl.dart';
class Note{
  int id;
  String title;
  String content;
  DateTime modifiedTime;
  Note({
    required this.id,
    required this.title,
    required this.content,
    required this.modifiedTime
});
}
List<Note> sampleNote = [
  Note(
      id: 0, title: "Events", content: "1.Sister's Birthday\n2.Diwali party at Office", modifiedTime: DateTime(2023,1,1,34,5),
  ),
  Note(
    id: 1, title: 'Important', content: '1.Submit project\n2.Call Doctor', modifiedTime: DateTime(2023,1,1,34,5),
  ),
  Note(
    id: 2, title: "Flashcards", content: '1.Three Greeting sentences\n2.Name five Korean greetings', modifiedTime: DateTime(2023,1,1,34,5),
  ),
  Note(
    id: 3, title: "Shopping List", content: '1.Bread and butter\n2.Vegetables', modifiedTime: DateTime(2023,1,1,34,5),
  ),
  Note(
    id: 4, title: "Bucket List", content: '1.Egypt\n2.Switzerland', modifiedTime: DateTime(2023,1,1,34,5),
  ),
  Note(
    id: 5, title: "Movies to watch", content: '1.Harry Potter\n2.Avengers', modifiedTime: DateTime(2023,1,1,34,5),
  ),
];
