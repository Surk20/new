import 'package:flutter/material.dart';
//import 'Welcome.dart';
final _formKey = GlobalKey<FormState>();
class MyLoginpage extends StatefulWidget {
  const MyLoginpage({Key? key}) : super(key: key);

  @override
  State<MyLoginpage> createState() => _MyLoginpageState();
}

class _MyLoginpageState extends State<MyLoginpage> {

  String? validateEmail(String? email){
    RegExp emailRegex = RegExp(r'^[\w\.-]+@[\w-]+\.\w{2,3}(\.\w{2,3})?$');
    final isEmailValid = emailRegex.hasMatch(email ?? '');
    if(!isEmailValid){
      return 'Please enter a valid email';
    }
    return null;
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
        body: ListView(
          children: [

            //Image.asset("Wallpaper.jpeg",height: 200,),
            // for margin
            Container(
              padding: EdgeInsets.only(left: 148, top: 130),
              child: Text('MyDaily',
                style: TextStyle(color: Colors.black54, fontSize: 33),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Form(
                    // key: _formKey,
                    child: Container(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.17,
                          right: 35,
                          left: 35),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.shade50,
                                  filled: true,
                                  labelText: 'Email',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30))),
                              keyboardType: TextInputType.emailAddress,
                              validator: validateEmail,
                              autovalidateMode: AutovalidateMode.onUserInteraction,

                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.shade50,
                                  filled: true,
                                      hintText: 'Password',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30)),
                              ),
                              keyboardType: TextInputType.text ,
                              validator: (password) => password!.length<8?'Password should be atleast of 8 characters':null,
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                            ),
                            // Row(
                            //   children: [
                            //     TextButton(
                            //         onPressed: () {},
                            //         child: Text(
                            //           'Forgot password?',
                            //           style: TextStyle(
                            //             fontSize: 18,
                            //             color: Colors.white,
                            //           ),
                            //         ))
                            //   ],
                            // ),
                            SizedBox(
                              height: 25,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Login',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 27,
                                      fontWeight: FontWeight.w500),
                                ),

                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Colors.white54,
                                  child: IconButton(
                                    onPressed: () {
                                       if(_formKey.currentState!.validate())
                                       {
                                      Navigator.pushNamed(context, 'mainpage');
                                       }
                                    },
                                    icon: Icon(Icons.arrow_forward),
                                    color: Colors.black54,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 140,
                            ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.end,
                            //   children: [
                            //     TextButton(
                            //
                            //         onPressed: () {},
                            //         child: Text(
                            //           "Don't have an account?",
                            //           style: TextStyle(
                            //             fontSize: 18,
                            //             color: Colors.white,
                            //           ),
                            //         )),
                            //     TextButton(
                            //         onPressed: () {},
                            //         child: Text(
                            //           "Sign up",
                            //           style: TextStyle(
                            //             fontSize: 18,
                            //             color: Colors.blue,
                            //           ),
                            //         ),
                            //     )
                            //   ],
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
       ),
    );
  }
}
