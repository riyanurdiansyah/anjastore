import 'package:anjastore/styles/app_responsive.dart';
import 'package:anjastore/styles/app_style_text.dart';
import 'package:flutter/material.dart';

class SubInvoiceRow extends StatelessWidget {
  const SubInvoiceRow({
    Key? key,
    required this.isHeader,
    required this.namaBarang,
    required this.deskripsiBarang,
    required this.hargaBarang,
    required this.qty,
    required this.subTotal,
  }) : super(key: key);

  final bool isHeader;
  final String namaBarang;
  final String deskripsiBarang;
  final String hargaBarang;
  final String qty;
  final String subTotal;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: isHeader ? Colors.grey.shade200 : Colors.grey.shade100,
      child: Row(
        children: [
          Container(
            height: 50,
            decoration: BoxDecoration(
              color: isHeader ? Colors.grey.shade400 : Colors.blue,
            ),
            width: 5,
          ),
          const SizedBox(
            width: 12,
          ),
          // Checkbox(
          //   shape:
          //       RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          //   value: false,
          //   checkColor: Colors.white,
          //   fillColor: MaterialStateProperty.all(Colors.grey.shade400),
          //   activeColor: Colors.blue.shade200,
          //   onChanged: (val) {},
          // ),
          // const SizedBox(
          //   width: 16,
          // ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text(
                namaBarang,
                textAlign: TextAlign.start,
                style: AppStyleText.stylePoppins(
                  fontSize: AppResponsive.isMobile(context) ? 10 : 14,
                  fontWeight: FontWeight.w500,
                  color: isHeader ? Colors.grey.shade600 : Colors.grey.shade400,
                ),
              ),
            ),
          ),
          if (!AppResponsive.isMobile(context))
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  deskripsiBarang,
                  textAlign: TextAlign.center,
                  style: AppStyleText.stylePoppins(
                    fontSize: AppResponsive.isMobile(context) ? 10 : 14,
                    height: 1.4,
                    fontWeight: FontWeight.w500,
                    color:
                        isHeader ? Colors.grey.shade600 : Colors.grey.shade400,
                  ),
                ),
              ),
            ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text(
                hargaBarang,
                style: AppStyleText.stylePoppins(
                  fontSize: AppResponsive.isMobile(context) ? 10 : 14,
                  fontWeight: FontWeight.w500,
                  color: isHeader ? Colors.grey.shade600 : Colors.grey.shade400,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text(
                qty,
                textAlign: TextAlign.center,
                style: AppStyleText.stylePoppins(
                  fontSize: AppResponsive.isMobile(context) ? 10 : 14,
                  height: 1.4,
                  fontWeight: FontWeight.w500,
                  color: isHeader ? Colors.grey.shade600 : Colors.grey.shade400,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text(
                subTotal,
                textAlign: TextAlign.center,
                style: AppStyleText.stylePoppins(
                  fontSize: AppResponsive.isMobile(context) ? 10 : 14,
                  height: 1.4,
                  fontWeight: FontWeight.w500,
                  color: isHeader ? Colors.grey.shade600 : Colors.grey.shade400,
                ),
              ),
            ),
          ),
          if (!AppResponsive.isMobile(context))
            const Expanded(child: SizedBox()),
        ],
      ),
    );
  }
}
