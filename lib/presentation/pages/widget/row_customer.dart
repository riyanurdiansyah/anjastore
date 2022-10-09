import 'package:anjastore/styles/app_style_text.dart';
import 'package:flutter/material.dart';

class CustomerRow extends StatelessWidget {
  const CustomerRow({
    Key? key,
    s,
    required this.isHeader,
    required this.id,
    required this.nama,
    required this.telp,
    required this.alamat,
  }) : super(key: key);

  final bool isHeader;
  final String id;
  final String nama;
  final String telp;
  final String alamat;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
      decoration: BoxDecoration(
        color: isHeader ? Colors.blue.shade100 : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          Checkbox(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            value: false,
            onChanged: (val) {},
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text(
                id,
                style: AppStyleText.stylePoppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: isHeader ? Colors.blue.shade500 : Colors.grey.shade500,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text(
                nama,
                textAlign: TextAlign.center,
                style: AppStyleText.stylePoppins(
                  fontSize: 14,
                  height: 1.4,
                  fontWeight: FontWeight.w500,
                  color: isHeader ? Colors.blue.shade500 : Colors.grey.shade500,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text(
                telp,
                style: AppStyleText.stylePoppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: isHeader ? Colors.blue.shade500 : Colors.grey.shade500,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                alamat,
                textAlign: TextAlign.center,
                style: AppStyleText.stylePoppins(
                  fontSize: 14,
                  height: 1.4,
                  fontWeight: FontWeight.w500,
                  color: isHeader ? Colors.blue.shade500 : Colors.grey.shade500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
