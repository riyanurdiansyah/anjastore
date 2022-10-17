import 'dart:convert';
import 'dart:developer';

import 'package:anjastore/models/barang_m.dart';
import 'package:anjastore/models/invoice_m.dart';
import 'package:anjastore/models/user_m.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InvoiceController extends GetxController {
  var tcTglInvoice = TextEditingController();
  var tcJthTempoInvoice = TextEditingController();
  var tcNoTransaksiInvoice = TextEditingController();
  var tcDeskripsiInvoice = TextEditingController();
  var noTransaksi = 0.obs;

  var listBarang = <BarangM>[].obs;
  var listInvoice = <InvoiceM>[].obs;
  var listSubInvoice = <BarangM>[].obs;
  var listTempBarang = <String>[].obs;
  var listCustomer = <UserM>[].obs;
  var listNamaCustomer = <String>[].obs;

  var detailInvoice = const InvoiceM(
    tanggalInvoice: '',
    jatuhTempo: '',
    noTransaksi: 0,
    total: 0,
    deskripsi: '',
    id: '',
    status: '',
    customer: '',
    customerId: '',
  ).obs;
  var customer = const UserM(
    nama: '',
    alamat: '',
    noTelp: '',
    id: '',
    email: '',
  ).obs;
  var namaCustomer = ''.obs;

  final formAddInvoice = GlobalKey<FormState>();
  final formAddBarang = GlobalKey<FormState>();

  var namaBarang = ''.obs;
  var tcHargaBarang = TextEditingController();
  var tcQtyBarang = TextEditingController();
  var tcDeskripsiBarang = TextEditingController();

  Stream<int> streamKode() {
    Stream<QuerySnapshot<Map<String, dynamic>>> stream = FirebaseFirestore
        .instance
        .collection("invoice")
        .orderBy('no_transaksi', descending: true)
        .snapshots();

    return stream.map((e) => e.docs).map((val) {
      noTransaksi.value = val[0]['no_transaksi'] + 1;
      if (tcNoTransaksiInvoice.text.isEmpty) {
        tcNoTransaksiInvoice.text = "AJSTORE-$noTransaksi";
      }
      return noTransaksi.value;
    });
  }

  void onChangeCustomer(String? val) {
    namaCustomer.value = val!;
    final index = listCustomer.indexWhere((e) => e.nama == val);
    customer.value = listCustomer[index];
  }

  void onChangedNamaBarang(String? val) {
    namaBarang.value = val!;
  }

  void addBarang() {
    final harga = tcHargaBarang.text.replaceAll('Rp ', '').replaceAll('.', '');
    listBarang.add(
      BarangM(
        nama: namaBarang.value,
        harga: int.parse(harga),
        qty: int.parse(tcQtyBarang.text),
        deskripsi: tcDeskripsiBarang.text,
      ),
    );
    namaBarang.value = listTempBarang[0];
    tcHargaBarang.clear();
    tcDeskripsiBarang.clear();
    tcQtyBarang.clear();
  }

  void addInvoice() async {
    int total = 0;
    for (int i = 0; i < listBarang.length; i++) {
      var totalBarang = listBarang[i].harga * listBarang[i].qty;
      total += totalBarang;
    }
    final id = FirebaseFirestore.instance.collection('invoice').doc().id;
    await FirebaseFirestore.instance.collection('invoice').doc(id).set({
      "no_transaksi": noTransaksi.value,
      "deskripsi": tcDeskripsiInvoice.text,
      "jatuh_tempo": tcJthTempoInvoice.text,
      "tanggal_invoice": tcTglInvoice.text,
      "total": total,
      "id": id,
      "customer": customer.value.nama,
      "customer_id": customer.value.id,
      "status": "on-hold",
    }).whenComplete(() async {
      for (int j = 0; j < listBarang.length; j++) {
        await FirebaseFirestore.instance
            .collection('invoice')
            .doc(id)
            .collection('barang')
            .add(
              listBarang[j].toJson(),
            );
      }
      return;
    });
  }

  void updateInvoice(String id, int noTrans) async {
    int total = 0;
    for (int i = 0; i < listBarang.length; i++) {
      var totalBarang = listBarang[i].harga * listBarang[i].qty;
      total += totalBarang;
    }
    await FirebaseFirestore.instance.collection('invoice').doc(id).update({
      "no_transaksi": noTrans,
      "deskripsi": tcDeskripsiInvoice.text,
      "jatuh_tempo": tcJthTempoInvoice.text,
      "tanggal_invoice": tcTglInvoice.text,
      "total": total,
      "id": id,
      "customer": customer.value.nama,
      "customer_id": customer.value.id,
      "status": "on-hold",
    });
    for (int j = 0; j < listBarang.length; j++) {
      final cek = await FirebaseFirestore.instance
          .collection('invoice')
          .doc(id)
          .collection('barang')
          .add(
            listBarang[j].toJson(),
          );
      log("CHECK : ${listBarang.length}");
      log("CHECK : $id");
    }
  }

  Stream<List<String>> streamCustomer() {
    Stream<QuerySnapshot<Map<String, dynamic>>> stream =
        FirebaseFirestore.instance.collection("customer").snapshots();

    return stream.map((e) => e.docs).map((val) {
      listCustomer.clear();
      listNamaCustomer.clear();
      for (var data in val) {
        listCustomer.add(UserM.fromJson(data.data()));
        listNamaCustomer.add(data.data()['nama']);
      }
      customer.value = listCustomer[0];
      if (namaCustomer.isEmpty) {
        namaCustomer.value = listNamaCustomer[0];
      }
      return listNamaCustomer;
    });
  }

  Stream<List<String>> streamBarang() {
    Stream<QuerySnapshot<Map<String, dynamic>>> stream = FirebaseFirestore
        .instance
        .collection("barang")
        .orderBy('no')
        .snapshots();

    return stream.map((e) => e.docs).map((val) {
      listTempBarang.clear();
      for (var data in val) {
        listTempBarang.add(data.data()['nama']);
      }
      if (namaBarang.isEmpty) {
        namaBarang.value = listTempBarang[0];
      }
      return listTempBarang;
    });
  }

  Stream<List<InvoiceM>> streamInvoice() {
    Stream<QuerySnapshot<Map<String, dynamic>>> stream = FirebaseFirestore
        .instance
        .collection("invoice")
        .orderBy('no_transaksi')
        .snapshots();

    return stream.map((e) => e.docs).map((val) {
      listInvoice.value =
          invoiceFromJson(json.encode(val.map((e) => e.data()).toList()));

      return listInvoice;
    });
  }

  Stream<List<BarangM>> streamSubInvoice(String id) {
    Stream<QuerySnapshot<Map<String, dynamic>>> stream = FirebaseFirestore
        .instance
        .collection("invoice")
        .doc(id)
        .collection("barang")
        .snapshots();

    return stream.map((e) => e.docs).map((val) {
      return subInvoiceFromJson(json.encode(val.map((e) => e.data()).toList()));
    });
  }

  Stream<InvoiceM?> streamInvoiceDetail(String id) {
    Stream<DocumentSnapshot<Map<String, dynamic>>> stream =
        FirebaseFirestore.instance.collection("invoice").doc(id).snapshots();
    return stream.map(
      (event) {
        if (event.data() != null) {
          if (event.exists) {
            return InvoiceM.fromJson(event.data()!);
          } else {
            return null;
          }
        } else {
          return null;
        }
      },
    );
  }

  Stream<UserM?> streamCustomerInvDetail(String id) {
    Stream<DocumentSnapshot<Map<String, dynamic>>> stream =
        FirebaseFirestore.instance.collection("customer").doc(id).snapshots();
    return stream.map(
      (event) {
        if (event.data() != null) {
          if (event.exists) {
            return UserM.fromJson(event.data()!);
          } else {
            return null;
          }
        } else {
          return null;
        }
      },
    );
  }

  void deleteInvoice(String id) async {
    await FirebaseFirestore.instance.collection('invoice').doc(id).delete();
  }
}
