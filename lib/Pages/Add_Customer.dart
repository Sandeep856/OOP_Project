// ignore_for_file: unused_local_variable, prefer_typing_uninitialized_variables, file_names, prefer_const_literals_to_create_immutables, unnecessary_new, prefer_const_constructors, prefer_final_fields, unused_field, unused_import

import "package:flutter/material.dart";
import 'package:invoice_gen/Pages/category.dart';
import "package:fluttertoast/fluttertoast.dart";
import 'package:invoice_gen/Pages/customer1.dart';

class AddCustomer extends StatefulWidget {
  const AddCustomer({Key? key}) : super(key: key);

  @override
  _AddCustomerState createState() => _AddCustomerState();
}

class _AddCustomerState extends State<AddCustomer> {
  TextEditingController customerController = TextEditingController();

  GlobalKey<FormState> _customerformkey = GlobalKey();

  Customer1 _customerService = Customer1();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: <Widget>[],
          ),
          elevation: 0.0,
          backgroundColor: Colors.white,
        ),
        body: _loadScreen());
  }

  _loadScreen() {
    return ListView(
      children: [
        ListTile(
          leading: Icon(Icons.add_circle),
          title: Text("Add Customer"),
          onTap: () {
            _customeralert();
          },
        ),
      ],
    );
  }

  void _customeralert() {
    var alert = new AlertDialog(
      content: Form(
        key: _customerformkey,
        child: TextFormField(
          controller: customerController,
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
            if (customerController != null) {
              _customerService.createcustomer(customerController.text);
            }
            Fluttertoast.showToast(msg: "customer added");
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
