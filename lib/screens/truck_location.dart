import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rhino_pizzeria/providers/location_provider.dart';

class TruckLocation extends StatefulWidget {
  static String TruckLocationRoute = '/LocationRoute';

  @override
  State<TruckLocation> createState() => _TruckLocationState();
}

class _TruckLocationState extends State<TruckLocation> {
  var _TruckLocation;

  @override
  Widget build(BuildContext context) {
    _TruckLocation = Provider.of<LocationProvider>(context).myLocation;
    return Scaffold(
      appBar: AppBar(
        title: Text('TruckLocation'),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.8,
            child: _TruckLocation == null
                ? const Center(child: Text('NO LOCATION'))
                : Image.network(
                    _TruckLocation,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.location_on_rounded),
                label: const Text(
                  'Truck Location',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              TextButton.icon(
                onPressed: () {
                  _TruckLocation =
                      Provider.of<LocationProvider>(context, listen: false)
                          .getCurrentLocation();
                },
                icon: const Icon(Icons.settings),
                label: const Text('Set Truck Location'),
              )
            ],
          )
        ],
      ),
    );
  }
}
