import 'package:flutter/material.dart';

class Help extends StatelessWidget {
  const Help({Key? key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Help Page',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 20),
        Expanded(child: MyStatefulWidget()),
      ],
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  bool _customTileExpanded = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(height: 20),
          Image.asset(
            'images/smugrin.jpg',
            fit: BoxFit.contain, // or BoxFit.cover, or other fit options
          ),
          Text(
            '90% of everything here is non-functional.',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 20),
          ExpansionTile(
            title: const Text(
              'What is Obatku?',
              style: TextStyle(fontSize: 18),
            ),
            subtitle: const Text('Information about the app'),
            trailing: Icon(
              _customTileExpanded
                  ? Icons.arrow_drop_down_circle
                  : Icons.arrow_drop_down,
            ),
            children: const <Widget>[
              ListTile(title: Text('Obatku is an online delivery and market pharmacy store that offers a wide range of prescription and over-the-counter medications, as well as health and wellness products. We offer fast and convenient delivery to your doorstep, making it easy for you to get the medications you need.')),
            ],
            onExpansionChanged: (bool expanded) {
              setState(() => _customTileExpanded = expanded);
            },
          ),
          ExpansionTile(
            title: const Text(
              'How do I place an order on Obatku?',
              style: TextStyle(fontSize: 18),
            ),
            subtitle: const Text('Ordering Instructions'),
            trailing: Icon(
              _customTileExpanded
                  ? Icons.arrow_drop_down_circle
                  : Icons.arrow_drop_down,
            ),
            children: const <Widget>[
              ListTile(title: Text('To place an order on Obatku, simply browse our selection of products and add them to your cart. Once you\'re ready to check out, follow the prompts to complete your order. ')),
            ],
            onExpansionChanged: (bool expanded) {
              setState(() => _customTileExpanded = expanded);
            },
          ),
          ExpansionTile(
            title: const Text(
              'What payment methods do you accept?',
              style: TextStyle(fontSize: 18),
            ),
            subtitle: const Text('Payment options that are available in the app'),
            trailing: Icon(
              _customTileExpanded
                  ? Icons.arrow_drop_down_circle
                  : Icons.arrow_drop_down,
            ),
            children: const <Widget>[
              ListTile(title: Text('We accept a variety of payment methods, including credit cards and PayPal. ')),
            ],
            onExpansionChanged: (bool expanded) {
              setState(() => _customTileExpanded = expanded);
            },
          ),
          ExpansionTile(
            title: const Text(
              'What if I have questions about my medication?',
              style: TextStyle(fontSize: 18),
            ),
            subtitle: const Text('Medical consultation help.'),
            trailing: Icon(
              _customTileExpanded
                  ? Icons.arrow_drop_down_circle
                  : Icons.arrow_drop_down,
            ),
            children: const <Widget>[
              ListTile(title: Text('If you have any questions or concerns about your medication, our team of licensed pharmacists is available to help. You can tap the medical consultation in the dashboard for a consultation with our team.')),
            ],
            onExpansionChanged: (bool expanded) {
              setState(() => _customTileExpanded = expanded);
            },
          ),
          ExpansionTile(
            title: const Text(
              'Who are responsible for this Godly app called Obatku?',
              style: TextStyle(fontSize: 18),
            ),
            subtitle: const Text('Info Behind the Masterminds of Obatku'),
            trailing: Icon(
              _customTileExpanded
                  ? Icons.arrow_drop_down_circle
                  : Icons.arrow_drop_down,
            ),
            children: const <Widget>[
              ListTile(title: Text('Obatku is founded by David Andre T. Ramos and Joshua Andrei D. Sablan of CS - 201. The application is in no way made to serve illegal drugs and is most definitely not buggy and 100% functional. (Ignore what the image says)')),
            ],
            onExpansionChanged: (bool expanded) {
              setState(() => _customTileExpanded = expanded);
            },
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
