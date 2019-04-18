import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lib/mixins/validation_mixins.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'pages/signin.dart';
import 'dart:convert';

void main() {
  runApp(SignUp());
}

class SignUp extends StatelessWidget {
  @override
  Widget build(context) {
    final formTitle = 'Sign Up';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.teal),
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(formTitle,
              style: TextStyle(color: Colors.white, fontSize: 25)),
          centerTitle: true,
        ),
        body: SignUpForm(),
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  @override
  SignUpFormState createState() {
    return SignUpFormState();
  }
}

class SignUpFormState extends State<SignUpForm> with ValidationMixin {
  final _formKey = GlobalKey<FormState>();

  String username = '';
  String email = '';
  String password = '';
  String passconfirm = '';

  @override
  Widget build(context) {
    return Center(
        child: Container(
      padding: EdgeInsets.all(18.0),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              style: TextStyle(color: Colors.teal),
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(color: Colors.white)),
                    labelText: 'Enter your username',
                    hintText: 'Enter your username'),
                validator: validateName,
                onSaved: (String name) {
                  username = name;
                }),
            SizedBox(height: 15.0),
            TextFormField(
              style: TextStyle(color: Colors.teal),
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(color: Colors.white)),
                    labelText: 'Enter your email',
                    hintText: 'Enter your email'),
                validator: validateEmail,
                onSaved: (String value) {
                  email = value;
                }),
            SizedBox(height: 15.0),
            TextFormField(
              style: TextStyle(color: Colors.teal),
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(color: Colors.white)),
                    labelText: 'Enter your password',
                    hintText: 'Enter your password'),
                validator: validatePass,
                onSaved: (String value) {
                  password = value;
                }),
            SizedBox(height: 15.0),
            TextFormField(
              style: TextStyle(color: Colors.teal),
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(color: Colors.white)),
                    labelText: 'Confirm your Password',
                    hintText: 'Confirm your Password'),
                validator: validateConfirmPass,
                onSaved: (String value) {
                  passconfirm = value;
                }),
            SizedBox(height: 15.0),
            RaisedButton(
              onPressed: validateSubmit,
              child: Text(
                'Sign Up',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
              shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              color: Colors.teal,
            ),
            SizedBox(height: 15.0),
             RaisedButton(
              onPressed: redirector,
              child: Text(
                'Sign In',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
              shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              color: Colors.teal,
            ),
          ],
        )),
      ),
    ));
  }

  bool validateSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  validateSubmit() async {
    if (validateSave()) {
      await http.post(
          'https://peaceful-citadel-94359.herokuapp.com/api/v1/auth',
          body: {
            "username": username,
            "email": email,
            "password": password,
            "passconfirm": passconfirm
          }).then((response) {
        print(response.body);
        if (response.statusCode == 200) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Signin()));
        } else {
          var decode = jsonDecode(response.body);
          var accesErrors = decode["errors"];
          var accesMsgs = accesErrors["full_messages"];
          var encode = JsonEncoder.withIndent("    ").convert(accesMsgs);
          print(encode);
          List<dynamic> list =accesMsgs;
          for (var l in list) {
           Fluttertoast.showToast(
              msg: l,
              backgroundColor: Colors.teal,
              fontSize: 20,
              toastLength: Toast.LENGTH_LONG,
            );
          }
        }
      });
    }
  }
<<<<<<< HEAD
}
=======

  redirector(){
     Navigator.push(
                context, MaterialPageRoute(builder: (context) => Signin()));
          }
  }
>>>>>>> f7750422133aa516b28682b4fcaa164a2688f2f4
