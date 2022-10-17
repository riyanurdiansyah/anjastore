import 'package:anjastore/styles/app_responsive.dart';
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
    required this.email,
    this.onTapEdit,
    this.onTapDelete,
  }) : super(key: key);

  final bool isHeader;
  final String id;
  final String nama;
  final String telp;
  final String alamat;
  final String email;
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
                email,
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
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: isHeader
                  ? Text(
                      "",
                      style: AppStyleText.stylePoppins(
                        fontSize: AppResponsive.isMobile(context) ? 10 : 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
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
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
