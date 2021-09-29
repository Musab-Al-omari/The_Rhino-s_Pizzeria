import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:rhino_pizzeria/models/pizza.dart';
import 'package:http/http.dart' as http;

class FoodProvider with ChangeNotifier {
  List<Pizza> _myPizza = [];
  final String url =
      'https://finaltest-207ee-default-rtdb.europe-west1.firebasedatabase.app/Pizza.json';
  List<Pizza> get myPizza {
    return [..._myPizza];
  }

  Future<void> addPizza(Pizza newPizza) {
    return http
        .post(Uri.parse(url),
            body: jsonEncode(
              {
                'title': newPizza.title,
                'imageUrl': newPizza.imageUrl,
                'description': newPizza.description,
                'modifiers': newPizza.modifiers,
              },
            ))
        .then((response) {
      var resData = jsonDecode(response.body);

      _myPizza.add(Pizza(
          id: resData['name'],
          description: newPizza.description,
          imageUrl: newPizza.imageUrl,
          title: newPizza.title,
          modifiers: newPizza.modifiers));
      notifyListeners();
    }).catchError((onError) {
      print(onError);
      throw onError;
    });
  }

  Future<void> getPizza() async {
    try {
      var response = await http.get(Uri.parse(url));
      var resData = jsonDecode(response.body);
      List<Pizza> _newPizza = [];
      resData.forEach((key, value) {
        _newPizza.add(Pizza(
            id: key,
            description: value['description'],
            imageUrl: value['imageUrl'],
            title: value['title'],
            modifiers: value['modifiers']));
      });
      _myPizza = _newPizza;
      notifyListeners();
    } catch (e) {
      print('errrrrrrrrrrrrrrrrrrrrror');
      print(e.toString());
    }
  }

  Pizza getOnePizza(id) {
    return _myPizza.firstWhere((element) => element.id == id);
  }
}
