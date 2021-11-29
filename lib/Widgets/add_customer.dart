// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CustomerAdd extends StatefulWidget {
  const CustomerAdd({Key? key}) : super(key: key);

  @override
  _CustomerAddState createState() => _CustomerAddState();
}

class _CustomerAddState extends State<CustomerAdd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add New Customer',
          style: TextStyle(
              color: Colors.white, fontSize: 22.0, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
