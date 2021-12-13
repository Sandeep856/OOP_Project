// ignore: file_names
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, prefer_final_fields, deprecated_member_use, file_names, unnecessary_new, unnecessary_null_comparison, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:invoice_gen/Pages/brand.dart';
import 'package:invoice_gen/Pages/category.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:invoice_gen/Widgets/add_product.dart';
//import '../db/category.dart';
//import '../db/brand.dart';

enum Page { dashboard, manage }

class Admin extends StatefulWidget {
  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  Page _selectedPage = Page.dashboard;
  MaterialColor active = Colors.red;
  MaterialColor notActive = Colors.grey;
  TextEditingController categoryController = TextEditingController();
  TextEditingController brandController = TextEditingController();
  GlobalKey<FormState> _categoryformkey = GlobalKey();
  GlobalKey<FormState> _brandFormKey = GlobalKey();
  CategoryService _categoryService = new CategoryService();
  BrandService _brandService = new BrandService();
  //BrandService _brandService = BrandService();
  //CategoryService _categoryService = CategoryService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Edit Inventory",
            style: TextStyle(color: Colors.amber),
          ),
          elevation: 0.0,
          centerTitle: true,
        ),
        body: _loadScreen());
  }

  Widget _loadScreen() {
    return ListView(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.add),
          title: Text("Add product"),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => UploadPage()));
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.add_circle),
          title: Text("Add category"),
          onTap: () {
            _categoryalert();
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.add_circle_outline),
          title: Text("Add brand"),
          onTap: () {
            _brandAlert();
          },
        ),
      ],
    );

    // ignore: dead_code
    return Container();
  }

  void _categoryalert() {
    var alert = new AlertDialog(
      content: Form(
        key: _categoryformkey,
        child: TextFormField(
          controller: categoryController,
          validator: (value) {
            if (value!.isEmpty) {
              return "category cannot be empty";
            }
          },
          decoration: InputDecoration(
            hintText: "add Category",
          ),
          enableInteractiveSelection: true,
        ),
      ),
      actions: [
        FlatButton.icon(
          onPressed: () {
            // ignore: unnecessary_null_comparison
            if (categoryController != null) {
              _categoryService.createCategory(categoryController.text);
            }
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
