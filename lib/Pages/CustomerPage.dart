// ignore_for_file: file_names, prefer_const_constructors, prefer_final_fields, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:invoice_gen/Constants/constants.dart';
import 'package:invoice_gen/Pages/Add_Customer.dart';

class CustomerPage extends StatefulWidget {
  const CustomerPage({Key? key}) : super(key: key);

  @override
  _CustomerPageState createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> {
  final CollectionReference _Productlist =
      FirebaseFirestore.instance.collection('customer');
  //User? _user = FirebaseAuth.instance.currentUser;
  final Stream<QuerySnapshot> _stream =
      FirebaseFirestore.instance.collection('customer').snapshots();
  SnackBar _snackBar3 =
      SnackBar(content: Text('Removed from Customer DataBase'));
  CollectionReference Users = FirebaseFirestore.instance.collection("customer");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Customer Database",
          style: TextStyle(color: Colors.amber),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddCustomer()));
          },
          child: Icon(
            Icons.add_circle_outline,
            size: 30,
            color: Colors.amber,
          ),
        ),
      ),
      body: StreamBuilder(
          stream: _stream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                data["name"],
                                style: Constants.regularHeadings,
                              ),
                              Row(
                                children: [
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
                                  SizedBox(
                                    width: 4,
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
    );
  }

  Future<void> deleteUser(var id) {
    return Users.doc(id)
        .delete()
        .then((value) => print("User Deleted"))
        .catchError((error) => print("Failed to delete user: $error"));
  }
}

mixin FirebaseAuth {}
