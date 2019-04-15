import 'package:flutter/material.dart';
import 'package:lib/mixins/validation_mixins.dart';

class Signin extends StatelessWidget with ValidationMixin {
  final formKey = GlobalKey<FormState>();

  String name;
  String pass;

  Widget build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.white),
      home: Scaffold(
        backgroundColor: Colors.teal,
        appBar: AppBar(
          title: Text(
            'Sign in',
            style: TextStyle(color: Colors.teal),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  username(),
                  SizedBox(
                    height: 10.0,
                  ),
                  password(),
                  SizedBox(
                    height: 10.0,
                  ),
                  submit(),
                ],
              ),
            ),
          ),
           ),
        ),
      ),
    );
  }

  Widget username() {
    return TextFormField(
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        labelText: 'Username',
        hintText: 'Mojo',
      ),
      validator: validateName,
      onSaved: (String name) {
        name = name;
      },
    );
  }

  Widget password() {
    return TextFormField(
      style: TextStyle(color: Colors.white),
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0),
         borderSide: new BorderSide(
            color: Colors.white,
            width: 1.0,),
            ),
        labelText: 'Password',
        hintText: '123456',
       
      ),
   
      validator: validatePass,
      onSaved: (String password) {
        pass = password;
      },
    );
  }

  Widget submit() {
    return RaisedButton(
      shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Text(
        'Submit',
        style: TextStyle(color: Colors.teal, fontSize: 20.0),
      ),
      color: Colors.white,
      onPressed: () {},
    );
  }
}
