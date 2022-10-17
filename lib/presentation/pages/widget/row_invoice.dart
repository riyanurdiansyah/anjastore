import 'package:anjastore/styles/app_responsive.dart';
import 'package:anjastore/styles/app_style_text.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;

class InvoiceRow extends StatelessWidget {
  const InvoiceRow({
    Key? key,
    required this.isHeader,
    required this.kdInvoice,
    required this.namaCustomer,
    required this.dueDateInvoice,
    required this.validateProduk,
    required this.description,
    required this.price,
    required this.total,
    required this.status,
    required this.id,
    this.onTapEdit,
    this.onTapDelete,
  }) : super(key: key);

  final bool isHeader;
  final String kdInvoice;
  final String namaCustomer;
  final String dueDateInvoice;
  final String validateProduk;
  final String description;
  final String price;
  final String total;
  final String status;
  final String id;
  final VoidCallback? onTapEdit;
  final VoidCallback? onTapDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: AppResponsive.isMobile(context) ? 6 : 10,
          vertical: AppResponsive.isMobile(context) ? 12 : 10),
      margin: EdgeInsets.only(
          left: AppResponsive.isMobile(context) ? 8 : 20,
          right: AppResponsive.isMobile(context) ? 8 : 20,
          top: AppResponsive.isMobile(context) ? 5 : 10),
      decoration: BoxDecoration(
        color: isHeader ? Colors.blue.shade100 : Colors.grey.shade200,
        // borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text(
                kdInvoice,
                style: AppStyleText.stylePoppins(
                  fontSize: AppResponsive.isMobile(context) ? 10 : 14,
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
                namaCustomer,
                style: AppStyleText.stylePoppins(
                  fontSize: AppResponsive.isMobile(context) ? 10 : 14,
                  fontWeight: FontWeight.w500,
                  color: isHeader ? Colors.blue.shade500 : Colors.grey.shade500,
                ),
              ),
            ),
          ),
          if (!AppResponsive.isMobile(context))
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  description,
                  textAlign: TextAlign.center,
                  style: AppStyleText.stylePoppins(
                    fontSize: AppResponsive.isMobile(context) ? 10 : 14,
                    height: 1.4,
                    fontWeight: FontWeight.w500,
                    color:
                        isHeader ? Colors.blue.shade500 : Colors.grey.shade500,
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
                  fontSize: AppResponsive.isMobile(context) ? 10 : 14,
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
                  fontSize: AppResponsive.isMobile(context) ? 10 : 14,
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
                child: isHeader
                    ? Text(
                        status,
                        style: AppStyleText.stylePoppins(
                          fontSize: AppResponsive.isMobile(context) ? 10 : 14,
                          fontWeight: FontWeight.w500,
                          color: isHeader
                              ? Colors.blue.shade500
                              : status == "1"
                                  ? Colors.green.shade500
                                  : Colors.red.shade500,
                        ),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () => onTapEdit!(),
                            child: const Icon(
                              Icons.mode_edit_rounded,
                              color: Colors.green,
                              size: 16,
                            ),
                          ),
                          InkWell(
                            onTap: () => onTapDelete!(),
                            child: const Icon(
                              Icons.delete_outline_rounded,
                              size: 16,
                              color: Colors.red,
                            ),
                          ),
                          InkWell(
                            onTap: () =>
                                html.window.open('invoice/$id', "_blank"),
                            child: const Icon(
                              Icons.remove_red_eye_rounded,
                              color: Colors.blue,
                              size: 16,
                            ),
                          ),
                        ],
                      )),
          ),
        ],
      ),
    );
  }
}
