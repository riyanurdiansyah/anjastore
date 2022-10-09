import 'dart:convert';

import 'package:equatable/equatable.dart';

List<UserM> userFromJson(String str) =>
    List<UserM>.from(json.decode(str).map((x) => UserM.fromJson(x)));

class UserM extends Equatable {
  final String nama;
  final String alamat;
  final String noTelp;
  final String email;
  final String id;
  // final String invoiceId;

  const UserM({
    required this.nama,
    required this.alamat,
    required this.noTelp,
    required this.email,
    required this.id,
    // required this.invoiceId,
  });

  @override
  List<Object?> get props => [nama, alamat, noTelp, id];

  factory UserM.fromJson(Map<String, dynamic> json) => UserM(
        nama: json["nama"],
        alamat: json["alamat"],
        noTelp: json["no_telp"],
        email: json["email"],
        id: json["id"],
        // invoiceId: json["invoice_id"],
      );

  Map<String, dynamic> toJson() => {
        "nama": nama,
        "alamat": alamat,
        "no_telp": noTelp,
        "email": email,
        "id": id,
      };
}
