import 'package:flutter/material.dart';

class Select extends StatelessWidget {
  var myModifire;
  Select(this.myModifire);
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      hint: Text(myModifire['modifierName']),
      items: <String>[...myModifire['modifierOptions']].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (_) {},
    );
  }
}
