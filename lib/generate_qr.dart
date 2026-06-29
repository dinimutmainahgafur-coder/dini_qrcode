import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenerateQRCodePage extends StatefulWidget {
  const GenerateQRCodePage({super.key});

  @override
  State<GenerateQRCodePage> createState() => _GenerateQRCodePageState();
}

class _GenerateQRCodePageState extends State<GenerateQRCodePage> {
  final TextEditingController controller = TextEditingController();

  String qrData = "https://is.uad.ac.id";

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void generateQR() {
    if (controller.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Silakan masukkan data terlebih dahulu."),
        ),
      );
      return;
    }

    setState(() {
      qrData = controller.text.trim();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Generate QR Code"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [

              const SizedBox(height: 10),

              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(
                  Icons.qr_code_2,
                  size: 80,
                  color: Colors.blue,
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                "Generate QR Code",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                "Masukkan teks atau link yang ingin diubah menjadi QR Code.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 30),

              TextField(
                controller: controller,
                maxLines: 2,
                decoration: InputDecoration(
                  hintText: "Contoh:\nhttps://is.uad.ac.id",
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: const Icon(Icons.link),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.qr_code),
                  label: const Text(
                    "Generate QR",
                    style: TextStyle(fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: generateQR,
                ),
              ),

              const SizedBox(height: 35),

              Card(
                elevation: 8,
                shadowColor: Colors.blue.withOpacity(0.3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: QrImageView(
                    data: qrData,
                    version: QrVersions.auto,
                    size: 220,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                "Hasil QR Code",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),

              const SizedBox(height: 10),

              SelectableText(
                qrData,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),

              const SizedBox(height: 30),

            ],
          ),
        ),
      ),
    );
  }
}