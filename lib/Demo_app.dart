import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //Statelesswidgets will allow us to import all files.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text('MyDaily'),
            backgroundColor: const Color.fromARGB(255, 70, 32, 136),
          ),
          body: Center(
            child: Ink(
              decoration:
                  ShapeDecoration(shape: CircleBorder(), color: Colors.amber),
              child: IconButton(
                icon: Icon(Icons.android),
                onPressed: () {},
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.arrow_back),
            onPressed: () {},
            backgroundColor: Color.fromARGB(255, 28, 17, 59),
          ),
          /*for back button */
        ));
  }
}
