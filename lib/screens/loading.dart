// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Image.asset("logo.png"),
      ),
    );
  }
}
