import 'package:flutter/material.dart';

class Signin extends StatelessWidget {
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
        body: Container(
          child: Form(
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
    );
  }

  Widget username() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        labelText: 'Username',
        hintText: 'Mojo',
      ),
    );
  }

  Widget password() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        labelText: 'Password',
        hintText: '123456',
      ),
    );
  }

  Widget submit() {
    return RaisedButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Text(
        'Submit',
        style: TextStyle(color: Colors.teal, fontSize: 20.0),
      ),
      color: Colors.white,
      onPressed: () {},
    );
  }
}
