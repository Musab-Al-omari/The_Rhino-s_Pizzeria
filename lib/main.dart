import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:rhino_pizzeria/providers/auth.dart';
import 'package:rhino_pizzeria/providers/food_provider.dart';
import 'package:rhino_pizzeria/providers/location_provider.dart';
import 'package:rhino_pizzeria/screens/add_product.dart';
import 'package:rhino_pizzeria/screens/food_menu.dart';
import 'package:provider/provider.dart';
import 'package:rhino_pizzeria/screens/login_screen.dart';
import 'package:rhino_pizzeria/screens/one_pizza.dart';
import 'package:rhino_pizzeria/screens/truck_location.dart';

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
        ),
        ChangeNotifierProvider(
          create: (context) => LocationProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => Auth(),
        ),
      ],
      child: Consumer<Auth>(
        builder: (context, authDat, _) => MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
              colorScheme: const ColorScheme(
                  primary: Color.fromRGBO(194, 239, 179, 100),
                  primaryVariant: Color.fromRGBO(194, 239, 179, 100),
                  secondary: Color.fromRGBO(116, 111, 114, 100),
                  secondaryVariant: Color.fromRGBO(116, 111, 114, 100),
                  surface: Color.fromRGBO(89, 74, 38, 100),
                  background: Color.fromRGBO(151, 171, 177, 100),
                  error: Color.fromRGBO(89, 74, 38, 100),
                  onPrimary: Color.fromRGBO(115, 95, 61, 100),
                  onSecondary: Color.fromRGBO(194, 239, 179, 100),
                  onSurface: Color.fromRGBO(194, 239, 179, 100),
                  onBackground: Color.fromRGBO(115, 95, 61, 100),
                  onError: Colors.red,
                  brightness: Brightness.light)),
          // home: WidgetTree(),
          home: authDat.user != null
              ? FoodMenu()
              : FutureBuilder(
                  builder: (context, snapshot) =>
                      snapshot.connectionState == ConnectionState.waiting
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : LoginScreen(),
                ),
          // LoginScreen(),

          routes: {
            AddProductScreen.AddProductScreenRoute: (context) =>
                AddProductScreen(),
            OnePizza.OnePizzaRoute: (context) => OnePizza(),
            TruckLocation.TruckLocationRoute: (context) => TruckLocation(),
          },
        ),
      ),
    );
  }
}
