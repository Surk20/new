import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/Welcome.dart';
import 'screens/Welcome.dart';
import 'screens/Loginpage.dart';
import 'screens/mainpage.dart';
import 'package:flutter_application_1/models/note.dart';
import 'screens/edit.dart';
import 'package:intl/intl.dart';
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'welcome' ,
    routes: {
      'welcome':(context)=>MyWelcome(),
      'login':(context)=>MyLoginpage(),
      'mainpage':(context)=>Mymainpage(),
    },
  ));
}


