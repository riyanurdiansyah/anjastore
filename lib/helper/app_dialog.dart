import 'package:anjastore/presentation/controllers/invoice_controller.dart';
import 'package:anjastore/styles/app_color.dart';
import 'package:anjastore/styles/app_formatter.dart';
import 'package:anjastore/styles/app_style_text.dart';
import 'package:anjastore/styles/app_style_textfield.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'app_validator.dart';

class AppDialog {
  static dialogFormInvoice(BuildContext context) {
    final invC = Get.put(InvoiceController());
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          content: SizedBox(
            width: Get.width / 3,
            child: Form(
              key: invC.formAddInvoice,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Form Invoice',
                              style: AppStyleText.styleAbeezee(
                                fontWeight: FontWeight.w800,
                                fontSize: 18,
                              ),
                            ),
                            InkWell(
                              onTap: () => Navigator.pop(context),
                              child: const Icon(
                                Icons.close_rounded,
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
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Kode Invoice",
                    style: AppStyleText.stylePoppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  StreamBuilder<int>(
                    stream: invC.streamKode(),
                    builder: (context, snapshot) => TextFormField(
                      readOnly: true,
                      controller: invC.tcNoTransaksiInvoice,
                      textAlignVertical: TextAlignVertical.top,
                      scrollPadding: const EdgeInsets.symmetric(vertical: 20),
                      style: AppStyleText.stylePoppins(
                        fontSize: 14,
                        height: 1.4,
                      ),
                      decoration: AppStyleTextfield.formInvoiceDescStyle(
                        hintText: '',
                        fontSize: 14,
                      ),
                      onChanged: (val) => {},
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) => AppValidator.requiredField(value!),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Tanggal Invoice",
                              style: AppStyleText.stylePoppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey.shade600,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              readOnly: true,
                              controller: invC.tcTglInvoice,
                              style: AppStyleText.stylePoppins(
                                fontSize: 14,
                              ),
                              decoration:
                                  AppStyleTextfield.formInvoiceDateStyle(
                                hintText: '',
                                fontSize: 14,
                                onTapDate: () async {
                                  final date = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1992, 1, 1),
                                    lastDate: DateTime.now(),
                                  );
                                  invC.tcTglInvoice.text =
                                      DateFormat.yMMMMd('id').format(date!);
                                },
                              ),
                              onChanged: (val) => {},
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) =>
                                  AppValidator.requiredField(value!),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Jatuh Tempo",
                              style: AppStyleText.stylePoppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey.shade600,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: invC.tcJthTempoInvoice,
                              style: AppStyleText.stylePoppins(
                                fontSize: 14,
                              ),
                              decoration:
                                  AppStyleTextfield.formInvoiceDateStyle(
                                      hintText: '',
                                      fontSize: 14,
                                      onTapDate: () async {
                                        final date = await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(1992, 1, 1),
                                          lastDate: DateTime.now(),
                                        );
                                        invC.tcJthTempoInvoice.text =
                                            DateFormat.yMMMMd('id')
                                                .format(date!);
                                      }),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) =>
                                  AppValidator.requiredField(value!),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Deskripsi",
                    style: AppStyleText.stylePoppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 125,
                    child: TextFormField(
                      controller: invC.tcDeskripsiInvoice,
                      textAlignVertical: TextAlignVertical.top,
                      keyboardType: TextInputType.multiline,
                      scrollPadding: const EdgeInsets.symmetric(vertical: 20),
                      maxLines: null,
                      minLines: null,
                      expands: true,
                      style: AppStyleText.stylePoppins(
                        fontSize: 14,
                        height: 1.4,
                      ),
                      decoration: AppStyleTextfield.formInvoiceDescStyle(
                        hintText: '',
                        fontSize: 14,
                      ),
                      onChanged: (val) => {},
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) => AppValidator.requiredField(value!),
                    ),
                  ),
                  Obx(
                    () {
                      if (invC.listBarang.isEmpty) {
                        return Column(
                          children: [
                            const SizedBox(
                              height: 25,
                            ),
                            Text(
                              "*Tidak ada barang yang diinput",
                              style: AppStyleText.stylePoppins(
                                fontSize: 12,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        );
                      } else {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 16,
                            ),
                            Text(
                              "Detail Barang",
                              style: AppStyleText.stylePoppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey.shade600,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Column(
                              children: List.generate(
                                invC.listBarang.length,
                                (i) => Row(
                                  children: [
                                    Text(
                                      "${(i + 1)}. ${invC.listBarang[i].nama}",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: AppStyleText.stylePoppins(
                                        fontSize: 12,
                                        color: Colors.blue,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 16,
                                    ),
                                    const Spacer(),
                                    InkWell(
                                      onTap: () => invC.listBarang.removeAt(i),
                                      child: const Icon(
                                        Icons.close_rounded,
                                        color: Colors.red,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      }
                    },
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                    width: Get.width,
                    height: 45,
                    child: OutlinedButton(
                      onPressed: () async => await dialogAddBarang(context),
                      child: Text(
                        'Tambah Barang',
                        style: AppStyleText.stylePoppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: primaryColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 45,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.grey.shade300,
                            ),
                            onPressed: () => Navigator.pop(context),
                            child: Text(
                              'Batal',
                              style: AppStyleText.stylePoppins(
                                fontSize: 14,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 45,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.blue,
                            ),
                            onPressed: () {
                              if (invC.formAddInvoice.currentState!
                                  .validate()) {
                                invC.addInvoice();
                                Navigator.pop(context);
                              }
                            },
                            child: Text(
                              'Tambah',
                              style: AppStyleText.stylePoppins(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static dialogAddBarang(BuildContext context) {
    final invC = Get.put(InvoiceController());
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        content: SizedBox(
          width: Get.width / 3,
          child: Form(
            key: invC.formAddBarang,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Tambah Barang',
                            style: AppStyleText.styleAbeezee(
                              fontWeight: FontWeight.w800,
                              fontSize: 18,
                            ),
                          ),
                          InkWell(
                            onTap: () => Navigator.pop(context),
                            child: const Icon(
                              Icons.close_rounded,
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
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Nama Barang",
                  style: AppStyleText.stylePoppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                StreamBuilder<List<String>>(
                  stream: invC.streamBarang(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return DropdownSearch<String>(
                        popupProps: const PopupProps.menu(
                          showSelectedItems: true,
                          fit: FlexFit.loose,
                        ),
                        items: snapshot.data!,
                        dropdownDecoratorProps: DropDownDecoratorProps(
                          dropdownSearchDecoration:
                              AppStyleTextfield.formInvoiceDescStyle(
                            hintText: '',
                            fontSize: 14,
                          ),
                        ),
                        onChanged: (val) => invC.onChangedNamaBarang(val),
                        selectedItem: invC.namaBarang.value,
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  "Harga",
                  style: AppStyleText.stylePoppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: invC.tcHargaBarang,
                  textAlignVertical: TextAlignVertical.top,
                  scrollPadding: const EdgeInsets.symmetric(vertical: 20),
                  style: AppStyleText.stylePoppins(
                    fontSize: 14,
                    height: 1.4,
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                    AppRupiahText(),
                  ],
                  decoration: AppStyleTextfield.formInvoiceDescStyle(
                    hintText: '',
                    fontSize: 14,
                  ),
                  onChanged: (val) => {},
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) => AppValidator.requiredField(value!),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  "Qty",
                  style: AppStyleText.stylePoppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: invC.tcQtyBarang,
                  textAlignVertical: TextAlignVertical.top,
                  scrollPadding: const EdgeInsets.symmetric(vertical: 20),
                  style: AppStyleText.stylePoppins(
                    fontSize: 14,
                    height: 1.4,
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: AppStyleTextfield.formInvoiceDescStyle(
                    hintText: '',
                    fontSize: 14,
                  ),
                  onChanged: (val) => {},
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) => AppValidator.requiredField(value!),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  "Deskripsi",
                  style: AppStyleText.stylePoppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 125,
                  child: TextFormField(
                    controller: invC.tcDeskripsiBarang,
                    textAlignVertical: TextAlignVertical.top,
                    keyboardType: TextInputType.multiline,
                    scrollPadding: const EdgeInsets.symmetric(vertical: 20),
                    maxLines: null,
                    minLines: null,
                    expands: true,
                    style: AppStyleText.stylePoppins(
                      fontSize: 14,
                      height: 1.4,
                    ),
                    decoration: AppStyleTextfield.formInvoiceDescStyle(
                      hintText: '',
                      fontSize: 14,
                    ),
                    onChanged: (val) => {},
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) => AppValidator.requiredField(value!),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 45,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.grey.shade300,
                          ),
                          onPressed: () => Navigator.pop(context),
                          child: Text(
                            'Batal',
                            style: AppStyleText.stylePoppins(
                              fontSize: 14,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 45,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                          ),
                          onPressed: () {
                            if (invC.formAddBarang.currentState!.validate()) {
                              invC.addBarang();
                              Navigator.pop(context);
                            }
                          },
                          child: Text(
                            'Tambah',
                            style: AppStyleText.stylePoppins(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
