import 'dart:convert';

import 'package:equatable/equatable.dart';

List<BarangM> subInvoiceFromJson(String str) =>
    List<BarangM>.from(json.decode(str).map((x) => BarangM.fromJson(x)));

class BarangM extends Equatable {
  final String nama;
  final int harga;
  final int qty;
  final String deskripsi;
  // final String invoiceId;

  const BarangM({
    required this.nama,
    required this.harga,
    required this.qty,
    required this.deskripsi,
    // required this.invoiceId,
  });

  @override
  List<Object?> get props => [nama, harga, qty, deskripsi];

  factory BarangM.fromJson(Map<String, dynamic> json) => BarangM(
        nama: json["nama"],
        harga: json["harga"],
        qty: json["qty"],
        deskripsi: json["deskripsi"],
        // invoiceId: json["invoice_id"],
      );

  Map<String, dynamic> toJson() => {
        "nama": nama,
        "harga": harga,
        "qty": qty,
        "deskripsi": deskripsi,
      };
}
