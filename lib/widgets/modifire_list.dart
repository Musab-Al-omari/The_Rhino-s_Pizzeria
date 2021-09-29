import 'package:flutter/material.dart';
import 'package:rhino_pizzeria/models/single_modifire.dart';

class ModifiresList extends StatelessWidget {
  final List<Map> myList;

  ModifiresList(this.myList);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Column(
        children: <Widget>[
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: myList.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(myList[index]['modifierName']),
                      Text(myList[index]['modifierOptions'].join('-')),
                      Text(myList[index]['modifierType']),
                    ],
                  ),
                );
              })
        ],
      ),
    );
  }
}
