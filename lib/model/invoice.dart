import 'package:generate_pdf_invoice_example/model/customer.dart';
import 'package:generate_pdf_invoice_example/model/supplier.dart';

class Invoice {
  final InvoiceInfo info;
  final Doctor doctor;
  final Patient patient;
  final List<InvoiceItem> items;

  const Invoice({
    required this.info,
    required this.doctor,
    required this.patient,
    required this.items,
  });
}

class InvoiceInfo {
  final String description;
  final String number;
  final DateTime date;
  final DateTime dueDate;

  const InvoiceInfo({
    required this.description,
    required this.number,
    required this.date,
    required this.dueDate,
  });
}

class InvoiceItem {
  final String description;
  final DateTime date;
  final int quantity;
  final String vat;
  final String unitPrice;

  const InvoiceItem({
    required this.description,
    required this.date,
    required this.quantity,
    required this.vat,
    required this.unitPrice,
  });
}

class Comments {
  final String comments;
  const Comments({
    required this.comments,
  });
}
