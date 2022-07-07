import 'package:chatapp/controllers/auth_controler.dart';
import 'package:chatapp/responsive/mobilescreenlayout.dart';
import 'package:chatapp/responsive/responsive_layout.dart';
import 'package:chatapp/responsive/webscreenlayout.dart';
import 'package:chatapp/screens/authentication/signup_screen.dart';
import 'package:chatapp/utils/colors.dart';
import 'package:chatapp/utils/utils.dart';
import 'package:chatapp/widgets/text_field_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
  }

  void loginUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthController().loginUser(
        email: _emailcontroller.text, password: _passwordcontroller.text);
    if (res == "success") {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => Responsivelayout(
                MobileScreenLayout: MobileScreenLayout(),
                WebScreenLayout: WebScreenLayout(),
              )));
    } else {
      showSnackBar(context, res);
    }
    setState(() {
      _isLoading = false;
    });
  }

  void NavigatToSignUp() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => SignUpScreen(),
    ));
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
          InkWell(
            onTap: loginUser,
            child: Container(
              child: _isLoading
                  ? Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    )
                  : Text("Login"),
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
                // onTap: () => Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (context) => SignUpScreen(),
                //   ),
                // ),
                onTap: NavigatToSignUp,
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
