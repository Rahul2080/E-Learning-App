import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Pdfreader extends StatefulWidget {
  final String pdf;
  const Pdfreader({super.key, required this.pdf});

  @override
  State<Pdfreader> createState() => _PdfreaderState();
}

class _PdfreaderState extends State<Pdfreader> {
  final GlobalKey<SfPdfViewerState> pdfViewerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SfPdfViewer.network( widget.pdf ,
    key: pdfViewerKey,));
  }
}
