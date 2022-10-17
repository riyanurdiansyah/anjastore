import 'package:anjastore/constanta.dart';
import 'package:anjastore/helper/app_dialog.dart';
import 'package:anjastore/models/user_m.dart';
import 'package:anjastore/presentation/controllers/customer_controller.dart';
import 'package:anjastore/presentation/pages/widget/row_customer.dart';
import 'package:anjastore/styles/app_style_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widget/custom_popup_menu.dart';

class CustomerPage extends StatelessWidget {
  CustomerPage({Key? key}) : super(key: key);

  final custC = Get.put(CustomerController());

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
                      'Semua Customer',
                      style: AppStyleText.styleAbeezee(
                        fontWeight: FontWeight.w800,
                        fontSize: 18,
                      ),
                    ),
                    const Spacer(),
                    TextButton.icon(
                      onPressed: () async =>
                          await AppDialog.dialogAddCustomer(context),
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
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            width: double.infinity,
            child: Row(
              children: [
                SizedBox(
                  height: 40,
                  width: Get.width / 3,
                  child: TextField(
                    style: AppStyleText.stylePoppins(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                    cursorHeight: 10,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color.fromRGBO(241, 242, 244, 1),
                      border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 0.2, color: Colors.grey),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 0.2, color: Colors.grey),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 0.2, color: Colors.white),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      contentPadding: const EdgeInsets.only(top: 6),
                      hintText: "Cari invoice disini....",
                      hintStyle: AppStyleText.styleLato(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                      suffixIcon: IconButton(
                        icon: const Icon(
                          Icons.highlight_remove_rounded,
                          size: 18,
                        ),
                        onPressed: () {},
                        color: Colors.grey,
                      ),
                      prefixIcon: IconButton(
                        icon: const Icon(
                          Icons.search_rounded,
                          size: 18,
                        ),
                        onPressed: () {},
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: Get.width / 6,
                  child: Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 55,
                          child: CustomPopUpMenu(
                            listMenu: List.generate(
                              listSortName.length,
                              (index) => PopupMenuItem(
                                onTap: () {},
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.abc_rounded,
                                      size: 16,
                                    ),
                                    const SizedBox(
                                      width: 16,
                                    ),
                                    Text(
                                      listSortName[index].title!,
                                      style: AppStyleText.stylePoppins(
                                        fontSize: 14,
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            icon: Container(
                              height: 55,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  width: 2,
                                  color: Colors.grey.shade300,
                                ),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.abc_rounded,
                                    size: 18,
                                    color: Colors.grey.shade400,
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 4.0),
                                    child: Text(
                                      "Nama",
                                      style: AppStyleText.stylePoppins(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.grey.shade400,
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  Icon(
                                    Icons.expand_more_rounded,
                                    size: 16,
                                    color: Colors.grey.shade400,
                                  ),
                                ],
                              ),
                            ),
                            offset: const Offset(-10, 50),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 55,
                          child: CustomPopUpMenu(
                            listMenu: List.generate(
                              listSortDate.length,
                              (index) => PopupMenuItem(
                                onTap: () {},
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.date_range_rounded,
                                      size: 16,
                                    ),
                                    const SizedBox(
                                      width: 16,
                                    ),
                                    Text(
                                      listSortDate[index].title!,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            icon: Container(
                              height: 55,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  width: 2,
                                  color: Colors.grey.shade300,
                                ),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.date_range_rounded,
                                    size: 16,
                                    color: Colors.grey.shade400,
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 4.0),
                                    child: Text(
                                      "Tanggal",
                                      style: AppStyleText.stylePoppins(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.grey.shade400,
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  Icon(
                                    Icons.expand_more_rounded,
                                    size: 16,
                                    color: Colors.grey.shade400,
                                  ),
                                ],
                              ),
                            ),
                            offset: const Offset(-10, 50),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const CustomerRow(
            isHeader: true,
            id: "ID",
            nama: "Nama",
            telp: "No Telpon",
            alamat: "Alamat",
            email: "Email",
          ),
          const SizedBox(
            height: 8,
          ),
          StreamBuilder<List<UserM>>(
            stream: custC.streamCustomer(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Expanded(
                  child: ListView(
                    children: List.generate(
                      snapshot.data?.length ?? 0,
                      (i) => CustomerRow(
                        isHeader: false,
                        id: snapshot.data![i].id,
                        nama: snapshot.data![i].nama,
                        telp: snapshot.data![i].noTelp,
                        alamat: snapshot.data![i].alamat,
                        email: snapshot.data![i].email,
                        onTapEdit: () => AppDialog.dialogAddCustomer(context,
                            user: snapshot.data![i]),
                        onTapDelete: () {
                          AppDialog.dialogWithQuestion(
                            context,
                            "Hapus",
                            "Anda yakin ingin menghapus data ini?",
                            "Batal",
                            "Hapus!",
                            () {
                              custC.deleteUser(snapshot.data![i].id);
                              Navigator.pop(context);
                            },
                          );
                        },
                      ),
                    ),
                  ),
                );
              } else {
                return const SizedBox();
              }
            },
          )
        ],
      ),
    );
  }
}
