import 'package:flutter/material.dart';

void main(){
  runApp(SignUp());
}

class SignUp extends StatelessWidget{
  Widget build(context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.white),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Sign Up', style: TextStyle(color: Colors.teal),),
          centerTitle: true,
        ),
      ),
    );
  }
}