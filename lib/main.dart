import 'package:drugstore/account.dart';
import 'package:drugstore/menu.dart';
import 'package:flutter/material.dart';
import 'package:drugstore/dashboard.dart';
import 'package:drugstore/med.dart';
import 'package:drugstore/settings.dart';
import 'package:drugstore/help.dart';
import 'package:drugstore/cart.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 1;
  late final List<Widget Function()> _widgetOptions;

  @override
  void initState() {
    super.initState();
    _widgetOptions = <Widget Function()>[
      () => Cart(),
      () => MyDashboard(
        name: 'Nia', // replace 'Your Name' with the desired name
      ),
      () => Account(),
      () => Settings(),
      () => Help(),
      () => Medicine(),
    ];
  }


  @override
  Widget build(BuildContext context) {

    void _onItemTapped(int index) {
            setState(() {
              _selectedIndex = index;
            });
          }

    return MaterialApp(
      title: 'Obatku.co',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Obatku'),
          centerTitle: true,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
          actions: [
            Builder(
              builder: (BuildContext context) {
                return Padding(
                  padding: EdgeInsets.only(right: 15),
                  child: GestureDetector(
                    onTap: () {
                      _onItemTapped(2); // index of Account page in _widgetOptions
                    },
                    child: CircleAvatar(
                      backgroundImage: AssetImage('icons/nia.jpg'),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
        drawer: MenuDrawer(onItemSelected: _onItemTapped),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex)(),
        ),
        bottomNavigationBar: 
        SizedBox(
          height: 80,
          child:BottomNavigationBar(
            backgroundColor: Colors.blue,
            items: const [
              BottomNavigationBarItem(
                icon: Tooltip(
                  message: 'Shopping Cart',
                  child: Icon(Icons.shopping_cart),
                ),
                label: 'Shopping Cart',
              ),
              BottomNavigationBarItem(
                icon: Tooltip(
                  message: 'Dashboard',
                  child: Icon(Icons.dashboard),
                ),
                label: 'Dashboard',
              ),
              BottomNavigationBarItem(
                icon: Tooltip(
                  message: 'Account',
                  child: Icon(Icons.account_circle),
                ),
                label: 'Account',
              ),
              BottomNavigationBarItem(
                icon: Tooltip(
                  message: 'Settings',
                  child: Icon(Icons.settings),
                ),
                label: 'Settings',
              ),
              BottomNavigationBarItem(
                icon: Tooltip(
                  message: 'Help',
                  child: Icon(Icons.help_center),
                ),
                label: 'Help',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedFontSize: 14,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Color.fromARGB(255, 81, 81, 81),
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
