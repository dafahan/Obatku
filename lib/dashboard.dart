import 'package:drugstore/consul.dart';
import 'package:drugstore/happiness.dart';
import 'package:drugstore/med.dart';
import 'package:drugstore/vitsup.dart';
import 'package:flutter/material.dart';

class MyDashboard extends StatelessWidget {
  final String name;

  MyDashboard({required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.only(top: 30, left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Hello, $name!",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          const Text('Click on any of the cards to view our catalogue',
              textAlign: TextAlign.center, style: TextStyle(fontSize: 18)),
          SizedBox(height: 10),
          Expanded(
            child: SingleChildScrollView(
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1,
                ),
                itemCount: 4, // Replace with your actual item count
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      if (index == 0) {
                        print('Item 1 clicked');
                      } else if (index == 1) {
                        // Handle onTap for item 2
                        print('Item 2 clicked');
                      } else if (index == 2) {
                        // Handle onTap for item 3
                        print('Item 3 clicked');
                      } else {
                        // Handle onTap for item 4
                        print('Item 4 clicked');
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (index == 0) {
                                Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Medicine()),
                              );
                              print('Item 1 clicked');
                            } else if (index == 1) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => VitSup())
                              );
                              print('Item 2 clicked');
                            } else if (index == 2) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Concul())
                              );
                              print('Item 3 clicked');
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Happiness())
                              );
                              print('Item 4 clicked');
                            }
                              // Handle image onTap
                            },
                            child: Image.asset('images/img${index + 1}.jpg',
                              width: 160,
                              height: 160,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            _getItemLabel(index),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getItemLabel(int index) {
    switch (index) {
      case 0:
        return 'Medicines';
      case 1:
        return 'Vitamins and Supplements';
      case 2:
        return 'Medical Consultation';
      default:
        return 'Happiness ...';
    }
  }
}
