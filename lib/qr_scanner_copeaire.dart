import 'package:flutter/material.dart';
import 'constants.dart';
import 'qr_scanner_widget.dart';
import 'web_socket_service.dart';

class QrScannerCopeaire extends StatefulWidget {
  const QrScannerCopeaire({super.key});

  @override
  _QrScannerCopeaireState createState() => _QrScannerCopeaireState();
}

class _QrScannerCopeaireState extends State<QrScannerCopeaire> {
  late WebSocketService _webSocketService;

  @override
  void initState() {
    super.initState();
    _webSocketService = WebSocketService('wss://apiupdatesheet.onrender.com');
  }

  @override
  void dispose() {
    _webSocketService.dispose();
    super.dispose();
  }

  void _handleCodeScanned(String code) {
    _webSocketService.sendCode(code);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Código QR Enviado: $code'),
        backgroundColor: Colors.blue,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

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
      body: StreamBuilder<String?>(
        stream: _webSocketService.messageStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Respuesta del Servidor: ${snapshot.data}'),
                  backgroundColor: Colors.green,
                  behavior: SnackBarBehavior.floating,
                ),
              );
            });
          }

          return Container(
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
                    onCodeScanned: _handleCodeScanned,
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
          );
        },
      ),
    );
  }
}
