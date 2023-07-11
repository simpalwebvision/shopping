import 'dart:io';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:shopping/models/tech_m_exchange_model.dart';
import 'package:shopping/utils/common_function.dart';
import 'package:shopping/utils/generate_pdf/tech_pdf_api.dart';

class TechMExchangePDF {
  var netImage, todayDate;
  getinitData() async {
    netImage =
        await networkImage('https://aquanerio.com/assetsweb/images/logo1.png');
    todayDate = CommonFunctions().getCurrentDate();
  }

  Future<File?> generate(TechMachineExchangeModel? bill) async {
    final pdf = pw.Document();
    await getinitData();
    pdf.addPage(pw.MultiPage(
      build: (context) => [
        buildbody(bill, todayDate),
      ],
      header: (context) => buildTitle(context, bill, netImage),
    ));
    return TechPdfApi.saveDocument(
      name: 'bill.pdf',
      pdf: pdf,
    );
  }

  static pw.Widget buildTitle(
      pw.Context context, TechMachineExchangeModel? bill, var image) {
    return pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Row(children: [
            pw.Image(image, width: 50),
            pw.Expanded(
                child: pw.Center(
              child: pw.Text(
                'SHAHIL ENTERPRISES',
                style: pw.TextStyle(
                  fontSize: 20,
                  fontWeight: pw.FontWeight.bold,
                  color: PdfColors.red,
                ),
              ),
            )),
            pw.Container(width: 50)
          ]),
          pw.SizedBox(height: 10),
          pw.Center(
            child: pw.Text(
              'G-49, Arihant Shopping Centre,Opp.\nRly Station, Nallasopara (East),Palghar - 401 209.',
              style: const pw.TextStyle(
                fontSize: 12,
              ),
            ),
          ),
          pw.SizedBox(height: 10),
          pw.Center(
            child: pw.Text(
              'Helpline No. 8484814515/9702113771\nEmail : shahilenterprises2016@gmail com Website : www.aquanerio.com',
              style: const pw.TextStyle(
                fontSize: 12,
              ),
            ),
          ),
          pw.Divider(color: PdfColors.blue),
        ]);
  }

  static pw.Widget buildbody(TechMachineExchangeModel? bill, String date) {
    return pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.SizedBox(height: 5),
          pw.Center(
            child: pw.Container(
              padding:
                  const pw.EdgeInsets.symmetric(horizontal: 10, vertical: 7),
              decoration: pw.BoxDecoration(
                  border: pw.Border.all(color: PdfColors.red),
                  borderRadius: pw.BorderRadius.circular(8)),
              child: pw.Text(
                'ORDER FORM',
                style: pw.TextStyle(
                  fontWeight: pw.FontWeight.bold,
                  fontSize: 15,
                  color: PdfColors.red,
                ),
              ),
            ),
          ),
          pw.SizedBox(height: 5),
          pw.Row(
              // mainAxisAlignment: pw.MainAxisAlignment.center,
              crossAxisAlignment: pw.CrossAxisAlignment.center,
              children: [
                pw.Text(
                  'Date : ',
                  style: pw.TextStyle(
                    fontSize: 13,
                    fontWeight: pw.FontWeight.bold,
                    color: PdfColors.black,
                  ),
                ),
                pw.Text(
                  date,
                  style: const pw.TextStyle(
                    fontSize: 12,
                  ),
                ),
              ]),
          pw.SizedBox(height: 0.2 * PdfPageFormat.cm),
        ]);
  }
}
