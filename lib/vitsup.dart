import 'package:drugstore/account.dart';
import 'package:drugstore/menu.dart';
import 'package:flutter/material.dart';
import 'package:drugstore/dashboard.dart';
import 'package:drugstore/med.dart';
import 'package:drugstore/settings.dart';

class VitSup extends StatefulWidget {
  @override
  _VitSupState createState() => _VitSupState();
}

class _VitSupState extends State<VitSup> {
  int _selectedIndexx = 1;
  late final List<Widget Function()> _widgetOptions;

  @override
  void initState() {
    super.initState();
    _widgetOptions = <Widget Function()>[
      () => Text('Page 1'),
      () => MyDashboard(
        name: 'Nia', // replace 'Your Name' with the desired name
      ),
      () => Account(),
      () => Settings(),
      () => VitSup(),
      
    ];
  }
  List<Item> _items = [
    Item(
      name: 'Vitamin C',
      image: 'images/med1.jpeg',
      description: 'Vitamin C is an essential nutrient that supports immune system function, collagen production, and skin health.',
      price: 5.00,
    ),
    Item(
      name: 'Fish Oil',
      image: 'images/med2.jpg',
      description: 'Fish oil is a source of omega-3 fatty acids that can support heart, brain, and joint health.',
      price: 10.00,
    ),
    Item(
      name: 'Calcium',
      image: 'images/med3.jpg',
      description: 'Calcium is a mineral that is important for building strong bones and teeth, and supporting muscle and nerve function.',
      price: 15.00,
    ),
    Item(
      name: 'Vitamin D',
      image: 'images/med4.jpg',
      description: 'Vitamin D is a fat-soluble vitamin that supports bone health, immune system function, and mood regulation.',
      price: 15.00,
    ),
    Item(
      name: 'B-complex',
      image: 'images/med5.jpg',
      description: 'B-complex vitamins are a group of nutrients that support energy metabolism, brain function, and nerve health.',
      price: 20.00,
    ),
    Item(
      name: 'Probiotics',
      image: 'images/med6.jpg',
      description: 'Probiotics are live bacteria and yeasts that are beneficial for digestive health and immune system function.',
      price: 100.00,
    ),
  ];

  int _expandedIndex = -1;
  int _selectedIndex = -1;
  int _quantity = 0;

  void addToCart() {
    if (_selectedIndex >= 0 && _quantity > 0) {
      // Add the selected item and quantity to the cart
      print('Added ${_quantity} ${_items[_selectedIndex].name} to cart!');
      _selectedIndex = -1;
      _quantity = 0;
      setState(() {
          ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Added to cart!'),
          ),
        );
      });
      
    } else {
      // Show an error message
      print('Please select an item and quantity!');
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Please select an item and quantity'),
          ),
        );
    }
  }

  void _onItemTapped(int index) {
    if (index == 0)
    {
      setState(() {
        _selectedIndexx = index;
      });
      Navigator.pop(context);
    }
    if (index == 1) {
      setState(() {
        _selectedIndexx = index;
      });
    }
    if (index == 2) {
      // Display a snackbar to indicate that the user should check their shopping cart
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Check your shopping cart!'),
        ),
      );
      // Pop the current page to return to the previous page
      Navigator.pop(context);
    } else {
      setState(() {
        _selectedIndexx = index;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    onTap: () {// index of Account page in _widgetOptions
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
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: ExpansionTile(
              title: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'images/vit${index}.jpg',
                      width: MediaQuery.of(context).size.width * 0.1, // adjust the width based on the device's width
                      height: MediaQuery.of(context).size.height * 0.05, // adjust the height based on the device's height
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    _items[index].name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.width * 0.04, // adjust the font size based on the device's width
                    ),
                  ),
                ],
              ),
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                      'images/vit${index}.jpg',
                          width: MediaQuery.of(context).size.width * 0.3, // adjust the width based on the device's width
                          height: MediaQuery.of(context).size.height * 0.2, // adjust the height based on the device's height
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            Text(
                              _items[index].description,
                              style: TextStyle(
                                fontSize: MediaQuery.of(context).size.width * 0.03, // adjust the font size based on the device's width
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              '\$${_items[index].price?.toStringAsFixed(2)}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: MediaQuery.of(context).size.width * 0.04, // adjust the font size based on the device's width
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Quantity',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: MediaQuery.of(context).size.width * 0.04, // adjust the font size based on the device's width
                              ),
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.remove),
                                  onPressed: () {
                                    setState(() {
                                      if (_quantity > 0) _quantity--;
                                    });
                                  },
                                ),
                                Text(
                                  _quantity.toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: MediaQuery.of(context).size.width * 0.04, // adjust the font size based on the device's width
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(Icons.add),
                                  onPressed: () {
                                    setState(() {
                                      _quantity++;
                                    });
                                  },
                                ),
                              ], 
                            ),
                            SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: () {
                                _selectedIndex = index;
                                addToCart();
                              },
                              child: Text('Add to cart'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              onExpansionChanged: (bool isExpanded) {
                setState(() {
                  _expandedIndex = isExpanded ? index : -1;
                });
              },
              trailing: _expandedIndex == index
                  ? Icon(Icons.expand_less)
                  : Icon(Icons.expand_more),
            ),
          );
        },
      ),
      bottomNavigationBar: 
        SizedBox(
          height: 80,
          child:BottomNavigationBar(
            backgroundColor: Colors.blue,
            items: const [
              BottomNavigationBarItem(
                icon: Tooltip(
                  message: 'Back',
                  child: Icon(Icons.arrow_back_ios),
                ),
                label: 'Back',
              ),
              BottomNavigationBarItem(
                icon: Tooltip(
                  message: 'Shop',
                  child: Icon(Icons.shopping_cart),
                ),
                label: 'Shop',
              ),
              BottomNavigationBarItem(
                icon: Tooltip(
                  message: 'Proceed',
                  child: Icon(Icons.arrow_forward_ios),
                ),
                label: 'Proceed',
              )
            ],
            currentIndex: _selectedIndexx,
            selectedFontSize: 14,
            selectedItemColor: Color.fromARGB(255, 81, 81, 81),
            unselectedItemColor: Colors.white,
            onTap: _onItemTapped,
          ),
    )
    );
  }
}

class Item {
  final String name;
  final String image;
  final String description;
  final double? price;

  Item({
    required this.name,
    required this.image,
    required this.description,
    required this.price,
  });
}
