import 'package:flutter/material.dart';
import 'package:generate_pdf_invoice_example/api/pdf_api.dart';
import 'package:generate_pdf_invoice_example/api/pdf_invoice_api.dart';
import 'package:generate_pdf_invoice_example/main.dart';
import 'package:generate_pdf_invoice_example/model/customer.dart';
import 'package:generate_pdf_invoice_example/model/invoice.dart';
import 'package:generate_pdf_invoice_example/model/supplier.dart';
import 'package:generate_pdf_invoice_example/widget/button_widget.dart';
import 'package:generate_pdf_invoice_example/widget/title_widget.dart';

class PdfPage extends StatefulWidget {
  @override
  _PdfPageState createState() => _PdfPageState();
}

class _PdfPageState extends State<PdfPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text(MyApp.title),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.all(32),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TitleWidget(
                  icon: Icons.picture_as_pdf,
                  text: 'Report',
                ),
                const SizedBox(height: 48),
                ButtonWidget(
                  text: 'Report PDF',
                  onClicked: () async {
                    final date = DateTime.now();
                    final dueDate = date.add(Duration(days: 7));

                    final invoice = Invoice(
                      doctor: Doctor(
                        name: 'Dr Mubashir MBBS',
                        address: 'Sarah Street 9, 6th road, Rawalpindi',
                        paymentInfo: '03403117405',
                      ),
                      patient: Patient(
                        name: '',
                        address: '',
                      ),
                      info: InvoiceInfo(
                        date: date,
                        dueDate: dueDate,
                        description: ' Description...',
                        number: '${DateTime.now().year}-9999',
                      ),
                      items: [
                        InvoiceItem(
                          description: 'ali',
                          date: DateTime.now(),
                          quantity: 3,
                          vat: 'positive',
                          unitPrice: 'Male',
                        ),
                        InvoiceItem(
                          description: 'rash',
                          date: DateTime.now(),
                          quantity: 8,
                          vat: 'negative',
                          unitPrice: 'male',
                        ),
                        InvoiceItem(
                          description: ' Saif',
                          date: DateTime.now(),
                          quantity: 3,
                          vat: 'positive',
                          unitPrice: 'female',
                        ),
                        InvoiceItem(
                          description: 'saad',
                          date: DateTime.now(),
                          quantity: 8,
                          vat: 'positive',
                          unitPrice: 'Male',
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
      );
}
