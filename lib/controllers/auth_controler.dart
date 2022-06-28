import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<String> signUpUser({
    required String email,
    required String password,
    required String bio,
    required String username,
    required Uint8List file,
  }) async {
    String res = "Some Erroe Occured";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          bio.isNotEmpty ||
          username.isNotEmpty ||
          file.isNotEmpty) {}
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
