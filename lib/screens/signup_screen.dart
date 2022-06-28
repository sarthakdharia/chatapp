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
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController biocontroller = TextEditingController();
  final TextEditingController usernamecontroller = TextEditingController();
  Uint8List? image;

  @override
  void dispose() {
    super.dispose();
    emailcontroller.dispose();
    passwordcontroller.dispose();
    usernamecontroller.dispose();
    biocontroller.dispose();
  }

  void selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      image = im;
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
                  image != null
                      ? CircleAvatar(
                          radius: 64, backgroundImage: MemoryImage(image!))
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
                  textEditingController: usernamecontroller,
                  hintText: "Enter Your User Name",
                  textInputType: TextInputType.text),
              SizedBox(
                height: 32,
              ),
              TextFieldInput(
                  textEditingController: emailcontroller,
                  hintText: "Enter Email Address",
                  textInputType: TextInputType.emailAddress),
              SizedBox(
                height: 32,
              ),
              TextFieldInput(
                textEditingController: passwordcontroller,
                hintText: "Enter Password",
                textInputType: TextInputType.text,
                isPass: true,
              ),
              SizedBox(
                height: 32,
              ),
              TextFieldInput(
                  textEditingController: biocontroller,
                  hintText: "Enter Your Bio",
                  textInputType: TextInputType.text),
              SizedBox(
                height: 32,
              ),
              InkWell(
                onTap: () async {
                  String res = await AuthController().signUpUser(
                    email: emailcontroller.text,
                    password: passwordcontroller.text,
                    bio: biocontroller.text,
                    username: usernamecontroller.text,
                    // file:
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
