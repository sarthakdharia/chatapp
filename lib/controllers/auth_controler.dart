import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<String> signUpUser({
    required String email,
    required String password,
    required String bio,
    required String username,
    // required Uint8List file,
  }) async {
    String res = "Some Erroe Occured";
    try {
      if (email.isNotEmpty ||
              password.isNotEmpty ||
              bio.isNotEmpty ||
              username.isNotEmpty
          // || file!= null
          ) {
        UserCredential cred = await auth.createUserWithEmailAndPassword(
            email: email, password: password);
        print(cred.user!.uid);
        firestore.collection('users').doc(cred.user!.uid).set({
          'username': username,
          'uid': cred.user!.uid,
          'email': email,
          'bio': bio,
          'followers': [],
          'following': [],
        });
        res = "Success";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
