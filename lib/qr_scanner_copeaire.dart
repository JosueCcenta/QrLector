import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

const bgColor = Color(0xfffafafa);

class QrScannerCopeaire extends StatefulWidget {
  const QrScannerCopeaire({super.key});

  @override
  _QrScannerCopeaireState createState() => _QrScannerCopeaireState();
}

class _QrScannerCopeaireState extends State<QrScannerCopeaire> {
  String? lastScannedCode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Scanner Qr Copeaire",
          style: TextStyle(
            color: Colors.blue,
            fontSize: 28,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
        backgroundColor: bgColor,
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Por favor pon el Qr en el área indicada",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "El escáner iniciará de forma automática",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: MobileScanner(
                onDetect: (barcodeCapture) {
                  final barcode = barcodeCapture.barcodes.first;
                  final String code = barcode.rawValue ?? '---';

                  if (code != lastScannedCode) {
                    lastScannedCode = code;
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Código QR Detectado: $code'),
                        backgroundColor:
                            Colors.green, 
                        behavior: SnackBarBehavior
                            .floating, 
                      ),
                    );
                  }
                },
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: const Text(
                  "Development by: Team Refriperu",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
