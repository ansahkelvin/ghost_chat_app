import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ghost/screens/auth_screen.dart';
import 'package:ghost/screens/chat_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ghost',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        colorScheme: const ColorScheme.light(
          primary: Color(0xff6200ee),
        ),
      ),
      home: const AuthScreen(),
    );
  }
}
