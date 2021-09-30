import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:rhino_pizzeria/providers/auth.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Divider(
            height: height * 0.2,
          ),
          const Text(
            'The Rhino\'s Pizzeria',
            style: TextStyle(fontSize: 30),
          ),
          Divider(
            height: height * 0.2,
          ),
          ElevatedButton.icon(
              onPressed: () {
                final prov = Provider.of<Auth>(context, listen: false);
                prov.googleLogin();
              },
              icon: FaIcon(
                FontAwesomeIcons.google,
                color: Colors.red.shade400,
              ),
              label: const Text('LogIn with Google'))
        ]),
      ),
    );
  }
}
