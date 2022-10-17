import 'package:anjastore/constanta.dart';
import 'package:anjastore/helper/app_dialog.dart';
import 'package:anjastore/models/barang_m.dart';
import 'package:anjastore/models/invoice_m.dart';
import 'package:anjastore/presentation/controllers/invoice_controller.dart';
import 'package:anjastore/presentation/pages/widget/row_invoice.dart';
import 'package:anjastore/styles/app_responsive.dart';
import 'package:anjastore/styles/app_style_text.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widget/row_sub_invoice.dart';

class InvoicePage extends StatelessWidget {
  InvoicePage({Key? key}) : super(key: key);

  final invC = Get.put(InvoiceController());

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
                      'Semua Invoices',
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
          // Container(
          //   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          //   width: double.infinity,
          //   child: Row(
          //     children: [
          //       Expanded(
          //         flex: 2,
          //         child: SizedBox(
          //           height: 40,
          //           child: TextField(
          //             style: AppStyleText.stylePoppins(
          //               fontSize: 14,
          //               color: Colors.black,
          //             ),
          //             decoration: InputDecoration(
          //               filled: true,
          //               fillColor: const Color.fromRGBO(241, 242, 244, 1),
          //               border: OutlineInputBorder(
          //                 borderSide:
          //                     const BorderSide(width: 0.2, color: Colors.grey),
          //                 borderRadius: BorderRadius.circular(6),
          //               ),
          //               focusedBorder: OutlineInputBorder(
          //                 borderSide:
          //                     const BorderSide(width: 0.2, color: Colors.grey),
          //                 borderRadius: BorderRadius.circular(6),
          //               ),
          //               enabledBorder: OutlineInputBorder(
          //                 borderSide:
          //                     const BorderSide(width: 0.2, color: Colors.white),
          //                 borderRadius: BorderRadius.circular(6),
          //               ),
          //               hintText: "Cari invoice disini....",
          //               hintStyle: AppStyleText.styleLato(
          //                 color: Colors.grey,
          //                 fontSize: 14,
          //                 height: 1.5,
          //               ),
          //               suffixIcon: IconButton(
          //                 icon: const Icon(
          //                   Icons.highlight_remove_rounded,
          //                   size: 18,
          //                 ),
          //                 onPressed: () {},
          //                 color: Colors.grey,
          //               ),
          //               prefixIcon: IconButton(
          //                 icon: const Icon(
          //                   Icons.search_rounded,
          //                   size: 18,
          //                 ),
          //                 onPressed: () {},
          //                 color: Colors.grey,
          //               ),
          //             ),
          //           ),
          //         ),
          //       ),
          //       if (!AppResponsive.isMobile(context))
          //         const Expanded(
          //           flex: 4,
          //           child: SizedBox(),
          //         ),
          //       if (!AppResponsive.isMobile(context))
          //         SizedBox(
          //           child: Row(
          //             children: [
          //               SizedBox(
          //                 height: 55,
          //                 child: CustomPopUpMenu(
          //                   listMenu: List.generate(
          //                     listSortName.length,
          //                     (index) => PopupMenuItem(
          //                       onTap: () {},
          //                       child: Row(
          //                         children: [
          //                           const Icon(
          //                             Icons.abc_rounded,
          //                             size: 16,
          //                           ),
          //                           const SizedBox(
          //                             width: 16,
          //                           ),
          //                           Text(
          //                             listSortName[index].title!,
          //                             style: AppStyleText.stylePoppins(
          //                               fontSize: 14,
          //                               color: Colors.black87,
          //                               fontWeight: FontWeight.w500,
          //                             ),
          //                           ),
          //                         ],
          //                       ),
          //                     ),
          //                   ),
          //                   icon: Container(
          //                     height: 55,
          //                     padding:
          //                         const EdgeInsets.symmetric(horizontal: 12),
          //                     decoration: BoxDecoration(
          //                       borderRadius: BorderRadius.circular(8),
          //                       border: Border.all(
          //                         width: 2,
          //                         color: Colors.grey.shade300,
          //                       ),
          //                     ),
          //                     child: Row(
          //                       children: [
          //                         Icon(
          //                           Icons.abc_rounded,
          //                           size: 18,
          //                           color: Colors.grey.shade400,
          //                         ),
          //                         const SizedBox(
          //                           width: 12,
          //                         ),
          //                         Padding(
          //                           padding: const EdgeInsets.only(top: 4.0),
          //                           child: Text(
          //                             "Nama",
          //                             style: AppStyleText.stylePoppins(
          //                               fontSize: 12,
          //                               fontWeight: FontWeight.w600,
          //                               color: Colors.grey.shade400,
          //                             ),
          //                           ),
          //                         ),
          //                         const Spacer(),
          //                         Icon(
          //                           Icons.expand_more_rounded,
          //                           size: 16,
          //                           color: Colors.grey.shade400,
          //                         ),
          //                       ],
          //                     ),
          //                   ),
          //                   offset: const Offset(-10, 50),
          //                 ),
          //               ),
          //               SizedBox(
          //                 height: 55,
          //                 child: CustomPopUpMenu(
          //                   listMenu: List.generate(
          //                     listSortDate.length,
          //                     (index) => PopupMenuItem(
          //                       onTap: () {},
          //                       child: Row(
          //                         children: [
          //                           const Icon(
          //                             Icons.date_range_rounded,
          //                             size: 16,
          //                           ),
          //                           const SizedBox(
          //                             width: 16,
          //                           ),
          //                           Text(
          //                             listSortDate[index].title!,
          //                           ),
          //                         ],
          //                       ),
          //                     ),
          //                   ),
          //                   icon: Container(
          //                     height: 55,
          //                     padding:
          //                         const EdgeInsets.symmetric(horizontal: 12),
          //                     decoration: BoxDecoration(
          //                       borderRadius: BorderRadius.circular(8),
          //                       border: Border.all(
          //                         width: 2,
          //                         color: Colors.grey.shade300,
          //                       ),
          //                     ),
          //                     child: Row(
          //                       children: [
          //                         Icon(
          //                           Icons.date_range_rounded,
          //                           size: 16,
          //                           color: Colors.grey.shade400,
          //                         ),
          //                         const SizedBox(
          //                           width: 12,
          //                         ),
          //                         Padding(
          //                           padding: const EdgeInsets.only(top: 4.0),
          //                           child: Text(
          //                             "Tanggal",
          //                             style: AppStyleText.stylePoppins(
          //                               fontSize: 12,
          //                               fontWeight: FontWeight.w600,
          //                               color: Colors.grey.shade400,
          //                             ),
          //                           ),
          //                         ),
          //                         const Spacer(),
          //                         Icon(
          //                           Icons.expand_more_rounded,
          //                           size: 16,
          //                           color: Colors.grey.shade400,
          //                         ),
          //                       ],
          //                     ),
          //                   ),
          //                   offset: const Offset(-10, 50),
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),
          //     ],
          //   ),
          // ),
          const InvoiceRow(
            isHeader: true,
            kdInvoice: "Invoice",
            dueDateInvoice: "Kadaluarsa",
            validateProduk: "Validasi Produk",
            description: "Deskripsi",
            price: "Harga",
            total: "Total",
            status: "",
            namaCustomer: "Customer",
            id: '',
          ),
          const SizedBox(
            height: 5,
          ),
          StreamBuilder<List<InvoiceM>>(
            stream: invC.streamInvoice(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Expanded(
                  child: ListView(
                    children: List.generate(
                      snapshot.data?.length ?? 0,
                      (index) {
                        final data = snapshot.data![index];
                        return StreamBuilder<List<BarangM>>(
                          stream: invC.streamSubInvoice(data.id),
                          builder: (context, snapshotSub) {
                            if (snapshot.hasData) {
                              return ExpandableNotifier(
                                child: ScrollOnExpand(
                                  child: ExpandablePanel(
                                    theme: const ExpandableThemeData(
                                      hasIcon: false,
                                      headerAlignment:
                                          ExpandablePanelHeaderAlignment.center,
                                      expandIcon: Icons.add_rounded,
                                      collapseIcon: Icons.remove_rounded,
                                      animationDuration:
                                          Duration(milliseconds: 800),
                                    ),
                                    collapsed: const SizedBox(),
                                    expanded: snapshotSub.hasData
                                        ? snapshot.data!.isEmpty
                                            ? Container(
                                                margin: EdgeInsets.symmetric(
                                                  horizontal:
                                                      AppResponsive.isMobile(
                                                              context)
                                                          ? 8
                                                          : 20,
                                                ),
                                                color: Colors.grey.shade100,
                                                height: 80,
                                                width: Get.width,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "Tidak ada item untuk invoice ini",
                                                      style: AppStyleText
                                                          .stylePoppins(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Colors
                                                            .grey.shade400,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 6,
                                                    ),
                                                    ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        primary: Colors.blue,
                                                      ),
                                                      onPressed: () {},
                                                      child: Text(
                                                        "Tambah",
                                                        style: AppStyleText
                                                            .styleAbeezee(
                                                          fontSize: 14,
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            : Container(
                                                margin: EdgeInsets.symmetric(
                                                  horizontal:
                                                      AppResponsive.isMobile(
                                                              context)
                                                          ? 8
                                                          : 20,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: Colors.grey.shade100,
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                ),
                                                child: Column(
                                                  children: [
                                                    const SubInvoiceRow(
                                                      isHeader: true,
                                                      namaBarang: "Item",
                                                      deskripsiBarang:
                                                          "Deskripsi",
                                                      hargaBarang: "Harga",
                                                      qty: "Qty",
                                                      subTotal: "Sub Total",
                                                    ),
                                                    Column(
                                                      children: List.generate(
                                                          snapshotSub.data
                                                                  ?.length ??
                                                              0, (subIndex) {
                                                        final sub = snapshotSub
                                                            .data!
                                                            .toList()[subIndex];
                                                        return SubInvoiceRow(
                                                          isHeader: false,
                                                          namaBarang: sub.nama,
                                                          deskripsiBarang:
                                                              sub.deskripsi,
                                                          hargaBarang:
                                                              currencyFormatterCompact
                                                                  .format(sub
                                                                      .harga),
                                                          qty: "${sub.qty}pcs",
                                                          subTotal:
                                                              currencyFormatterCompact
                                                                  .format(sub
                                                                          .harga *
                                                                      sub.qty),
                                                        );
                                                      }),
                                                    ),
                                                  ],
                                                ),
                                              )
                                        : const SizedBox(),
                                    header: InvoiceRow(
                                        isHeader: false,
                                        kdInvoice: "AJSTORE${data.noTransaksi}",
                                        dueDateInvoice: data.jatuhTempo,
                                        validateProduk: "validateProduk",
                                        description: data.deskripsi,
                                        price: currencyFormatterCompact
                                            .format(data.total),
                                        status: data.status,
                                        total: currencyFormatterCompact
                                            .format(data.total),
                                        namaCustomer: data.customer,
                                        id: data.id,
                                        onTapEdit: () {
                                          AppDialog.dialogFormInvoice(
                                            context,
                                            invoice: data,
                                            listBarang: snapshotSub.data,
                                          );
                                        },
                                        onTapDelete: () {
                                          AppDialog.dialogWithQuestion(
                                            context,
                                            "Hapus",
                                            "Anda yakin ingin menghapus data ini?",
                                            "Batal",
                                            "Hapus!",
                                            () {
                                              invC.deleteInvoice(data.id);
                                              Navigator.pop(context);
                                            },
                                          );
                                        }),
                                  ),
                                ),
                              );
                            } else {
                              return const SizedBox();
                            }
                          },
                        );
                      },
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
