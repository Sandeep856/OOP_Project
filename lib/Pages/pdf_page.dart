// ignore_for_file: prefer_const_constructors, unused_field, prefer_final_fields, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'package:invoice_gen/Pages/customer.dart';
import 'package:invoice_gen/Pages/invoice.dart';
import 'package:invoice_gen/Pages/supplier.dart';
import 'package:invoice_gen/Widgets/button_widget.dart';
import 'package:invoice_gen/Widgets/title_widget.dart';
import 'package:invoice_gen/api/pdf_api.dart';
import 'package:invoice_gen/api/pdf_invoice_api.dart';

class PdfPage extends StatefulWidget {
  late List<TextEditingController> desc;
  late List<TextEditingController> price;
  late List<TextEditingController> quantity;
  late int entries;
  //ignore: use_key_in_widget_constructors
  PdfPage(
      {required this.desc,
      required this.price,
      required this.quantity,
      required this.entries});
  @override
  _PdfPageState createState() => _PdfPageState();
}

class _PdfPageState extends State<PdfPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          centerTitle: true,
        ),
        body: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(32),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TitleWidget(
                      icon: Icons.picture_as_pdf,
                      text: 'Generate Invoice',
                    ),
                    const SizedBox(height: 48),
                    ButtonWidget(
                      text: 'Invoice PDF',
                      onClicked: () async {
                        final date = DateTime.now();
                        final dueDate = date.add(Duration(days: 7));

                        final invoice = Invoice(
                            supplier: Supplier(
                              name: 'Malakar',
                              address: 'BITS Pilani Goa Campus',
                              paymentInfo: 'https://paypal.me/sarahfieldzz',
                            ),
                            customer: Customer(
                              name: "",
                              address: '',
                            ),
                            info: InvoiceInfo(
                              date: date,
                              dueDate: dueDate,
                              description: 'My description...',
                              number: '${DateTime.now().year}-9999',
                            ),
                            items: [
                              for (int i = 0; i < widget.entries; i++)
                                InvoiceItem(
                                  description: widget.desc[i].text,
                                  date: DateTime.now(),
                                  quantity: int.parse(widget.quantity[i].text),
                                  vat: 0.19,
                                  unitPrice: double.parse(widget.price[i].text),
                                ),
                            ]);

                        final pdfFile = await PdfInvoiceApi.generate(invoice);

                        PdfApi.openFile(pdfFile);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
}
/**/
             /*Row(
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: "Description"),
                  controller: desccontroller[0],
                  onChanged: (v) => desccontroller[0].text = v,
                ),
                TextFormField(
                  controller: pricecontroller[0],
                  onChanged: (v) => pricecontroller[0].text = v,
                ),
                TextFormField(
                  controller: quantitycontroller[0],
                  onChanged: (v) => quantitycontroller[0].text = v,
                ),
              ],
            ),
            Row(
              children: [
                TextField(
                  decoration: InputDecoration(labelText: "Description"),
                  controller: desccontroller[1],
                  onChanged: (v) => desccontroller[1].text = v,
                ),
                TextField(
                  controller: pricecontroller[1],
                ),
                TextField(
                  controller: quantitycontroller[1],
                ),
              ],
            ),
            Row(
              children: [
                TextField(
                  decoration: InputDecoration(labelText: "Description"),
                  controller: desccontroller[2],
                  onChanged: (v) => desccontroller[2].text = v,
                ),
                TextField(
                  controller: pricecontroller[2],
                ),
                TextField(
                  controller: quantitycontroller[2],
                ),
              ],
            ),
            Row(
              children: [
                TextField(
                  decoration: InputDecoration(labelText: "Description"),
                  controller: desccontroller[3],
                  onChanged: (v) => desccontroller[3].text = v,
                ),
                TextField(
                  controller: pricecontroller[3],
                ),
                TextField(
                  controller: quantitycontroller[3],
                ),
              ],
            ),
            Row(
              children: [
                TextField(
                  decoration: InputDecoration(labelText: "Description"),
                  controller: desccontroller[4],
                  onChanged: (v) => desccontroller[4].text = v,
                ),
                TextField(
                  controller: pricecontroller[4],
                ),
                TextFormField(
                  controller: quantitycontroller[4],
                ),
              ],
            ),
            Row(
              children: [
                TextField(
                  decoration: InputDecoration(labelText: "Description"),
                  controller: desccontroller[5],
                  onChanged: (v) => desccontroller[5].text = v,
                ),
                TextField(
                  controller: pricecontroller[5],
                ),
                TextField(
                  controller: quantitycontroller[5],
                ),
              ],
            ),
            Row(
              children: [
                TextField(
                  decoration: InputDecoration(labelText: "Description"),
                  controller: desccontroller[6],
                  onChanged: (v) => desccontroller[6].text = v,
                ),
                TextField(
                  controller: pricecontroller[6],
                ),
                TextField(
                  controller: quantitycontroller[6],
                ),
              ],
            ),*/
             /*InvoiceItem(
                              description: widget.desc[0].text,
                              date: DateTime.now(),
                              quantity: 8,
                              vat: 0.19,
                              unitPrice: 0.99,
                            ),
                            InvoiceItem(
                              description: widget.desc[0].text,
                              date: DateTime.now(),
                              quantity: 3,
                              vat: 0.19,
                              unitPrice: 2.99,
                            ),
                            InvoiceItem(
                              description: widget.desc[0].text,
                              date: DateTime.now(),
                              quantity: 8,
                              vat: 0.19,
                              unitPrice: 3.99,
                            ),
                            InvoiceItem(
                              description: widget.desc[0].text,
                              date: DateTime.now(),
                              quantity: 1,
                              vat: 0.19,
                              unitPrice: 1.59,
                            ),
                            InvoiceItem(
                              description: widget.desc[0].text,
                              date: DateTime.now(),
                              quantity: 5,
                              vat: 0.19,
                              unitPrice: 0.99,
                            ),
                            InvoiceItem(
                              description: widget.desc[0].text,
                              date: DateTime.now(),
                              quantity: 4,
                              vat: 0.19,
                              unitPrice: 1.29,
                            ),*/