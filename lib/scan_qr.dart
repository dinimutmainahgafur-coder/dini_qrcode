import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScanQRPage extends StatefulWidget {
  const ScanQRPage({super.key});

  @override
  State<ScanQRPage> createState() => _ScanQRPageState();
}

class _ScanQRPageState extends State<ScanQRPage> {
  final MobileScannerController controller = MobileScannerController();

  String result = "Belum ada hasil scan";

  bool isScanned = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void resetScanner() {
    setState(() {
      result = "Belum ada hasil scan";
      isScanned = false;
    });

    controller.start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FA),

      appBar: AppBar(
        title: const Text("Scan QR Code"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: Column(
        children: [

          const SizedBox(height: 20),

          const Text(
            "Arahkan kamera ke QR Code",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),

          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),

              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),

                child: MobileScanner(

                  controller: controller,

                  onDetect: (capture) {

                    if (isScanned) return;

                    final Barcode barcode = capture.barcodes.first;

                    final String? code = barcode.rawValue;

                    if (code != null) {

                      setState(() {

                        result = code;

                        isScanned = true;

                      });

                      controller.stop();

                    }

                  },

                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          Card(
            elevation: 6,
            margin: const EdgeInsets.symmetric(horizontal: 20),

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),

            child: Padding(
              padding: const EdgeInsets.all(20),

              child: Column(

                children: [

                  const Row(

                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [

                      Icon(
                        Icons.check_circle,
                        color: Colors.green,
                      ),

                      SizedBox(width: 10),

                      Text(
                        "Hasil Scan",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),

                    ],
                  ),

                  const SizedBox(height: 15),

                  SelectableText(
                    result,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,
                    height: 50,

                    child: ElevatedButton.icon(

                      icon: const Icon(Icons.refresh),

                      label: const Text(
                        "Scan Lagi",
                        style: TextStyle(fontSize: 17),
                      ),

                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),

                      onPressed: resetScanner,

                    ),
                  )

                ],
              ),
            ),
          ),

          const SizedBox(height: 20),

        ],
      ),
    );
  }
}