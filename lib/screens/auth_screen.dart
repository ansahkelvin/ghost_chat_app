// ignore_for_file: unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ghost/widget/auth_form.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isLoading = false;
  final _auth = FirebaseAuth.instance;
  Future<void> submitForm(
    String name,
    String email,
    String password,
    bool isLogin,
    BuildContext context,
  ) async {
    UserCredential credential;
    try {
      setState(() {
        isLoading = true;
      });
      if (isLogin) {
        credential = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
      } else {
        credential = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
      }
      await FirebaseFirestore.instance.collection("users").add({
        "Name": name.trim(),
        "email": email.trim(),
      });
      setState(() {
        isLoading = false;
      });
    } on PlatformException catch (e) {
      setState(() {
        isLoading = false;
      });
      var message = "An Error occured";
      if (e.message != null) {
        message = e.message!;
      }

      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(
      //     content: Text(message),
      //   ),
      // );
    } catch (e) {
      
      print(e.toString());
      
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            AuthForm(onSubmit: submitForm, isLoading: isLoading),
          ],
        ),
      ),
    );
  }
}
