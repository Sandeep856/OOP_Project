// ignore: file_names
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, prefer_final_fields, deprecated_member_use, file_names, unnecessary_new, unnecessary_null_comparison, duplicate_ignore, unused_local_variable

import 'package:flutter/material.dart';
import 'package:invoice_gen/Pages/brand.dart';
import 'package:invoice_gen/Pages/category.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:invoice_gen/Widgets/add_product.dart';
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
  //BrandService _brandService = BrandService();
  //CategoryService _categoryService = CategoryService();
  List<TextEditingController> desccontroller =
      List.generate(7, (i) => TextEditingController());
  List<TextEditingController> pricecontroller =
      List.generate(7, (i) => TextEditingController());
  List<TextEditingController> quantitycontroller =
      List.generate(7, (i) => TextEditingController());
  List<GlobalKey> _globalkey = List.generate(7, (i) => GlobalKey());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pdf"),
        elevation: 0.0,
      ),
      body: ListView(
        children: [
          Text("Item1"),
          TextFormField(
            controller: desccontroller[0],
            validator: (value) {
              if (value!.isEmpty) {
                return "description cannot be empty";
              }
            },
            decoration: InputDecoration(
              hintText: "name",
            ),
            enableInteractiveSelection: true,
          ),
          TextFormField(
            controller: pricecontroller[0],
            validator: (value) {
              if (value!.isEmpty) {
                return "description cannot be empty";
              }
            },
            decoration: InputDecoration(
              hintText: "price",
            ),
            enableInteractiveSelection: true,
          ),
          TextFormField(
            controller: quantitycontroller[0],
            validator: (value) {
              if (value!.isEmpty) {
                return "description cannot be empty";
              }
            },
            decoration: InputDecoration(
              hintText: "quantity",
            ),
            enableInteractiveSelection: true,
          ),
        ],
      ),
    );
  }

  Widget _loadScreen() {
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
                    return "description cannot be empty";
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
                    return "price cannot be empty";
                  }
                },
                decoration: InputDecoration(
                  hintText: "add price",
                ),
                enableInteractiveSelection: true,
              ),
              TextFormField(
                controller: quantitycontroller[0],
                validator: (value) {
                  if (value!.isEmpty) {
                    return "quantity cannot be empty";
                  }
                },
                decoration: InputDecoration(
                  hintText: "add quantity",
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
 /*ListView(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.add),
          title: Text("Add product"),
          onTap: () {
            //Navigator.push(
            //context, MaterialPageRoute(builder: (context) => UploadPage()));
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.change_history),
          title: Text("Products list"),
          onTap: () {},
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.add_circle),
          title: Text("Add category"),
          onTap: () {
            _item1();
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.category),
          title: Text("Category list"),
          onTap: () {},
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.add_circle_outline),
          title: Text("Add brand"),
          onTap: () {
            _brandAlert();
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.library_books),
          title: Text("brand list"),
          onTap: () {},
        ),
        Divider(),
      ],
    );*/