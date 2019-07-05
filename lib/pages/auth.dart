import 'package:flutter/material.dart';
// import './home.dart';

class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
      ),
      body: Center(
        child: RaisedButton(
          child: Text("Login"),
          onPressed: () {
            Navigator.pushReplacementNamed(
                //replace a page with no back method and back button
                context,
                "/");
          },
        ),
      ),
    );
  }
}
