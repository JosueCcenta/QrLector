import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrScannerWidget extends StatefulWidget {
  final Function(String) onCodeScanned;

  const QrScannerWidget({super.key, required this.onCodeScanned});

  @override
  _QrScannerWidgetState createState() => _QrScannerWidgetState();
}

class _QrScannerWidgetState extends State<QrScannerWidget> {
  String? lastScannedCode;

  @override
  Widget build(BuildContext context) {
    return MobileScanner(
      onDetect: (barcodeCapture) {
        final barcode = barcodeCapture.barcodes.first;
        final String code = barcode.rawValue ?? '---';

        if (code != lastScannedCode) {
          lastScannedCode = code;
          widget.onCodeScanned(code);
        }
      },
    );
  }
}
