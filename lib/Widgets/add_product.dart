// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_field, prefer_final_fields, deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/material.dart";
import 'package:fluttertoast/fluttertoast.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({Key? key}) : super(key: key);

  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  TextEditingController _nametextEditingController = TextEditingController();
  TextEditingController _quantitytextEditingController =
      TextEditingController();
  GlobalKey<FormState> _namekey = GlobalKey();
  CollectionReference product =
      FirebaseFirestore.instance.collection("product");
  TextEditingController _pricetextEditingController = TextEditingController();
  String productid = DateTime.now().millisecondsSinceEpoch.toString();
  bool uploading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[50],
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Add product",
          style: TextStyle(color: Colors.black),
          textAlign: TextAlign.center,
        ),
        actions: [
          FlatButton(
            onPressed: () {
              _submit();
            },
            child: Text(
              "Add",
              style: TextStyle(
                  color: Colors.pink,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          uploading ? CircularProgressIndicator() : Text(""),
          Padding(padding: EdgeInsets.only(top: 12.0)),
          ListTile(
            leading: Icon(
              Icons.perm_device_info,
              color: Colors.pink,
            ),
            title: Container(
              width: 250,
              child: TextFormField(
                key: _namekey,
                validator: (value) {
                  if (value!.isEmpty) {
                    print("Add product");
                  } else {
                    product
                        .add({"name": _namekey})
                        .then((value) => ("Addded"))
                        .catchError((error) => print("Failed to add Product"));
                  }
                  Fluttertoast.showToast(msg: "name added");
                },
                style: TextStyle(color: Colors.deepPurpleAccent),
                controller: _nametextEditingController,
                decoration: InputDecoration(
                  hintText: "Name",
                  hintStyle: TextStyle(color: Colors.deepPurpleAccent),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.perm_device_info,
              color: Colors.pink,
            ),
            title: Container(
              width: 250,
              child: TextFormField(
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.deepPurpleAccent),
                controller: _quantitytextEditingController,
                decoration: InputDecoration(
                  hintText: "Quantity",
                  hintStyle: TextStyle(color: Colors.deepPurpleAccent),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.perm_device_info,
              color: Colors.pink,
            ),
            title: Container(
              width: 250,
              child: TextFormField(
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.deepPurpleAccent),
                controller: _pricetextEditingController,
                decoration: InputDecoration(
                  hintText: "Price",
                  hintStyle: TextStyle(color: Colors.deepPurpleAccent),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  clearFormInfo() {
    _nametextEditingController.clear();
    _quantitytextEditingController.clear();
    _pricetextEditingController.clear();
  }

  void _submit() {
    product
        .add({
          "name": _nametextEditingController.text,
          "quantity": _quantitytextEditingController.text,
          "price": _pricetextEditingController.text,
        })
        .then((value) => print("Product Added"))
        .catchError((error) => print("Failed to add Product"));
    Fluttertoast.showToast(msg: "category added");
    Navigator.pop(context);
    clearFormInfo();
  }
}
