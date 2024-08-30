import 'package:codigoqr/qr_scanner_copeaire.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const QrScannerCopeaire(),
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,  // Usar Colors.transparent en lugar de Color.transparent
          elevation: 0.0,
        ),
      ),
      debugShowCheckedModeBanner: false,
      title: 'Copeaire Qr Scan',
    );
  }
}
