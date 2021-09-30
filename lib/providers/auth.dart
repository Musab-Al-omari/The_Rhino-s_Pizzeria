import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rhino_pizzeria/models/user.dart';
import 'package:http/http.dart' as http;

class Auth extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();

  GoogleSignInAccount? _user;

  MyUser? _userObj;

  MyUser? get userObj => _userObj;
  GoogleSignInAccount? get user => _user;

  Future googleLogin() async {
    try {
      // get the google info then save them inside the firebase then sign in with these Credential
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) return;
      _user = googleUser;
      await addCheckUser();

      final googleAuth = await googleUser.authentication;
      final credentials = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
      await FirebaseAuth.instance.signInWithCredential(credentials);

      // /////////////////////////////////////
      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }

  Future logOut() async {
    try {
      await googleSignIn.disconnect();
      await FirebaseAuth.instance.signOut();
      _user = null;
      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }

  Future addCheckUser() async {
    bool flag = true;
    try {
      const String url =
          'https://finaltest-207ee-default-rtdb.europe-west1.firebasedatabase.app/Users.json';

      var response = await http.get(Uri.parse(url));
      Map resData = jsonDecode(response.body);
      resData.forEach((key, value) {
        if (value['user']['email'] == _user!.email) {
          _userObj = MyUser(user: _user!, isAdmin: value['isAdmin']);
          flag = false;
        }
      });
      if (flag) {
        await http.post(
          Uri.parse(url),
          body: jsonEncode(
            {
              'user': {
                'id': _user!.id,
                'email': _user!.email,
                'displayName': _user!.displayName,
                'photoUrl': _user!.photoUrl,
              },
              'isAdmin': true
            },
          ),
        );
        _userObj = MyUser(user: _user!, isAdmin: false);
      }
    } catch (e) {
      print(e);
    }
  }
}
