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
  final CollectionReference _Productlist =
      FirebaseFirestore.instance.collection('product');
  User? _user = FirebaseAuth.instance.currentUser;
  final Stream<QuerySnapshot> _stream =
      FirebaseFirestore.instance.collection('product').snapshots();
  var productid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Admin()));
          },
          child: Icon(
            Icons.add_circle_outline,
            color: Colors.amber,
          ),
        ),
        title: Text(
          "Inventory",
          style: TextStyle(
              color: Colors.amber, fontSize: 20, fontWeight: FontWeight.bold),
        ),
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
                      height: 100.0,
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
}
