import 'package:flutter/material.dart';

class MySelect extends StatefulWidget {
  var myModifire;
  MySelect(this.myModifire);

  @override
  State<MySelect> createState() => _MySelectState();
}

class _MySelectState extends State<MySelect> {
  var selectedRegion;
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      hint: Text(widget.myModifire['modifierName']),
      value: selectedRegion,
      items:
          <String>[...widget.myModifire['modifierOptions']].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          selectedRegion = value;
        });
      },
    );
  }
}
