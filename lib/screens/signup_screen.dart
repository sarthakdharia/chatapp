import 'dart:typed_data';

import 'package:chatapp/controllers/auth_controler.dart';
import 'package:chatapp/utils/colors.dart';
import 'package:chatapp/utils/utils.dart';
import 'package:chatapp/widgets/text_field_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final TextEditingController _biocontroller = TextEditingController();
  final TextEditingController _usernamecontroller = TextEditingController();
  Uint8List? _image;

  @override
  void dispose() {
    super.dispose();
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    _usernamecontroller.dispose();
    _biocontroller.dispose();
  }

  void selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: Container(
          padding: EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/ic_instagram.svg',
                color: primaryColor,
                height: 64,
              ),
              SizedBox(
                height: 28,
              ),
              Stack(
                children: [
                  _image != null
                      ? CircleAvatar(
                          radius: 64, backgroundImage: MemoryImage(_image!))
                      : CircleAvatar(
                          radius: 64,
                          backgroundImage: NetworkImage(
                              'https://i.stack.imgur.com/l60Hf.png'),
                        ),
                  Positioned(
                      bottom: -10,
                      left: 80,
                      child: IconButton(
                        icon: Icon(
                          Icons.add_a_photo,
                          color: blueColor,
                        ),
                        onPressed: selectImage,
                      ))
                ],
              ),
              SizedBox(
                height: 32,
              ),
              TextFieldInput(
                  textEditingController: _usernamecontroller,
                  hintText: "Enter Your User Name",
                  textInputType: TextInputType.text),
              SizedBox(
                height: 32,
              ),
              TextFieldInput(
                  textEditingController: _emailcontroller,
                  hintText: "Enter Email Address",
                  textInputType: TextInputType.emailAddress),
              SizedBox(
                height: 32,
              ),
              TextFieldInput(
                textEditingController: _passwordcontroller,
                hintText: "Enter Password",
                textInputType: TextInputType.text,
                isPass: true,
              ),
              SizedBox(
                height: 32,
              ),
              TextFieldInput(
                  textEditingController: _biocontroller,
                  hintText: "Enter Your Bio",
                  textInputType: TextInputType.text),
              SizedBox(
                height: 32,
              ),
              InkWell(
                onTap: () async {
                  String res = await AuthController().signUpUser(
                    email: _emailcontroller.text,
                    password: _passwordcontroller.text,
                    bio: _biocontroller.text,
                    username: _usernamecontroller.text,
                    file: _image!,
                  );
                  print(res);
                },
                child: Container(
                  child: Text("Sign Up"),
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 12),
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                    color: Colors.lightBlue,
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: const Text(
                      'Dont have an account?',
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                  GestureDetector(
                    // onTap: () => Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (context) => SignUpScreen(),
                    //   ),
                    // ),
                    child: Container(
                      child: const Text(
                        ' Signup.',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )));
  }
}
