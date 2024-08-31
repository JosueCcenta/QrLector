import 'package:flutter/material.dart';
import 'qr_scanner_widget.dart';
import 'constants.dart';

class QrScannerCopeaire extends StatelessWidget {
  const QrScannerCopeaire({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Scanner Qr Copeaire", style: appBarTextStyle),
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
                  Text("Por favor pon el Qr en el área indicada", style: bodyTextStyle, textAlign: TextAlign.center),
                  SizedBox(height: 10),
                  Text("El escáner iniciará de forma automática", style: TextStyle(fontSize: 16, color: Colors.black), textAlign: TextAlign.center),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: QrScannerWidget(
                onCodeScanned: (code) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Código QR Detectado: $code'),
                      backgroundColor: Colors.green,
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: const Text(
                  "Development by: Team Refriperu",
                  style: bodyTextStyle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
