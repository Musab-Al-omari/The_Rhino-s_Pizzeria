import 'package:google_sign_in/google_sign_in.dart';

class MyUser {
  final GoogleSignInAccount user;
  final bool isAdmin;

  MyUser({
    required this.user,
    required this.isAdmin,
  });
}
