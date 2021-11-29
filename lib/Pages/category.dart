// ignore_for_file: prefer_final_fields, prefer_const_constructors, avoid_print, unused_local_variable, unused_field

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class CategoryService {
  CollectionReference category =
      FirebaseFirestore.instance.collection("category");
  CollectionReference customer =
      FirebaseFirestore.instance.collection("customer");

  void createCategory(String name) {
    var id = Uuid();
    String categoryId = id.v1();

    category
        .add({"name": name})
        .then((value) => print("Category Added"))
        .catchError((error) => print("Failed to add Category"));
  }
}
