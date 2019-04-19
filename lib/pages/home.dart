import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Home Page',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: const Text(
            'Home Page',
            style: TextStyle(fontSize: 30),
          ),
          centerTitle: true,
        ),
        body: const Center(
          child: const Text(
            'Welcome Home',
            style: TextStyle(fontSize: 20),
            ),
        ),
      ),
    );
  }
}