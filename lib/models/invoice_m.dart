import 'dart:convert';

import 'package:equatable/equatable.dart';

List<InvoiceM> invoiceFromJson(String str) =>
    List<InvoiceM>.from(json.decode(str).map((x) => InvoiceM.fromJson(x)));

class InvoiceM extends Equatable {
  final String tanggalInvoice;
  final String jatuhTempo;
  final int noTransaksi;
  final int total;
  final String deskripsi;
  final String id;
  final String status;
  final String customer;
  final String customerId;

  const InvoiceM({
    required this.tanggalInvoice,
    required this.jatuhTempo,
    required this.noTransaksi,
    required this.total,
    required this.deskripsi,
    required this.id,
    required this.status,
    required this.customer,
    required this.customerId,
  });

  @override
  List<Object?> get props =>
      [tanggalInvoice, jatuhTempo, noTransaksi, total, deskripsi];

  factory InvoiceM.fromJson(Map<String, dynamic> json) => InvoiceM(
        tanggalInvoice: json["tanggal_invoice"],
        jatuhTempo: json["jatuh_tempo"],
        noTransaksi: json["no_transaksi"],
        total: json["total"],
        deskripsi: json["deskripsi"],
        id: json["id"],
        status: json["status"],
        customer: json["customer"],
        customerId: json["customer_id"],
      );

  Map<String, dynamic> toJson() => {
        "tanggal_invoice": tanggalInvoice,
        "jatuh_tempo": jatuhTempo,
        "no_transaksi": noTransaksi,
        "total": total,
        "deskripsi": deskripsi,
        "id": id,
        "status": status,
        "customer": customer,
        "customer_id": customerId,
      };
}
