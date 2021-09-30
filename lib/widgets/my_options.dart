import 'package:flutter/material.dart';
import 'package:rhino_pizzeria/widgets/small_widget/check_box.dart';
import 'package:rhino_pizzeria/widgets/small_widget/radio.dart';
import 'package:rhino_pizzeria/widgets/small_widget/select.dart';

class MyOptions extends StatelessWidget {
  List modifires;
  MyOptions(this.modifires, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(modifires);
    return Container(
      height: MediaQuery.of(context).size.height,
      margin: EdgeInsets.only(top: 30),
      child: GridView.builder(
        itemCount: modifires.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 4 / 5,
            crossAxisSpacing: 20,
            mainAxisSpacing: 7),
        itemBuilder: (context, index) => Container(
          // margin: EdgeInsets.all(5),
          color: Colors.amberAccent,
          child: Column(
            children: [
              if (modifires[index]['modifierType'] == 'Select')
                MySelect(modifires[index])
              else if (modifires[index]['modifierType'] == 'Radio')
                MyRadio(modifires[index])
              else if (modifires[index]['modifierType'] == 'Checkbox')
                MyCheckbox(modifires[index])
            ],
          ),
        ),
      ),
    );
  }
}
