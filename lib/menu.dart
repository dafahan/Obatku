import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:drugstore/settings.dart';
//import 'package:drugstore/help.dart';

class MenuDrawer extends StatelessWidget {
  final Function(int) onItemSelected;
  MenuDrawer({Key? key, required this.onItemSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Drawer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppBar(
                leading: IconButton(
                  icon: Icon(Icons.close, color: Colors.grey,),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                title: Text('Menu'),
                backgroundColor: Colors.white,
              ),
              Container(
                height: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/getdrugs.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Spacer(),
              Card(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero),
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('icons/nia.jpg'),
            ),
            title: Text('Nia'),
            subtitle: Text('nia@xc.com'),
            trailing: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Logout Unsuccessful. Please Try Again in another Century'),
                ),
              );
              },
              child: const Text('Log Out'),
            ),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.dashboard),
          title: const Text('Dashboard'),
          onTap: () {
            onItemSelected(1); // index of Dashboard page in _widgetOptions
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(Icons.shopping_cart),
          title: const Text('My Cart'),
          onTap: () {
            onItemSelected(0); // index of Dashboard page in _widgetOptions
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(Icons.account_circle_outlined),
          title: const Text('My Account'),
          onTap: () {
            onItemSelected(2); // index of Dashboard page in _widgetOptions
            Navigator.pop(context);
          },
        ),
        const SizedBox(height: 20),
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text('Settings'),
          onTap: () {
            onItemSelected(3); // index of Dashboard page in _widgetOptions
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(Icons.help),
          title: const Text('Help'),
          onTap: () {
            onItemSelected(4); // index of Dashboard page in _widgetOptions
            Navigator.pop(context);
          },
        ),
        const Spacer(),
        ListTile(
          leading: const Icon(Icons.exit_to_app),
          title: const Text('Close Application'),
          onTap: () {
            SystemNavigator.pop();
          },
              ),
            ],
          ),
        );
  }
}