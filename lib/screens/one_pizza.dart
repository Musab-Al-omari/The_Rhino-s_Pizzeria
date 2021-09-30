import 'package:flutter/material.dart';
import 'package:rhino_pizzeria/models/pizza.dart';
import 'package:provider/provider.dart';

import 'package:rhino_pizzeria/providers/food_provider.dart';
import 'package:rhino_pizzeria/widgets/my_options.dart';

class OnePizza extends StatelessWidget {
  static String OnePizzaRoute = '/one_pizza';

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments as String;

    Pizza myPizza = Provider.of<FoodProvider>(context).getOnePizza(id);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          myPizza.title,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: 250,
                child: GridTile(
                  child: Image.network(
                    myPizza.imageUrl,
                    fit: BoxFit.cover,
                  ),
                  footer: GridTileBar(
                    backgroundColor: const Color.fromRGBO(194, 239, 179, 80),
                    title: Text(
                      myPizza.title,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 26),
                    ),
                  ),
                ),
              ),
            ),
            //////////////////////////////////////////////////////
            const Divider(
              height: 20,
            ),
            // ///////////////////////////////////////////////////
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: 100,
                color: Colors.brown.shade100,
                child: Text(
                  myPizza.description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 20, overflow: TextOverflow.ellipsis),
                ),
              ),
            ),
            MyOptions(myPizza.modifiers)
          ],
        ),
      ),
    );
  }
}
