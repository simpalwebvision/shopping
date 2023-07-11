import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:shopping/utils/common_function.dart';

class TechQrScannerScreen extends StatefulWidget {
  const TechQrScannerScreen({super.key});

  @override
  State<TechQrScannerScreen> createState() => _TechQrScannerScreenState();
}

class _TechQrScannerScreenState extends State<TechQrScannerScreen> {
  MobileScannerController cameraController = MobileScannerController();

  @override
  void initState() {
    super.initState();
    CommonFunctions().disableCapture();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Mobile Scanner'),
          actions: [
            IconButton(
              color: Colors.white,
              icon: ValueListenableBuilder(
                valueListenable: cameraController.torchState,
                builder: (context, state, child) {
                  switch (state) {
                    case TorchState.off:
                      return const Icon(Icons.flash_off, color: Colors.grey);
                    case TorchState.on:
                      return const Icon(Icons.flash_on, color: Colors.yellow);
                  }
                },
              ),
              iconSize: 32.0,
              onPressed: () => cameraController.toggleTorch(),
            ),
            IconButton(
              color: Colors.white,
              icon: ValueListenableBuilder(
                valueListenable: cameraController.cameraFacingState,
                builder: (context, state, child) {
                  switch (state) {
                    case CameraFacing.front:
                      return const Icon(Icons.camera_front);
                    case CameraFacing.back:
                      return const Icon(Icons.camera_rear);
                  }
                },
              ),
              iconSize: 32.0,
              onPressed: () => cameraController.switchCamera(),
            ),
          ],
        ),
        body: MobileScanner(
            allowDuplicates: false,
            controller: cameraController,
            onDetect: (barcode, args) {
              if (barcode.rawValue == null) {
                // debugPrint('Failed to scan Barcode');
                CommonFunctions().successMessage('Failed to scan Barcode');
              } else {
                final String code = barcode.rawValue!;
                CommonFunctions().successMessage('Barcode found! $code');
                // debugPrint('Barcode found! $code');
              }
            }));
  }
}
