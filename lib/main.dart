import 'package:flutter/material.dart';

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

class SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();

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
                  labelText: 'Enter your firstname',
                  hintText: 'Enter your firstname'),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter your first name';
                }
              },
            ),
            SizedBox(height: 15.0),
            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(color: Colors.white)),
                  labelText: 'Enter your lastname',
                  hintText: 'Enter your lastname'),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter your last name';
                }
              },
            ),
            SizedBox(height: 15.0),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(color: Colors.white)),
                  labelText: 'Enter your password',
                  hintText: 'Enter your password'),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter your password';
                }
              },
            ),
            SizedBox(height: 15.0),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(color: Colors.white)),
                  labelText: 'Confirm your Password',
                  hintText: 'Confirm your Password'),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Confirm Password';
                }
              },
            ),
            SizedBox(height: 15.0),
            RaisedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Signing Up ...',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                      backgroundColor: Colors.teal,
                    ),
                  );
                }
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
}
