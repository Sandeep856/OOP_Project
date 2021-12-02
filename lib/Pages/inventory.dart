// ignore_for_file: prefer_const_constructors, unnecessary_new, unused_field, prefer_final_fields, non_constant_identifier_names, unused_local_variable, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:invoice_gen/Constants/constants.dart';
import 'package:invoice_gen/Pages/Edit_Item.dart';
//import 'package:invoice_gen/Pages/productpage.dart';

class Inventory extends StatefulWidget {
  const Inventory({Key? key}) : super(key: key);

  @override
  _InventoryState createState() => _InventoryState();
}

class _InventoryState extends State<Inventory> {
  User? _user = FirebaseAuth.instance.currentUser;
  final Stream<QuerySnapshot> _stream =
      FirebaseFirestore.instance.collection('product').snapshots();
  SnackBar _snackBar3 = SnackBar(content: Text('Removed from Inventory'));
  var productid;
  final CollectionReference Users =
      FirebaseFirestore.instance.collection('product');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Inventory",
          style: TextStyle(
              color: Colors.amber, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 10, 20, 10),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Admin()));
                  },
                  child: Icon(
                    Icons.add_circle_outline,
                    color: Colors.amber,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
        ],
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(140, 620, 70, 0),
            child: Container(
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.add_circle_outline,
                      size: 40,
                    ),
                  ),
                ],
              ),
            ),
          ),
          StreamBuilder(
              stream: _stream,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text("Something went wrong"));
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Scaffold(
                    body: Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.white,
                      ),
                    ),
                  );
                }
                return ListView(
                  children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data =
                        document.data()! as Map<String, dynamic>;
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.yellow[100],
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      height: 70.0,
                      margin: EdgeInsets.symmetric(
                        vertical: 5.0,
                        horizontal: 24.0,
                      ),
                      child: Stack(
                        children: [
                          const SizedBox(
                            height: 80.0,
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    data["name"],
                                    style: Constants.regularHeadings,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Quantity:",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 18),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Text(
                                        data["quantity"] ?? "",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 20),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        "Rs",
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.red),
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        data["price"],
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            color: Colors.yellow[900],
                                            fontWeight: FontWeight.w600),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          var id = document.id;
                                          deleteUser(id);
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(_snackBar3);
                                        },
                                        icon: Icon(
                                          Icons.delete,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  }).toList(),
                );
              }),
        ],
      ),
    );
    /*Stack(
      children: [
        StreamBuilder<QuerySnapshot>(
          stream: _stream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;

                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  height: 350.0,
                  margin: EdgeInsets.symmetric(
                    vertical: 5.0,
                    horizontal: 24.0,
                  ),
                  child: Stack(
                    children: [
                      const SizedBox(
                        height: 100.0,
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                data["name"],
                                style: Constants.regularHeadings,
                              ),
                              Text(
                                data["price"],
                                style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.yellow[900],
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              }).toList(),
            );
          },
        ),
      ],
    );*/
  }

  Future<void> deleteUser(var id) {
    return Users.doc(id)
        .delete()
        .then((value) => print("User Deleted"))
        .catchError((error) => print("Failed to delete user: $error"));
  }
}
