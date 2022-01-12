// ignore_for_file: file_names, prefer_const_constructors, must_call_super, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:reddit_try/backend/auth.dart';
import 'package:reddit_try/common/posts.dart';
import 'package:reddit_try/screens/SignIn.dart';
import 'package:reddit_try/screens/SignUp.dart';

//post
class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  void initState() {
    Auth().auth.authStateChanges().listen((User? user) {
      if (user == null) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => SignUp()),
            (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70.withOpacity(0.85),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: IconButton(
          onPressed: () {
            Auth().logOut();
            print("Logout");
          },
          icon: Icon(
            Icons.logout_outlined,
            size: 30,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Post(),
              Post(),
            ],
          ),
        ),
      ),
    );
  }
}
