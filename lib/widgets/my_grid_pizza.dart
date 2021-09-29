import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rhino_pizzeria/providers/food_provider.dart';
import 'package:rhino_pizzeria/widgets/single_pizza.dart';

class MyGridPizza extends StatefulWidget {
  const MyGridPizza({Key? key}) : super(key: key);

  @override
  State<MyGridPizza> createState() => _MyGridPizzaState();
}

class _MyGridPizzaState extends State<MyGridPizza> {
  @override
  Widget build(BuildContext context) {
    var myProducts = Provider.of<FoodProvider>(context).myPizza;
    return GridView.builder(
      padding: const EdgeInsets.all(7),
      itemCount: myProducts.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 3,
          crossAxisSpacing: 7,
          mainAxisSpacing: 7),
      itemBuilder: (context, index) {
        return SinglePizza(
          myProducts[index].id,
          myProducts[index].title,
          myProducts[index].imageUrl,
        );
      },
    );
  }
}



// (ctx, index) => ChangeNotifierProvider.value(
//         value: myProducts[index],
//         child: SinglePizza(
//           myProducts[index].id,
//           myProducts[index].title,
//           myProducts[index].imageUrl,
//         ),
//       ),