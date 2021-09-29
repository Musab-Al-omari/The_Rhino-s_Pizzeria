import 'package:flutter/material.dart';

import 'package:rhino_pizzeria/screens/one_pizza.dart';

class SinglePizza extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  // ignore: use_key_in_widget_constructors
  const SinglePizza(this.id, this.title, this.imageUrl);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .pushNamed(OnePizza.OnePizzaRoute, arguments: id);
        },
        child: GridTile(
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
          footer: GridTileBar(
            backgroundColor: const Color.fromRGBO(100, 100, 179, 80),
            title: Text(
              title,
            ),
          ),
        ),
      ),
    );
  }
}
