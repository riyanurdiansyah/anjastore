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

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppResponsive.isMobile(context) ? 6 : 10),
      margin: EdgeInsets.only(
          left: AppResponsive.isMobile(context) ? 8 : 20,
          right: AppResponsive.isMobile(context) ? 8 : 20,
          top: AppResponsive.isMobile(context) ? 5 : 10),
      decoration: BoxDecoration(
        color: isHeader ? Colors.blue.shade100 : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 20,
            child: Checkbox(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)),
              value: true,
              onChanged: (val) {},
            ),
          ),
          SizedBox(
            width: AppResponsive.isMobile(context) ? 6 : 16,
          ),
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
                  : ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                      ),
                      onPressed: () {
                        html.window.open('invoice/$id', "_blank");
                      },
                      child: Text(
                        "lihat",
                        style: AppStyleText.styleAbeezee(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
            ),
          ),
          // Expanded(
          //   child: Container(
          //     alignment: Alignment.center,
          //     child: isHeader
          //         ? Text(
          //             "",
          //             textAlign: TextAlign.center,
          //             style: AppStyleText.stylePoppins(
          //               fontSize: AppResponsive.isMobile(context) ? 10 : 14,
          //               height: 1.4,
          //               fontWeight: FontWeight.w500,
          //               color: isHeader
          //                   ? Colors.blue.shade500
          //                   : Colors.grey.shade500,
          //             ),
          //           )
          //         : Row(
          //             children: [
          //               SizedBox(
          //                 width: 80,
          //                 child: ElevatedButton(
          //                   style: ElevatedButton.styleFrom(
          //                     primary: Colors.red,
          //                   ),
          //                   onPressed: () {},
          //                   child: Text(
          //                     "Hapus",
          //                     style: AppStyleText.styleAbeezee(
          //                       fontSize:
          //                           AppResponsive.isMobile(context) ? 10 : 14,
          //                       color: Colors.white,
          //                       fontWeight: FontWeight.bold,
          //                     ),
          //                   ),
          //                 ),
          //               ),
          //               const SizedBox(
          //                 width: 12,
          //               ),
          //               SizedBox(
          //                 width: 80,
          //                 child: ElevatedButton(
          //                   style: ElevatedButton.styleFrom(
          //                     primary: Colors.blue,
          //                   ),
          //                   onPressed: () {
          //                     html.window.open('invoice/$id', "_blank");
          //                   },
          //                   child: Text(
          //                     "Ubah",
          //                     style: AppStyleText.styleAbeezee(
          //                       fontSize: 14,
          //                       color: Colors.white,
          //                       fontWeight: FontWeight.bold,
          //                     ),
          //                   ),
          //                 ),
          //               ),
          //             ],
          //           ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
