import 'package:drugstore/account.dart';
import 'package:drugstore/menu.dart';
import 'package:flutter/material.dart';
import 'package:drugstore/dashboard.dart';
import 'package:drugstore/med.dart';
import 'package:drugstore/settings.dart';

class Concul extends StatefulWidget {
  @override
  _ConculState createState() => _ConculState();
}

class _ConculState extends State<Concul> {
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
      () => Concul(),
      
    ];
  }
  List<Item> _items = [
    Item(
      name: 'Dr. Heinz Doofenshmirtz',
      image: 'images/med1.jpeg',
      description: 'He\'s a bit of an eccentric scientist who loves to invent quirky gadgets, but his inventions often go awry and cause unintended chaos. He has a quirky sense of humor and always wears a lab coat with a bow tie. You might find him muttering to himself about his latest invention, or scheming to take over the world, but deep down he\'s a softie and always means well.',
      price: 5.00,
    ),
    Item(
      name: 'Dr. Joseph Albert Nefario',
      image: 'images/med2.jpg',
      description: "He's a brilliant inventor and scientist who has worked with some of the world's top tech companies. He's a bit of a recluse and doesn't like the spotlight, but he's always up for a challenge when it comes to creating new and innovative gadgets. He's a bit absent-minded and often forgets things, but he has a heart of gold and is always willing to lend a helping hand.",
      price: 30.00,
    ),
    Item(
      name: 'Dr. Quack Quack',
      image: 'images/med3.jpg',
      description: " Don't let the name fool you, Dr. Quack Quack is a highly skilled surgeon who has performed countless successful operations. He's known for his gentle touch and caring bedside manner, and he always puts his patients first. He's a bit of a quirky character and likes to wear colorful scrubs with cartoon characters on them, but he takes his work very seriously and is highly respected in his field.",
      price: 1.00,
    ),
    Item(
      name: 'Vicks Vaporub',
      image: 'images/med4.jpg',
      description: 'If Uncle Roger see you sick, just use Vicks Vaporub. Haiyahhh. Disclaimer: Vicks Vaporub is not for sale, you are only here for a consultation with it. Thank you.',
      price: 1000.00,
    ),
    Item(
      name: 'Prof. Samuel Oak',
      image: 'images/med5.jpg',
      description: "Prof. Oak is a well-respected biologist who has spent his career studying the behavior and biology of Pokemon. He's known for his encyclopedic knowledge of the creatures and his dedication to understanding their unique traits and characteristics. He's a bit of a father figure to many young trainers and is always willing to share his wisdom and experience with those who seek it.",
      price: 20.00,
    ),
    Item(
      name: 'Steve from Minecraft',
      image: 'images/med6.jpg',
      description: "Steve may not have a PhD, but he's a skilled builder and inventor who knows how to survive in even the toughest environments. He's known for his resourcefulness and creativity, and he's always up for a challenge when it comes to building new structures or exploring uncharted territory. He may be a bit quiet and introverted, but he's a true master of his craft and always finds a way to get the job done.",
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
                      'images/con${index}.jpg',
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
                      'images/con${index}.jpg',
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
                              'Price per hour \$${_items[index].price?.toStringAsFixed(2)}',
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
