import 'package:flutter/material.dart';
import 'add_product.dart';
// import 'package:cloud_firestRore/cloud_firestore.dart';

class FoodMenu extends StatelessWidget {
  const FoodMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('main'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(AddProductScreen.AddProductScreenRoute);
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              // FirebaseFirestore.instance
              //     .collection('hello')
              //     .snapshots()
              //     .listen((event) {
              //   print(event);
              // });
            },
            child: const Text('mainscreen'),
          )
        ],
      ),
    );
  }
}
