import 'dart:convert';
import 'dart:ffi';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';

class LocationProvider with ChangeNotifier {
  var _imageLocation;
  var lat;
  var long;
  final api = 'AIzaSyCqVDotrQ_zwM0HOg76j6wVONJReb5DhAg';

  dynamic get myLocation {
    var newLocation = _imageLocation;
    return newLocation;
  }

  Future<void> getCurrentLocation() async {
    try {
      print('hellllllllllllllllo');
      final currentLocationData = await Location().getLocation();
      print('object');
      print(currentLocationData);
      lat = currentLocationData.altitude as double;
      long = currentLocationData.longitude as double;

      final String googleUrl =
          'https://maps.googleapis.com/maps/api/staticmap?center=&$lat,$long&zoom=13&size=600x300&maptype=roadmap&markers=color:red%7Clabel:C%7C$lat,$long&key=$api';
      _imageLocation = googleUrl;
      print('object');
      print(googleUrl);
      notifyListeners();
    } catch (e) {
      print('eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee');
      print(e);
    }
  }

  // Future<void> addPizza(Pizza newPizza) {
  //   return http
  //       .post(Uri.parse(url),
  //           body: jsonEncode(
  //             {
  //               'title': newPizza.title,
  //               'imageUrl': newPizza.imageUrl,
  //               'description': newPizza.description,
  //               'modifiers': newPizza.modifiers,
  //             },
  //           ))
  //       .then((response) {
  //     var resData = jsonDecode(response.body);

  //     _myPizza.add(Pizza(
  //         id: resData['name'],
  //         description: newPizza.description,
  //         imageUrl: newPizza.imageUrl,
  //         title: newPizza.title,
  //         modifiers: newPizza.modifiers));
  //     notifyListeners();
  //   }).catchError((onError) {
  //     print(onError);
  //     throw onError;
  //   });
  // }

  // Future<void> getPizza() async {
  //   try {
  //     var response = await http.get(Uri.parse(url));
  //     var resData = jsonDecode(response.body);
  //     List<Pizza> _newPizza = [];
  //     resData.forEach((key, value) {
  //       _newPizza.add(Pizza(
  //           id: key,
  //           description: value['description'],
  //           imageUrl: value['imageUrl'],
  //           title: value['title'],
  //           modifiers: value['modifiers']));
  //     });
  //     _myPizza = _newPizza;
  //     notifyListeners();
  //   } catch (e) {
  //     print('errrrrrrrrrrrrrrrrrrrrror');
  //     print(e.toString());
  //   }
  // }

}
