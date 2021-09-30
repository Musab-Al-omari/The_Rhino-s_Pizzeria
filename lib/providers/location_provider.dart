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
      final currentLocationData = await Location().getLocation();

      lat = currentLocationData.altitude as double;
      long = currentLocationData.longitude as double;

      final String googleUrl =
          'https://maps.googleapis.com/maps/api/staticmap?center=&$lat,$long&zoom=13&size=600x300&maptype=roadmap&markers=color:red%7Clabel:C%7C$lat,$long&key=$api';
      _imageLocation = googleUrl;

      notifyListeners();
    } catch (e) {
      print('eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee');
      print(e);
    }
  }
}
