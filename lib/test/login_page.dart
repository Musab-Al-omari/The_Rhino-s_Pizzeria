import 'package:flutter/material.dart';
import 'package:rhino_pizzeria/providers/auth.dart';

class LoginPage extends StatelessWidget {
  Future<void> signInWithGoogle() async {
    await Auth().signInWithGoogle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: signInWithGoogle,
          child: Text("Login With Google"),
        ),
      ),
    );
  }
}
