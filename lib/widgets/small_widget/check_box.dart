import 'package:flutter/material.dart';

class MyCheckbox extends StatefulWidget {
  var myModifire;
  MyCheckbox(this.myModifire);

  @override
  State<MyCheckbox> createState() => _MyCheckboxState();
}

class _MyCheckboxState extends State<MyCheckbox> {
  List newList = [];
  late bool checkedValue;
  @override
  void initState() {
    newList = widget.myModifire['modifierOptions'];
    checkedValue = true;
    super.initState();
  }

  void _onChangee(value) {
    setState(() {
      checkedValue = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Text(
              widget.myModifire['modifierName'],
              textAlign: TextAlign.center,
            ),
          ),
          ...newList
              .map((e) => Container(
                    height: 25,
                    child: CheckboxListTile(
                      title: Text(
                        e.toString(),
                        style: TextStyle(fontSize: 20),
                      ),
                      value: checkedValue,
                      onChanged: _onChangee,
                    ),
                  ))
              .toList()
        ],
      ),
    );
  }
}
