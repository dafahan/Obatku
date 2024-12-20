import 'package:flutter/material.dart';

class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height:30
                    ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(140),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 10,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      radius: 120,
                      backgroundImage: AssetImage('icons/nia.jpg'),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Nia",
                    style:
                        TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Female\n16 years old\nCat Woman\nBlade Eater",
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Text(
                      "        Nia (In Japanese, it’s Niyah) is one of the main playable characters in-game. Moreover, Nia is a Gormotti Driver and is accompanied by her Special Blade in Xenoblade Chronicles 3. Dromarch is her butler and calls her “Lady”. She belongs to Gormott province and is a member of Torna.",textAlign: TextAlign.justify, style: TextStyle(fontSize: 18)),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                      "        Nia usually has a sarcastic personality, and generally, she is very humorous about the shortcomings of other characters. Moreover, she had a sort of rude behavior toward Rex, because of his belief in Elysium, and Nia sees it as something childish. Her political understanding of why Gormott was annexed by the Empire of Mor Ardrain is pretty good. Also, she chooses to save the lives of innocent people, and even opposes other members of Torna. However, Nia has empathy for Pyra and is good towards the rest of the party, especially to Rex, when she gets to know about him.",textAlign: TextAlign.justify, style: TextStyle(fontSize: 18)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
