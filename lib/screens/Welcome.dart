import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/Loginpage.dart';
class MyWelcome extends StatefulWidget {
  const MyWelcome({super.key});

  @override
  State<MyWelcome> createState() => _MyWelcomeState();
}

class _MyWelcomeState extends State<MyWelcome> {
  @override
  void initState() {
    super.initState();
      Timer(Duration(seconds: 4),(){
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyLoginpage(),));
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
          child:Scaffold(
            backgroundColor: Colors.transparent,
            body: ListView(
            padding: EdgeInsets.only(top: 250,left: 30),
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DecoratedBox(decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage('assets/Wallpaper_idea.jpeg'),
                                fit: BoxFit.cover),),),
                        TextButton(onPressed: (){}, child: Text('Welcome to MyDaily app , your daily task manager...',
                          style: TextStyle(fontSize: 35,color: Colors.black54),),)

                      ],

            ),
          ),
      );
  }
}


