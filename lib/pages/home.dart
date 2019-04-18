import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static String tag = 'home-page';

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
}
}


class _HomePageState extends State {
  static String tag = 'home-page';

  @override
  Widget build(BuildContext context) {

    final welcome = Center(
      // padding: EdgeInsets.all(15.0),
      child: Text(
          'Welcome Home',
          style: TextStyle(fontSize: 48.0,color: Colors.teal),
          textAlign: TextAlign.center,
      ),
    );


    final body =Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(28.0),
        child:Column(
          children: <Widget>[welcome],
        ),
      
    );


    return Scaffold(
      body: body,
    );
  }
}