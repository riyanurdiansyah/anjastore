import 'package:anjastore/styles/app_style_text.dart';
import 'package:flutter/material.dart';

class InvoiceRow extends StatelessWidget {
  const InvoiceRow({
    Key? key,
    required this.isHeader,
    required this.kdInvoice,
    required this.dateInvoice,
    required this.dueDateInvoice,
    required this.validateProduk,
    required this.description,
    required this.price,
    required this.total,
    required this.status,
  }) : super(key: key);

  final bool isHeader;
  final String kdInvoice;
  final String dateInvoice;
  final String dueDateInvoice;
  final String validateProduk;
  final String description;
  final String price;
  final String total;
  final String status;

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
            value: true,
            onChanged: (val) {},
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text(
                kdInvoice,
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
                description,
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
                dateInvoice,
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
                dueDateInvoice,
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
                total,
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
                status.toUpperCase(),
                style: AppStyleText.stylePoppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: isHeader
                      ? Colors.blue.shade500
                      : status == "1"
                          ? Colors.green.shade500
                          : Colors.red.shade500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
