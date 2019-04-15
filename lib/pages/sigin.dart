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
        body: Container(
          child:Form(
          child: Column(
            children: <Widget>[
              username(),
              password(),
              submit(),
            ],
          ),
          ),
        ),
      ),
    );
  }
  Widget username(){
  return TextFormField(

  );
  }
  Widget password(){
  return TextFormField(

  );
  }
  Widget submit(){
  return RaisedButton(
    
  );
  }
}
