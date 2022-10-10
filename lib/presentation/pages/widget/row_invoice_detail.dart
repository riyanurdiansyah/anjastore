import 'package:anjastore/styles/app_responsive.dart';
import 'package:anjastore/styles/app_style_text.dart';
import 'package:flutter/material.dart';

class InvoiceDetailRow extends StatelessWidget {
  const InvoiceDetailRow({
    Key? key,
    required this.isHeader,
    required this.item,
    required this.description,
    required this.qty,
    required this.rate,
    required this.amount,
  }) : super(key: key);

  final bool isHeader;
  final String item;
  final String description;
  final String qty;
  final String rate;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: isHeader ? const Color.fromARGB(255, 2, 49, 88) : Colors.white,
        border: isHeader
            ? null
            : Border(
                bottom: BorderSide(
                  color: Colors.grey.shade400,
                ),
                right: BorderSide(
                  color: Colors.grey.shade400,
                ),
                left: BorderSide(
                  color: Colors.grey.shade400,
                ),
              ),
      ),
      height: 50,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              item,
              textAlign: TextAlign.center,
              style: AppStyleText.stylePoppins(
                fontSize: AppResponsive.isMobile(context) ? 10 : 12,
                height: 1.4,
                color: isHeader ? Colors.white : Colors.black,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: AppStyleText.stylePoppins(
                fontSize: AppResponsive.isMobile(context) ? 10 : 12,
                color: isHeader ? Colors.white : Colors.black,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              rate,
              textAlign: TextAlign.center,
              style: AppStyleText.stylePoppins(
                fontSize: AppResponsive.isMobile(context) ? 10 : 12,
                color: isHeader ? Colors.white : Colors.black,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              qty,
              textAlign: TextAlign.center,
              style: AppStyleText.stylePoppins(
                fontSize: AppResponsive.isMobile(context) ? 10 : 12,
                color: isHeader ? Colors.white : Colors.black,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              amount,
              textAlign: TextAlign.right,
              style: AppStyleText.stylePoppins(
                fontSize: AppResponsive.isMobile(context) ? 10 : 12,
                color: isHeader ? Colors.white : Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
