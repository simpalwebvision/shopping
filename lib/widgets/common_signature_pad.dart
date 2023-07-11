import 'package:flutter/material.dart';
import 'package:shopping/utils/constant.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
import 'dart:ui' as ui;

class CommonSignaturePad extends StatefulWidget {
  const CommonSignaturePad({super.key});

  @override
  State<CommonSignaturePad> createState() => _CommonSignaturePadState();
}

class _CommonSignaturePadState extends State<CommonSignaturePad> {
  final GlobalKey<SfSignaturePadState> signatureGlobalKey = GlobalKey();
  dynamic bytes;
  void _handleClearButtonPressed() {
    signatureGlobalKey.currentState!.clear();
  }

  void _handleSaveButtonPressed() async {
    final data =
        await signatureGlobalKey.currentState!.toImage(pixelRatio: 3.0);

    bytes = await data.toByteData(format: ui.ImageByteFormat.png);
    if (mounted) {
      Navigator.pop(context, bytes);
    }
    // await Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (BuildContext context) {
    //       return Scaffold(
    //         appBar: AppBar(),
    //         body: Center(
    //           child: Container(
    //             color: Colors.grey[300],
    //             child: Image.memory(bytes!.buffer.asUint8List()),
    //           ),
    //         ),
    //       );
    //     },
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          SfSignaturePad(
              key: signatureGlobalKey,
              backgroundColor: Colors.white,
              strokeColor: Colors.black,
              minimumStrokeWidth: 1.0,
              maximumStrokeWidth: 4.0),
          Positioned(
              bottom: 10,
              child: SizedBox(
                width: size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(darkPrimaryColor),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12))),
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 20)),
                        ),
                        onPressed: () {
                          _handleSaveButtonPressed();
                        },
                        child: const Text('Done')),
                    ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(darkPrimaryColor),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12))),
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 20)),
                        ),
                        onPressed: () {
                          _handleClearButtonPressed();
                        },
                        child: const Text('Clear'))
                  ],
                ),
              ))
        ],
      )),
    );
  }
}
