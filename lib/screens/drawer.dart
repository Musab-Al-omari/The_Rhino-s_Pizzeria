import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  height: 120,
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'The Rhino\'s Pizzeria',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 30,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                DrawerBars(() {
                  Navigator.of(context).pushReplacementNamed('/');
                }, Icons.home, 'Food Menu'),
                const SizedBox(
                  height: 10,
                ),
                DrawerBars(() {
                  Navigator.of(context).pushNamed('/LocationRoute');
                }, Icons.location_on, 'Truck Location'),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: DrawerBars(() {
                Navigator.of(context).pop();
                Navigator.of(context).pushReplacementNamed('/');
                // Provider.of<Auth>(context, listen: false).logOut();
              }, Icons.logout, 'logOut'),
            ),
          ],
        ),
      ),
    );
  }

  Widget DrawerBars(myOnTap, IconData myIcon, String title) {
    return ListTile(
      onTap: myOnTap,
      leading: Icon(
        myIcon,
        size: 25,
      ),
      title: Text(
        title,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}
