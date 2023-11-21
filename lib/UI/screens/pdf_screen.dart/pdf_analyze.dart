import 'dart:io';
import 'package:cpa/UI/screens/pdf_screen.dart/pdf_api.dart';
import 'package:cpa/export.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import 'package:cpa/data/analyze_data.dart';

class PdfAnalyzeApi {
  static Future<File> generate(AnalyzeData analyze) async {
    final pdf = pw.Document();

    final doc = pw.Document();

    doc.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Text('Hello World'),
          ); // Center
        })); // Pag

    return PdfApi.saveDocument(name: 'my_analyze.pdf', pdf: pdf);
  }
}
