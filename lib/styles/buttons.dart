import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      // appBar: AppBar(
      //   title: Text('MyDaily'),
      //   backgroundColor: const Color.fromARGB(255, 70, 32, 136),
      // ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Welcome! to MyDaily App'),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(46, 242, 237, 237),
                    elevation: 2,
                    shadowColor: Color.fromARGB(158, 173, 171, 171),
                    minimumSize: Size(50, 50),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                    )),
                child: Text(
                  ('Login'),
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      /*floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: () {},
        backgroundColor: Color.fromARGB(255, 28, 17, 59),
      )*/
    ));
  }
}
