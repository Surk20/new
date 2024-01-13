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


import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../utils/utils.dart';
import '../widget/text_field_input.dart';


class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _adhaarController = TextEditingController();
  final TextEditingController _nameController =  TextEditingController();
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _squareftController = TextEditingController();
  final TextEditingController _pincodeController  = TextEditingController();
  final TextEditingController _wardnoController = TextEditingController();
  final TextEditingController _latitudeController = TextEditingController();
  final TextEditingController _longitudeController = TextEditingController();
  bool _isLoading = false;
  Uint8List? _image;

  // @override
  // void dispose() {
  //   super.dispose();
  //   _emailController.dispose();
  //   _passwordController.dispose();
  //   _usernameController.dispose();
  // }
  //
  // void signUpUser() async {
  //   // set loading to true
  //   setState(() {
  //     _isLoading = true;
  //   });

  // signup user using our authmethodds
  //   String res = await AuthMethods().signUpUser(
  //       email: _emailController.text,
  //       password: _passwordController.text,
  //       username: _usernameController.text,
  //       bio: _bioController.text,
  //       file: _image!);
  //   // if string returned is sucess, user has been created
  //   if (res == "success") {
  //     setState(() {
  //       _isLoading = false;
  //     });
  //     // navigate to the home screen
  //     if (context.mounted) {
  //       Navigator.of(context).pushReplacement(
  //         MaterialPageRoute(
  //           builder: (context) => const ResponsiveLayout(
  //             mobileScreenLayout: MobileScreenLayout(),
  //             webScreenLayout: WebScreenLayout(),
  //           ),
  //         ),
  //       );
  //     }
  //   } else {
  //     setState(() {
  //       _isLoading = false;
  //     });
  //     // show the error
  //     if (context.mounted) {
  //       showSnackBar(context, res);
  //     }
  //   }
  // }

  selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    // set state because we need to display the image we selected on the circle avatar
    setState(() {
      _image = im;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('House Details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        // width: double.infinity,
        // height: double.infinity,
        // child: SingleChildScrollView(
        //   scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // const SizedBox(
            //   height: 64,
            // ),
            Stack(
              children: [
                _image != null
                    ? CircleAvatar(
                  radius: 64,
                  backgroundImage: MemoryImage(_image!),
                  backgroundColor: Colors.red,
                )
                    : const CircleAvatar(
                  radius: 64,
                  backgroundImage: NetworkImage(
                      'https://i.stack.imgur.com/l60Hf.png'),
                  backgroundColor: Colors.red,
                ),
                Positioned(
                  bottom: -10,
                  left: 80,
                  child: IconButton(
                    onPressed: selectImage,
                    icon: const Icon(Icons.add_a_photo),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            TextFieldInput(
              hintText: 'Enter user address',
              textInputType: TextInputType.streetAddress,
              textEditingController: _addressController,
            ),
            const SizedBox(
              height: 24,
            ),
            TextFieldInput(
              hintText: 'Enter pincode',
              textInputType: TextInputType.number,
              textEditingController: _pincodeController,
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextFieldInput(
                  hintText: 'Enter Latitude',
                  textInputType: TextInputType.number,
                  textEditingController: _latitudeController,
                ),
                TextFieldInput(
                  hintText: 'Enter Longitude',
                  textInputType: TextInputType.number,
                  textEditingController: _longitudeController,
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            TextFieldInput(
              hintText: 'Enter ward number',
              textInputType: TextInputType.number,
              textEditingController: _wardnoController,
            ),
            const SizedBox(
              height: 24,
            ),
            TextFieldInput(
              hintText: "Enter Owner's name",
              textInputType: TextInputType.name,
              textEditingController: _nameController,
            ),
            const SizedBox(
              height: 24,
            ),
            TextFieldInput(
              hintText: 'Enter adhaar number',
              textInputType: TextInputType.number,
              textEditingController: _adhaarController,
              isPass: true,
            ),
            const SizedBox(
              height: 24,
            ),
            TextFieldInput(
              hintText: 'Enter phone number',
              textInputType: TextInputType.phone,
              textEditingController: _phoneController,
            ),
            const SizedBox(
              height: 24,
            ),
            TextFieldInput(
              hintText: 'Enter square feet area',
              textInputType: TextInputType.number,
              textEditingController: _squareftController,
            ),
            const SizedBox(
              height: 24,
            ),
            TextFieldInput(
              hintText: 'Enter house type(Commercial/Residential)',
              textInputType: TextInputType.text,
              textEditingController: _typeController,
            ),
            const SizedBox(
              height: 24,
            ),
            InkWell(
              // onTap: signUpUser,
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: const ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                  ),
                  color: Colors.blue,
                ),
                child: !_isLoading
                    ? const Text(
                  'Submit',
                )
                    : const CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
          ],
        ),
        //),
      ),
    );
  }
}



