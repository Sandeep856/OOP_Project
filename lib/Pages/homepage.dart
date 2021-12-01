// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, prefer_final_fields

import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:invoice_gen/Constants/constants.dart';
import 'package:invoice_gen/Pages/Edit_Item.dart';
import 'package:invoice_gen/Pages/Extra_pdf.dart';
import 'package:invoice_gen/Pages/pdf_entry.dart';
import 'package:invoice_gen/Pages/pdf_page.dart';
import 'package:invoice_gen/Widgets/add_customer.dart';
import 'package:invoiceninja/models/invoice.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User? _user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Quick Invoice',
              style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber),
            ),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SOF(),
                    ),
                  );
                },
                child: Icon(
                  Icons.add_circle,
                  color: Colors.amber,
                  size: 30,
                ))
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('User'),
              accountEmail: Text(_user!.email.toString()),
              currentAccountPicture: GestureDetector(
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
              ),
              decoration: BoxDecoration(color: Colors.amber),
            ),
            Divider(),
            InkWell(
              onTap: () {
                FirebaseAuth.instance.signOut();
              },
              child: ListTile(
                  title: Text('Sign Out'),
                  leading: Icon(
                    Icons.logout,
                    color: Colors.green,
                  )),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Container(
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
                          "Customer1",
                          style: Constants.regularHeadings,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 4,
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Extra_pdf()));
                          },
                          child: Icon(
                            Icons.picture_as_pdf,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
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
                          "Customer2",
                          style: Constants.regularHeadings,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 4,
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Extra_pdf1()));
                          },
                          child: Icon(
                            Icons.picture_as_pdf,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
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
                          "Customer3",
                          style: Constants.regularHeadings,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 4,
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Extrapdf3()));
                          },
                          child: Icon(
                            Icons.picture_as_pdf,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
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
                          "Customer4",
                          style: Constants.regularHeadings,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 4,
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Extrapdf2()));
                          },
                          child: Icon(
                            Icons.picture_as_pdf,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
