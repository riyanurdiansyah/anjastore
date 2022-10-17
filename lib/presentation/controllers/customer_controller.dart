import 'dart:convert';

import 'package:anjastore/models/user_m.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomerController extends GetxController {
  final formAddCustomer = GlobalKey<FormState>();
  var tcNamaCustomer = TextEditingController();
  var tcAlamatCustomer = TextEditingController();
  var tcTelpCustomer = TextEditingController();
  var tcEmailCustomer = TextEditingController();

  var listCustomer = <UserM>[].obs;

  void addCustomer() async {
    final id = FirebaseFirestore.instance.collection('invoice').doc().id;
    await FirebaseFirestore.instance.collection('customer').doc(id).set({
      "nama": tcNamaCustomer.text,
      "no_telp": tcTelpCustomer.text,
      "alamat": tcAlamatCustomer.text,
      "email": tcEmailCustomer.text,
      "id": id,
    });
  }

  void updateCustomer(String id) async {
    await FirebaseFirestore.instance.collection('customer').doc(id).update({
      "nama": tcNamaCustomer.text,
      "no_telp": tcTelpCustomer.text,
      "alamat": tcAlamatCustomer.text,
      "email": tcEmailCustomer.text,
    });
  }

  Stream<List<UserM>> streamCustomer() {
    Stream<QuerySnapshot<Map<String, dynamic>>> stream =
        FirebaseFirestore.instance.collection("customer").snapshots();

    return stream.map((e) => e.docs).map((val) {
      listCustomer.value =
          userFromJson(json.encode(val.map((e) => e.data()).toList()));

      return listCustomer;
    });
  }

  void clearText() {
    tcAlamatCustomer.clear();
    tcNamaCustomer.clear();
    tcTelpCustomer.clear();
    tcEmailCustomer.clear();
  }

  void deleteUser(String id) async {
    await FirebaseFirestore.instance.collection('customer').doc(id).delete();
  }
}
