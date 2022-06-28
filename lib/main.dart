import 'package:chatapp/firebase_options.dart';
import 'package:chatapp/responsive/mobilescreenlayout.dart';
import 'package:chatapp/responsive/responsive_layout.dart';
import 'package:chatapp/responsive/webscreenlayout.dart';
import 'package:chatapp/screens/login_screen.dart';
import 'package:chatapp/utils/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.dark()
        .copyWith(scaffoldBackgroundColor: mobileBackgroundColor),
    title: "Insta Clone",
    // home: const Responsivelayout(
    //   MobileScreenLayout: MobileScreenLayout(),
    //   WebScreenLayout: WebScreenLayout(),
    // ),
    home: LoginScreen(),
  ));
}
