import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:rhino_pizzeria/providers/food_provider.dart';
import 'package:rhino_pizzeria/screens/add_product.dart';
import 'package:rhino_pizzeria/screens/food_menu.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => FoodProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const FoodMenu(),
        routes: {
          AddProductScreen.AddProductScreenRoute: (context) =>
              AddProductScreen(),
        },
      ),
    );
  }
}
