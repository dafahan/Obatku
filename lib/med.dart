import 'package:drugstore/account.dart';
import 'package:drugstore/menu.dart';
import 'package:flutter/material.dart';
import 'package:drugstore/dashboard.dart';
import 'package:drugstore/med.dart';
import 'package:drugstore/settings.dart';

class Medicine extends StatefulWidget {
  @override
  _MedicineState createState() => _MedicineState();
}

class _MedicineState extends State<Medicine> {
  int _selectedIndexx = 1;
  late final List<Widget Function()> _widgetOptions;

  @override
  void initState() {
    super.initState();
    _widgetOptions = <Widget Function()>[
      () => Text('Page 1'),
      () => MyDashboard(
        name: 'Dafa', // replace 'Your Name' with the desired name
      ),
      () => Account(),
      () => Settings(),
      () => Medicine(),
      
    ];
  }
  List<Item> _items = [
    Item(
      name: 'Advil',
      image: 'images/med1.jpeg',
      description: 'Advil is a brand of ibuprofen, a nonsteroidal anti-inflammatory drug (NSAID) used to relieve pain, reduce fever, and reduce inflammation. It is commonly used to treat headaches, menstrual cramps, toothaches, arthritis, and back pain. It works by reducing the production of hormones that cause inflammation and pain in the body.',
      price: 10.00,
    ),
    Item(
      name: 'Tylenol',
      image: 'images/med2.jpg',
      description: 'Tylenol is a brand of acetaminophen, a pain reliever and fever reducer that is commonly used to treat headaches, menstrual cramps, toothaches, arthritis, and other types of pain. It works by blocking the production of certain chemicals in the brain that cause pain and fever.',
      price: 15.00,
    ),
    Item(
      name: 'Zyrtec',
      image: 'images/med3.jpg',
      description: 'Zyrtec is a brand of cetirizine, an antihistamine used to relieve allergy symptoms such as sneezing, itching, watery eyes, and runny nose. It works by blocking the action of histamine, a chemical released by the body in response to an allergen.',
      price: 20.00,
    ),
    Item(
      name: 'Lipitor',
      image: 'images/med4.jpg',
      description: 'Lipitor is a brand of atorvastatin, a medication used to lower cholesterol levels in the blood. It works by blocking an enzyme that the body needs to produce cholesterol, which can help reduce the risk of heart disease and stroke.',
      price: 25.00,
    ),
    Item(
      name: 'Nexium',
      image: 'images/med5.jpg',
      description: 'Nexium is a brand of esomeprazole, a proton pump inhibitor used to treat gastroesophageal reflux disease (GERD) and other conditions caused by excess stomach acid. It works by reducing the amount of acid produced by the stomach, which can help relieve symptoms such as heartburn, acid reflux, and stomach pain.',
      price: 30.00,
    ),
    Item(
      name: 'Prozac',
      image: 'images/med6.jpg',
      description: 'Prozac is a brand of fluoxetine, a selective serotonin reuptake inhibitor (SSRI) used to treat depression, obsessive-compulsive disorder, bulimia nervosa, and other mental health conditions. It works by increasing the amount of serotonin, a neurotransmitter that helps regulate mood, in the brain.',
      price: 35.00,
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
                      'images/med${index}.jpg',
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
                      'images/med${index}.jpg',
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
