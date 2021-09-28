import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rhino_pizzeria/models/single_modifire.dart';

class Pizza with ChangeNotifier {
  final String id;
  final String title;
  final String imageUrl;
  final String description;
  List<Modifier> modifiers;

  Pizza(
      {required this.id,
      required this.description,
      required this.imageUrl,
      required this.title,
      required this.modifiers});
}
