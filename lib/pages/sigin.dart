import 'package:flutter/material.dart';

class Signin extends StatelessWidget{
  Widget build(context){
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.white),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Sign in',style: TextStyle(color: Colors.teal),),
          centerTitle: true,
        ),
        body: Container(),
      ),
    );
  }
}