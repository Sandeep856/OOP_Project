// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures, deprecated_member_use, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, unnecessary_null_comparison, avoid_print

import "package:flutter/material.dart";
import 'package:invoice_gen/Pages/pdf_page.dart';

class SOF extends StatefulWidget {
  @override
  _SOFState createState() => _SOFState();
}

class _SOFState extends State<SOF> {
  var desc = <TextEditingController>[];
  var price = <TextEditingController>[];
  var quantity = <TextEditingController>[];
  var cards = <Card>[];

  Card createCard() {
    var nameController = TextEditingController();
    var ageController = TextEditingController();
    var qController = TextEditingController();
    desc.add(nameController);
    price.add(ageController);
    quantity.add(qController);
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'Item ${cards.length + 1}',
            style: TextStyle(fontSize: 20),
          ),
          TextField(
            controller: nameController,
            decoration: InputDecoration(labelText: 'Description'),
          ),
          TextField(
              controller: ageController,
              decoration: InputDecoration(labelText: 'Price'),
              keyboardType: TextInputType.number),
          TextField(
              controller: qController,
              decoration: InputDecoration(labelText: 'Quantity'),
              keyboardType: TextInputType.number),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    cards.add(createCard());
  }

  _onDone() {
    List<PersonEntry> entries = [];
    for (int i = 0; i < cards.length; i++) {
      var name = desc[i].text;
      var age = price[i].text;
      var job = quantity[i].text;
      entries.add(PersonEntry(name, int.parse(age), int.parse(job)));
    }

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PdfPage(
                  desc: desc,
                  price: price,
                  quantity: quantity,
                  entries: entries.length,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Purchase List",
          style: TextStyle(color: Colors.amber, fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: cards.length,
              itemBuilder: (BuildContext context, int index) {
                return cards[index];
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: RaisedButton(
              child: Text('Add New'),
              onPressed: () => setState(() => cards.add(createCard())),
            ),
          )
        ],
      ),
      floatingActionButton:
          FloatingActionButton(child: Icon(Icons.done), onPressed: _onDone),
    );
  }
}

class PersonEntry {
  final String desc;
  final int price;
  final int quantity;

  PersonEntry(this.desc, this.price, this.quantity);
  @override
  String toString() {
    return 'Person: desc= $desc, age= $price, quantity= $quantity';
  }
}
