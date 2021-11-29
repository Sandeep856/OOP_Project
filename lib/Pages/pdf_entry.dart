// ignore: file_names
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, prefer_final_fields, deprecated_member_use, file_names, unnecessary_new, unnecessary_null_comparison, duplicate_ignore, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:invoice_gen/Pages/brand.dart';
import 'package:invoice_gen/Pages/category.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:invoice_gen/Pages/pdf_page.dart';
import 'package:invoice_gen/Widgets/add_product.dart';
import 'package:invoice_gen/Widgets/custom_input.dart';
//import '../db/category.dart';
//import '../db/brand.dart';

enum Page { dashboard, manage }

class PdfEntry extends StatefulWidget {
  @override
  _PdfEntryState createState() => _PdfEntryState();
}

class _PdfEntryState extends State<PdfEntry> {
  Page _selectedPage = Page.dashboard;
  MaterialColor active = Colors.red;
  MaterialColor notActive = Colors.grey;
  TextEditingController categoryController = TextEditingController();
  TextEditingController brandController = TextEditingController();
  GlobalKey<FormState> _categoryformkey = GlobalKey();
  GlobalKey<FormState> _brandFormKey = GlobalKey();
  CategoryService _categoryService = new CategoryService();
  BrandService _brandService = new BrandService();
  List<TextEditingController> desccontroller =
      List.generate(7, (i) => TextEditingController());
  List<TextEditingController> pricecontroller =
      List.generate(7, (i) => TextEditingController());
  List<TextEditingController> quantitycontroller =
      List.generate(7, (i) => TextEditingController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(" Generate PDF"),
          elevation: 0.0,
          leading: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PdfPage(
                            desc: desccontroller,
                            price: pricecontroller,
                            quantity: quantitycontroller)));
              },
              child: Icon(Icons.arrow_right)),
        ),
        body: _loadScreen());
  }

  Widget _loadScreen() {
    return ListView(
      children: <Widget>[
        for (int i = 0; i < 7; i++)
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "item${i + 1}",
                  style: TextStyle(color: Colors.amber, fontSize: 20),
                ),
                TextFormField(
                  controller: desccontroller[i],
                  decoration: InputDecoration(
                      hintText: "Add name", label: Text("Description")),
                ),
                TextFormField(
                  controller: pricecontroller[i],
                  decoration: InputDecoration(
                      hintText: "Add price", label: Text("Price")),
                  keyboardType: TextInputType.number,
                ),
                TextFormField(
                  controller: quantitycontroller[i],
                  decoration: InputDecoration(
                      hintText: "Add quantity", label: Text("Quantity")),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 40,
                )
              ],
            ),
          ),
      ],
    );

    // ignore: dead_code
    return Container();
  }

  void _item1() {
    var alert = new AlertDialog(
      content: Form(
        key: _categoryformkey,
        child: Container(
          height: 150,
          child: Column(
            children: [
              TextFormField(
                controller: desccontroller[0],
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Description cannot be empty";
                  }
                },
                decoration: InputDecoration(
                  hintText: "add Description",
                ),
                enableInteractiveSelection: true,
              ),
              TextFormField(
                controller: pricecontroller[0],
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Price cannot be empty";
                  }
                },
                decoration: InputDecoration(
                  hintText: "add price",
                ),
                enableInteractiveSelection: true,
              ),
            ],
          ),
        ),
      ),
      actions: [
        FlatButton.icon(
          onPressed: () {
            // ignore: unnecessary_null_comparison
            if (categoryController != null) {}
            Fluttertoast.showToast(msg: "category added");
            Navigator.pop(context);
          },
          icon: Icon(Icons.add),
          label: Text("ADD"),
        ),
        FlatButton.icon(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.close),
          label: Text("CLOSE"),
        ),
      ],
    );
    showDialog(context: context, builder: (_) => alert);
  }

  void _item2() {
    var alert = new AlertDialog(
      content: Form(
        key: _categoryformkey,
        child: Container(
          height: 150,
          child: Column(
            children: [
              TextFormField(
                controller: desccontroller[1],
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Description cannot be empty";
                  }
                },
                decoration: InputDecoration(
                  hintText: "add Description",
                ),
                enableInteractiveSelection: true,
              ),
              TextFormField(
                controller: pricecontroller[1],
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Price cannot be empty";
                  }
                },
                decoration: InputDecoration(
                  hintText: "add price",
                ),
                enableInteractiveSelection: true,
              ),
            ],
          ),
        ),
      ),
      actions: [
        FlatButton.icon(
          onPressed: () {
            // ignore: unnecessary_null_comparison
            if (categoryController != null) {}
            Fluttertoast.showToast(msg: "category added");
            Navigator.pop(context);
          },
          icon: Icon(Icons.add),
          label: Text("ADD"),
        ),
        FlatButton.icon(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.close),
          label: Text("CLOSE"),
        ),
      ],
    );
    showDialog(context: context, builder: (_) => alert);
  }

  void _brandAlert() {
    var alert = new AlertDialog(
      content: Form(
        key: _brandFormKey,
        child: TextFormField(
          controller: brandController,
          validator: (value) {
            if (value!.isEmpty) {
              return "brand cannot be empty";
            }
          },
          decoration: InputDecoration(
            hintText: "add brand",
          ),
        ),
      ),
      actions: [
        FlatButton.icon(
          onPressed: () {
            if (brandController != null) {
              _brandService.createBrand(brandController.text);
            }
            Fluttertoast.showToast(msg: "brand Added");
            Navigator.pop(context);
          },
          icon: Icon(Icons.add),
          label: Text("ADD"),
        ),
        FlatButton.icon(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.close),
          label: Text("CLOSE"),
        ),
      ],
    );
    showDialog(context: context, builder: (_) => alert);
  }
}
 /*ListTile(
          leading: Icon(Icons.add),
          title: Text("Item1"),
          onTap: () {
            _item1();
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.add),
          title: Text("Item2"),
          onTap: () {},
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.add),
          title: Text("Item3"),
          onTap: () {},
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.add),
          title: Text("Item4"),
          onTap: () {},
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.add),
          title: Text("Item5"),
          onTap: () {
            _brandAlert();
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.add),
          title: Text("Item6"),
          onTap: () {},
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.add),
          title: Text("Item7"),
          onTap: () {},
        ),*/