// ignore_for_file: avoid_print, unused_local_variable, prefer_const_constructors, unused_field, prefer_final_fields

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class BrandService {
  FirebaseFirestore _firestore1 = FirebaseFirestore.instance;
  CollectionReference brand = FirebaseFirestore.instance.collection("brand");

  String ref = 'Brands';
  void createBrand(String name) {
    var id = Uuid();
    String brandId = id.v1();

    brand
        .add({"brand": name})
        .then((value) => print("Brand Added"))
        .catchError((error) => print("Failed to add brand"));
  }
}
