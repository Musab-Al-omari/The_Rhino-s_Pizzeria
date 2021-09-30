import 'package:flutter/material.dart';

class MyRadio extends StatefulWidget {
  Map myModifire;
  MyRadio(this.myModifire);

  @override
  State<MyRadio> createState() => _MyRadioState();
}

class _MyRadioState extends State<MyRadio> {
  List newList = [];
  var val;

  @override
  void initState() {
    newList = widget.myModifire['modifierOptions'];
    val = newList[0];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(newList);
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
                    height: 35,
                    child: ListTile(
                      title: Text(e),
                      leading: Radio(
                        value: e.toString(),
                        groupValue: val,
                        onChanged: (value) {
                          setState(() {
                            val = value;
                          });
                        },
                        activeColor: Colors.green,
                      ),
                    ),
                  ))
              .toList()
        ],
      ),
    );
  }
}
