import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lib/mixins/validation_mixins.dart';

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
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(color: Colors.white)),
                    labelText: 'Enter your email',
                    hintText: 'Enter your email'),
                validator: validateEmail,
                onSaved: (String email) {
                  email = email;
                }),
            SizedBox(height: 15.0),
            TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(color: Colors.white)),
                    labelText: 'Enter your password',
                    hintText: 'Enter your password'),
                validator: validatePass,
                onSaved: (String password) {
                  password = password;
                }),
            SizedBox(height: 15.0),
            TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(color: Colors.white)),
                    labelText: 'Confirm your Password',
                    hintText: 'Confirm your Password'),
                validator: validateConfirmPass,
                onSaved: (String passconfirm) {
                  passconfirm = passconfirm;
                }),
            SizedBox(height: 15.0),
            RaisedButton(
              onPressed: () {
                validateSubmit;
              },
              child: Text(
                'Sign Up',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
              shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              color: Colors.teal,
            )
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

  void validateSubmit() async {
    if (validateSave()) {
      var url= 'https://peaceful-citadel-94359.herokuapp.com/api/v1/auth';
     var response = await http.post(url,
          body: {
            "email": email,
            "password": password,
            "passconfirm": passconfirm
          });
      print('${response.body}');
    }
  }
}
