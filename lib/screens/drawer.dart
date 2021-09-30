import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rhino_pizzeria/providers/auth.dart';

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
                  margin: EdgeInsets.only(top: 30),
                  child: Consumer<Auth>(
                    builder: (context, myAuth, child) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundImage:
                              NetworkImage(myAuth.user!.photoUrl as String),
                          radius: 30,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              myAuth.user!.displayName as String,
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                              ),
                            ),
                            Wrap(children: [
                              Text(
                                myAuth.user!.email as String,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                ),
                              ),
                            ])
                          ],
                        )
                      ],
                    ),
                  ),
                ),
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
                Provider.of<Auth>(context, listen: false).logOut();
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
