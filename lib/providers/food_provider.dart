import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:rhino_pizzeria/models/pizza.dart';
import 'package:http/http.dart' as http;

class FoodProvider with ChangeNotifier {
  // ignore: prefer_final_fields
  List<Pizza> _myPizza = [];

  List<Pizza> get myPizza {
    return [..._myPizza];
  }

  Future<void> addPizza(Pizza newPizza) {
    var url =
        'https://finaltest-207ee-default-rtdb.europe-west1.firebasedatabase.app/Pizzajson';

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
}
