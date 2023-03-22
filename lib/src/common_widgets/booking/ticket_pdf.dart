// import 'package:flutter/material.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;

// // // On Flutter, use the [path_provider](https://pub.dev/packages/path_provider) library:
// // //   final output = await getTemporaryDirectory();
// // //   final file = File("${output.path}/example.pdf");
// // final file = File("example.pdf");
// // await file.writeAsBytes(await pdf.save());

// class TicketPDF extends StatelessWidget {
//   const TicketPDF({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final pdf = pw.Document();
    

// pdf.addPage(
//   pw.Page(
//       pageFormat: PdfPageFormat.a4,
//       build: (pw.Context context) {
//         return pw.Center(
//           child: pw.Text("Hello World"),
//         ); // Center
//       }));
//   }
// }