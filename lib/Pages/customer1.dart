import 'package:cloud_firestore/cloud_firestore.dart';

class Customer1 {
  CollectionReference customer =
      FirebaseFirestore.instance.collection("customer");
  void createcustomer(String name1) {
    customer
        .add({"name": name1})
        .then((value) => print("Customer Added"))
        .catchError((error) => print("Failed to add Customer"));
  }
}
