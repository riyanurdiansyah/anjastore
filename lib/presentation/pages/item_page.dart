import 'package:anjastore/helper/app_dialog.dart';
import 'package:anjastore/styles/app_style_text.dart';
import 'package:flutter/material.dart';

class ItemPage extends StatelessWidget {
  const ItemPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Semua Item',
                      style: AppStyleText.styleAbeezee(
                        fontWeight: FontWeight.w800,
                        fontSize: 18,
                      ),
                    ),
                    const Spacer(),
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.print_rounded,
                        color: Colors.red,
                        size: 20,
                      ),
                      label: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          'Print',
                          style: AppStyleText.stylePoppins(
                            color: Colors.red,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () async =>
                          await AppDialog.dialogFormInvoice(context),
                      icon: const Icon(
                        Icons.post_add_rounded,
                        color: Colors.blue,
                        size: 20,
                      ),
                      label: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          'Data',
                          style: AppStyleText.stylePoppins(
                            color: Colors.blue,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Stack(
                  alignment: AlignmentDirectional.centerStart,
                  children: [
                    Container(
                      height: 2,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey.shade300,
                      ),
                    ),
                    Container(
                      height: 4,
                      width: 26,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
