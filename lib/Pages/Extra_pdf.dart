// ignore_for_file: prefer_const_constructors, unused_field, prefer_final_fields, prefer_const_literals_to_create_immutables, file_names

import 'package:flutter/material.dart';

import 'package:invoice_gen/Pages/customer.dart';
import 'package:invoice_gen/Pages/invoice.dart';
import 'package:invoice_gen/Pages/supplier.dart';
import 'package:invoice_gen/Widgets/button_widget.dart';
import 'package:invoice_gen/Widgets/title_widget.dart';
import 'package:invoice_gen/api/pdf_api.dart';
import 'package:invoice_gen/api/pdf_invoice_api.dart';

class Extra_pdf extends StatefulWidget {
  @override
  _Extra_pdfState createState() => _Extra_pdfState();
}

class _Extra_pdfState extends State<Extra_pdf> {
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
                            name: 'INS Inc.',
                            address: 'BITS Pilani Goa Campus',
                          ),
                          info: InvoiceInfo(
                            date: date,
                            dueDate: dueDate,
                            description: 'My description...',
                            number: '${DateTime.now().year}-9999',
                          ),
                          items: [
                            InvoiceItem(
                              description: 'Coffee',
                              date: DateTime.now(),
                              quantity: 3,
                              vat: 0.19,
                              unitPrice: 5.99,
                            ),
                            InvoiceItem(
                              description: 'Water',
                              date: DateTime.now(),
                              quantity: 8,
                              vat: 0.19,
                              unitPrice: 0.99,
                            ),
                            InvoiceItem(
                              description: 'Orange',
                              date: DateTime.now(),
                              quantity: 3,
                              vat: 0.19,
                              unitPrice: 2.99,
                            ),
                            InvoiceItem(
                              description: 'Apple',
                              date: DateTime.now(),
                              quantity: 8,
                              vat: 0.19,
                              unitPrice: 3.99,
                            ),
                            InvoiceItem(
                              description: 'Mango',
                              date: DateTime.now(),
                              quantity: 1,
                              vat: 0.19,
                              unitPrice: 1.59,
                            ),
                            InvoiceItem(
                              description: 'Blue Berries',
                              date: DateTime.now(),
                              quantity: 5,
                              vat: 0.19,
                              unitPrice: 0.99,
                            ),
                            InvoiceItem(
                              description: 'Lemon',
                              date: DateTime.now(),
                              quantity: 4,
                              vat: 0.19,
                              unitPrice: 1.29,
                            ),
                          ],
                        );

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

class Extra_pdf1 extends StatefulWidget {
  const Extra_pdf1({Key? key}) : super(key: key);

  @override
  _Extra_pdf1State createState() => _Extra_pdf1State();
}

class _Extra_pdf1State extends State<Extra_pdf1> {
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
                            name: 'INS Inc.',
                            address: 'BITS Pilani Goa Campus',
                          ),
                          info: InvoiceInfo(
                            date: date,
                            dueDate: dueDate,
                            description: 'My description...',
                            number: '${DateTime.now().year}-9999',
                          ),
                          items: [
                            InvoiceItem(
                              description: 'Biscuit Pack',
                              date: DateTime.now(),
                              quantity: 100,
                              vat: 0.19,
                              unitPrice: 20,
                            ),
                            InvoiceItem(
                              description: 'Soaps',
                              date: DateTime.now(),
                              quantity: 5,
                              vat: 0.19,
                              unitPrice: 50,
                            ),
                            InvoiceItem(
                              description: 'Icecream',
                              date: DateTime.now(),
                              quantity: 26,
                              vat: 0.19,
                              unitPrice: 15,
                            ),
                            InvoiceItem(
                              description: 'Erasers',
                              date: DateTime.now(),
                              quantity: 2,
                              vat: 0.19,
                              unitPrice: 50,
                            ),
                            InvoiceItem(
                              description: 'Hangers',
                              date: DateTime.now(),
                              quantity: 10,
                              vat: 0.19,
                              unitPrice: 20,
                            ),
                            InvoiceItem(
                              description: 'Watch',
                              date: DateTime.now(),
                              quantity: 200,
                              vat: 0.19,
                              unitPrice: 10,
                            ),
                            InvoiceItem(
                              description: 'Choclates',
                              date: DateTime.now(),
                              quantity: 10,
                              vat: 0.19,
                              unitPrice: 40,
                            ),
                          ],
                        );

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
             /**/