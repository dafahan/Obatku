import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  bool _cartIsEmpty = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _cartIsEmpty
          ? Center(child: Text('Your cart is empty'))
          : SingleChildScrollView(
            child: Column(
              children: [
                _buildMedicineRow(
                  label: 'Nexium',
                  quantity: 5,
                  price: 30.0,
                  imagePath: 'images/med4.jpg',
                ),
                _buildMedicineRow(
                  label: 'Prozac',
                  quantity: 7,
                  price: 35.0,
                  imagePath: 'images/med5.jpg',
                ),
                _buildMedicineRow(
                  label: 'Vitamin C',
                  quantity: 12,
                  price: 5.0,
                  imagePath: 'images/vit0.jpg',
                ),
                _buildMedicineRow(
                  label: 'Calcium',
                  quantity: 2,
                  price: 15.0,
                  imagePath: 'images/vit2.jpg',
                ),
                _buildMedicineRow(
                  label: 'Vicks Vaporub',
                  quantity: 1,
                  price: 1000.0,
                  imagePath: 'images/con3.jpg',
                ),
                _buildMedicineRow(
                  label: 'Steve from Minecraft',
                  quantity: 1,
                  price: 100.0,
                  imagePath: 'images/con5.jpg',
                ),
                SizedBox(height: 16),
                ElevatedButton(
  onPressed: () {
    // Calculate the total price here
    double totalPrice = 5 * 30.0 + 7 * 35.0 + 12 * 5 + 2 * 15 + 1 * 1000 + 1 * 100; // replace with actual calculation
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Total Price'),
        content: Text('The total price is $totalPrice. Are you sure you want to purchase?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // close the dialog
            },
            child: Text('No'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context); // close the dialog
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Payment Method'),
                  content: Text('Select your payment method.'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context); // close the dialog
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Purchase Successful'),
                            content: Text('Your payment has been successfully processed.'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    _cartIsEmpty = true;
                                  });
                                  Navigator.pop(context); // close the dialog
                                },
                                child: Text('OK'),
                              ),
                            ],
                          ),
                        );
                      },
                      child: Text('Credit Card'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context); // close the dialog
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Purchase Successful'),
                            content: Text('Your payment has been successfully processed.'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    _cartIsEmpty = true;
                                  });
                                  Navigator.pop(context); // close the dialog
                                },
                                child: Text('OK'),
                              ),
                            ],
                          ),
                        );
                      },
                      child: Text('PayPal'),
                    ),
                  ],
                ),
              );
            },
            child: Text('Yes'),
          ),
        ],
      ),
    );
  },
  child: Text('Check out'),
),

              ],
            ),
          )
    );
  }

  Widget _buildMedicineRow({
    required String label,
    required int quantity,
    required double price,
    required String imagePath,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Image.asset(
            imagePath,
            width: 80,
            height: 80,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text('Quantity: $quantity'),
                SizedBox(height: 8),
                Text('Price: \$$price'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
