import 'dart:typed_data';

import 'package:flutter/material.dart';

class SignatureHelperScreen extends StatelessWidget {
  final ByteData data;
  final Size sSize;
  final String underTitle;
  const SignatureHelperScreen(
      {super.key,
      required this.data,
      required this.sSize,
      required this.underTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.memory(
          data.buffer.asUint8List(),
          height: sSize.height * 0.1,
        ),
        Text(
          underTitle,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: sSize.width * 0.033,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
