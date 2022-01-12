// ignore_for_file: file_names, prefer_const_constructors, avoid_unnecessary_containers, deprecated_member_use, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:reddit_try/backend/auth.dart';
import 'package:reddit_try/screens/SignUp.dart';
import 'package:reddit_try/screens/postScreen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _key = GlobalKey<FormState>();
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.white,
        backgroundColor: Colors.white,
        title: Container(
            // ignore: prefer_const_literals_to_create_immutables
            width: MediaQuery.of(context).size.width * 0.1,
            height: MediaQuery.of(context).size.height * 0.1,
            child: Image.asset("logo.png")),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Login into reddit
                      Container(
                        child: Text(
                          "Log in To Reddit",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 17),
                        ),
                      ),

                      //Login using google
                      Container(
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 3, color: Colors.blueAccent),
                            borderRadius: BorderRadius.circular(50)),
                        width: MediaQuery.of(context).size.width,
                        child: FlatButton(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  width: 20, child: Image.asset("google.png")),
                              Text(
                                "Continue with Google",
                                style: TextStyle(color: Colors.blueAccent),
                              ),
                              SizedBox(
                                width: 1,
                              )
                            ],
                          ),
                          onPressed: () async {
                            await Auth().signInWithGoogle();
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PostPage()));
                          },
                        ),
                      ),

                      //the or border and or line
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.35,
                            decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(width: 0.1))),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              child: Text("OR"),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.35,
                            decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(width: 0.1))),
                          ),
                        ],
                      ),

                      //User Form
                      Container(
                        child: Form(
                          key: _key,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              //Username
                              Container(
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    labelText: "Username",
                                  ),
                                ),
                              ),

                              //Password
                              Container(
                                child: TextFormField(
                                  obscureText: obscure,
                                  decoration: InputDecoration(
                                    labelText: "Password",
                                    suffix: IconButton(
                                      icon: Icon(obscure
                                          ? Icons.visibility
                                          : Icons.visibility_off),
                                      onPressed: () {
                                        setState(() {
                                          obscure = !obscure;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ),

                              SizedBox(
                                height: 15,
                              ),

                              //New To Reddit
                              Container(
                                child: Row(
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    Text(
                                      "New to Reddit? ",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 12),
                                    ),
                                    GestureDetector(
                                      child: Text(
                                        " Sign Up",
                                        style:
                                            TextStyle(color: Colors.blueAccent),
                                      ),
                                      onTap: () {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SignUp()));
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                //Continue Button
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      gradient: LinearGradient(
                          // ignore: prefer_const_literals_to_create_immutables
                          colors: [
                            Colors.redAccent,
                            Colors.deepOrangeAccent,
                            Colors.orange
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight)),
                  child: FlatButton(
                    onPressed: () {},
                    child: Text(
                      "Continue",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
