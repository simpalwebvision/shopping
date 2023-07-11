import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'dart:io';

class PFDViewerPage extends StatefulWidget {
  final File? file;
  const PFDViewerPage({
    Key? key,
    this.file,
  }) : super(key: key);

  @override
  PFDViewerPageState createState() => PFDViewerPageState();
}

class PFDViewerPageState extends State<PFDViewerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        "Bill",
      )),
      body: PDFView(
        filePath: widget.file!.path,
      ),
    );
  }
}
