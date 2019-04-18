import 'package:flutter/material.dart';
import 'package:lib/mixins/validation_mixins.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Signin extends StatelessWidget {
  @override
  Widget build(context) {
    final formTitle = 'Sign in';

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
        body: SigninForm(),
      ),
    );
  }
}

class SigninForm extends StatefulWidget {
  @override
  SigninFormState createState() {
    return SigninFormState();
  }
}

class SigninFormState extends State<SigninForm>  with ValidationMixin {
  final _formKey = GlobalKey<FormState>();

  String mail = '';
  String pass = '';

  Widget build(context) {
    return Center(
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    email(),
                    SizedBox(
                      height: 10.0,
                    ),
                    password(),
                    SizedBox(
                      height: 10.0,
                    ),
                    submit(context),
                  ],
                ),
              ),
            ),
          ),
    );
  }

  Widget email() {
    return TextFormField(
      style: TextStyle(color: Colors.teal),
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        labelText: 'Email',
        hintText: 'email@email.com',
      ),
      validator: validateEmail,
      onSaved: (String value) {
        mail = value;
      },
    );
  }

  Widget password() {
    return TextFormField(
      style: TextStyle(color: Colors.teal),
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: new BorderSide(
            color: Colors.white,
            width: 1.0,
          ),
        ),
        labelText: 'Password',
        hintText: '123456',
      ),
      validator: validatePass,
      onSaved: (String value) {
        pass = value;
      },
    );
  }

  Widget submit(context) {
    return RaisedButton(
      onPressed: validateSubmit,
      shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Text(
        'Submit',
        style: TextStyle(color: Colors.white, fontSize: 25.0),
      ),
      color: Colors.teal,
    );
  }


   bool validateSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  validateSubmit()  async{
    if (validateSave()) {
      await http.post(
        'https://peaceful-citadel-94359.herokuapp.com/api/v1/auth/sign_in',
        body: {
          "email": mail,
          "password": pass,
        }
      ).then((response){
        print(response.body);
        print(response.statusCode);

        if (response.statusCode != 200){
          var decode = jsonDecode(response.body);
          var accesErrors = decode["errors"];
          // var accesMsgs = accesErrors["full_messages"];
          var encode = JsonEncoder.withIndent("    ").convert(accesErrors);
          print(encode);
          List<dynamic> list =accesErrors;
          for (var l in list) {
           Fluttertoast.showToast(
              msg: l,
              backgroundColor: Colors.teal[100],
              fontSize: 20,
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.TOP,
              textColor: Colors.black,
            );
          }
        }
      });
    }
  }

}
