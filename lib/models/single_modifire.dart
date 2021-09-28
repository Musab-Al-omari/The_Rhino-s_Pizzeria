import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Modifier with ChangeNotifier {
  final String modifierName;
  final String modifierType;
  final List modifierOptions;

  Modifier({
    required this.modifierName,
    required this.modifierType,
    required this.modifierOptions,
  });
}
