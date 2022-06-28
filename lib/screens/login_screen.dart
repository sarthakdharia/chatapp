import 'package:chatapp/screens/signup_screen.dart';
import 'package:chatapp/utils/colors.dart';
import 'package:chatapp/widgets/text_field_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailcontroller.dispose();
    passwordcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
      padding: EdgeInsets.symmetric(horizontal: 32),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: Container(),
            flex: 2,
          ),
          SvgPicture.asset(
            'assets/ic_instagram.svg',
            color: primaryColor,
            height: 64,
          ),
          SizedBox(
            height: 64,
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
          InkWell(
            child: Container(
              child: Text("Login"),
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
          Flexible(
            child: Container(),
            flex: 2,
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
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SignUpScreen(),
                  ),
                ),
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
