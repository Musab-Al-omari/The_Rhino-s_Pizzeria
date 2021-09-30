import 'package:flutter/material.dart';
import 'package:rhino_pizzeria/providers/food_provider.dart';
import 'package:rhino_pizzeria/screens/drawer.dart';
import 'package:rhino_pizzeria/widgets/my_grid_pizza.dart';
import 'package:provider/provider.dart';
import 'add_product.dart';

class FoodMenu extends StatefulWidget {
  const FoodMenu({Key? key}) : super(key: key);

  @override
  State<FoodMenu> createState() => _FoodMenuState();
}

class _FoodMenuState extends State<FoodMenu> {
  var init = true;
  var _isLoading = false;

  @override
  void didChangeDependencies() {
    if (init) {
      setState(() {
        _isLoading = true;
      });

      Provider.of<FoodProvider>(context).getPizza().then((_) {
        setState(() {
          _isLoading = false;
        });
      }).catchError((onError) {
        setState(() {
          _isLoading = false;
        });
        throw onError;
      });

      init = false;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Food Menu',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(AddProductScreen.AddProductScreenRoute);
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : MyGridPizza(),
      drawer: const MyDrawer(),
    );
  }
}
