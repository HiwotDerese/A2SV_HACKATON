

import 'package:dozer_mobile/presentation/invoice_generator_screen/helper/pdf_helper.dart';
import 'package:dozer_mobile/presentation/invoice_generator_screen/screen_widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';

import 'package:pdf/widgets.dart' as pw;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PdfColor themeColor = PdfColors.black;
  pw.Font font = pw.Font.courier();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Invoice'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            DropdownButtonFormField(
              decoration: const InputDecoration(
                hintText: 'Select Theme color',
              ),
              items: [
                DropdownMenuItem(
                  child: Text('Black'),
                  value: PdfColors.black,
                ),
                DropdownMenuItem(
                  child: Text('Dark Grey'),
                  value: PdfColors.grey900,
                ),
                DropdownMenuItem(
                  child: Text('Green'),
                  value: PdfColors.green,
                ),
                DropdownMenuItem(
                  child: Text('Blue'),
                  value: PdfColors.blue,
                ),
              ],
              onChanged: (value) {
                setState(() {
                  themeColor = value as PdfColor;
                });
              },
            ),

            // Choose Font
            DropdownButtonFormField(
              decoration: const InputDecoration(
                hintText: 'Select Font',
              ),
              items: const [
                DropdownMenuItem(
                  child: Text('Courier'),
                  value: pw.Font.courier,
                ),
                DropdownMenuItem(
                  child: Text('Helvetica'),
                  value: pw.Font.helvetica,
                ),
                DropdownMenuItem(
                  child: Text('Times'),
                  value: pw.Font.times,
                ),
                DropdownMenuItem(
                  child: Text('ZapfDingbats'),
                  value: pw.Font.zapfDingbats,
                ),
              ],
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    // font = value;
                  });
                }
              },
            ),
            ElevatedButton(
              onPressed: () async {
                // generate pdf file
                final pdfFile = await PdfInvoiceApi.generate(
                  themeColor,
                  pw.Font.courier(),
                );

                // opening the pdf file
                FileHandleApi.openFile(pdfFile);
              },
              child:  Text('Generate Invoice'),
            ),
          ],
        ),
      ),
    );
  }
}