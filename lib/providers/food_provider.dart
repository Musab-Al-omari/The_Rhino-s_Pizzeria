import 'package:flutter/foundation.dart';
import 'package:rhino_pizzeria/models/pizza.dart';

class FoodProvider with ChangeNotifier {
  // ignore: prefer_final_fields
  List<Pizza> _myPizza = [];

  List<Pizza> get myPizza {
    return [..._myPizza];
  }

  // Pizza oneProduct(id) {
  //   return _myPizza.firstWhere((element) => element.id == id);
  // }

  void addPizza(Pizza newPizza) {
    _myPizza.add(newPizza);
    print(_myPizza[0].title);
    notifyListeners();
  }
}
