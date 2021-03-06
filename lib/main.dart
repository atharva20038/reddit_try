// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reddit_try/screens/SignIn.dart';
import 'package:reddit_try/screens/loading.dart';
import 'package:reddit_try/screens/postScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Future<FirebaseApp> initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: initialization,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return MaterialApp(
              home: PostPage(),
            );
          } else if (snapshot.hasError) {
            return Text("Error");
          } else {
            return MaterialApp(
              home: Loading(),
            );
          }
        });
  }
}
