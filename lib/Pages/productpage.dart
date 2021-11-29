// ignore_for_file: prefer_final_fields, prefer_const_constructors, deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:invoice_gen/Pages/homepage.dart';
class ProductPage extends StatefulWidget {
  final productid;
  ProductPage({required this.productid});

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final CollectionReference Saved =
      FirebaseFirestore.instance.collection('Saved');

  SnackBar _snackBar = SnackBar(
    content: Text('Added to Cart'),
  );
  SnackBar _snackBar3 = SnackBar(
    content: Text('Removed from Cart'),
  );
  SnackBar _snackBar1 = SnackBar(
    content: Text('Saved'),
  );
  // ignore: prefer_const_constructors
  SnackBar _snackBar2 = SnackBar(
    content: Text('Removed from Saved'),
  );
  final CollectionReference _Productlist =
      FirebaseFirestore.instance.collection('Products');

  final CollectionReference Users =
      FirebaseFirestore.instance.collection('Shop');
  User? _user = FirebaseAuth.instance.currentUser;
  int _price = 0;
  Future Cart() {
    return Users.doc(_user!.uid)
        .collection('Cart')
        .doc(widget.productid)
        .set({'size': _selectedSize, 'price': _price});
  }

  Future _addToSaved() {
    return Saved.doc(_user!.uid)
        .collection('Save')
        .doc(widget.productid)
        .set({"size": _selectedSize});
  }

  int _select = 0;
  int _select1 = 0;
  late String _selectedSize;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _Productlist.doc(widget.productid).get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;

            List<dynamic> Images = data['images'];
            List<dynamic> sizes = data['size'];
            _price = data['price'];
            _selectedSize = sizes[0];

            return Container(
              child: Scaffold(
                appBar: AppBar(
                  elevation: 0.1,
                  title: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    child: Text('Shop App'),
                  ),
                  centerTitle: true,
                  actions: [
                    Positioned(
                      right: 0.0,
                      child: Stack(
                        children: [
                          IconButton(
                              onPressed: () {
                               
                              },
                              color: Colors.white,
                              icon: Icon(Icons.shopping_cart)),
                          Icon(
                            Icons.brightness_1,
                            size: 20.0,
                            color: Colors.green,
                          ),
                          
                        ],
                      ),
                    ),
                  ],
                ),
                body: ListView(
                  children: [
                   
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data['name'],
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Rs ${data['price']}',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Container(
                            width: 200.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: MaterialButton(
                              onPressed: () {},
                              color: Colors.blue[100],
                              textColor: Colors.black,
                              elevation: 1,
                              child: Text('Buy Now'),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () async {
                            await Cart();
                            ScaffoldMessenger.of(context)
                                .showSnackBar(_snackBar);
                          },
                          icon: Icon(Icons.add_shopping_cart),
                          color: Colors.lightBlue[200],
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: IconButton(
                            onPressed: () async {
                              await _addToSaved();
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(_snackBar1);
                            },
                            icon: Icon(
                              Icons.favorite,
                              color: Colors.lightBlue[200],
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            deleteUser(widget.productid);
                            ScaffoldMessenger.of(context)
                                .showSnackBar(_snackBar3);
                          },
                          icon: Icon(Icons.delete),
                        ),
                      ],
                    ),
                    Divider(),
                    ListTile(
                      title: Text(
                        'Product Details',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(data['desc']),
                    ),
                    Divider(),
                    Container(
                      width: 20,
                      child: RaisedButton(
                        onPressed: () {
                          deleteSaveditem(widget.productid);
                          ScaffoldMessenger.of(context)
                              .showSnackBar(_snackBar2);
                        },
                        child: Text('Remove from favourite'),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        left: 20.0,
                      ),
                      child: Text(
                        'Select a size',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            );
          }

          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
            backgroundColor: Colors.white,
          );
        });
  }

  Future<void> deleteUser(String uid) {
    return Users.doc(_user!.uid)
        .collection('Cart')
        .doc(widget.productid)
        .delete();
  }

  Future<void> deleteSaveditem(String uid) {
    return Saved.doc(_user!.uid)
        .collection('Save')
        .doc(widget.productid)
        .delete();
  }
}
