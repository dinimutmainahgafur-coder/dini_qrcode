import 'package:flutter/material.dart';
import 'generate_qr.dart';
import 'scan_qr.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Widget menuButton({
    required BuildContext context,
    required IconData icon,
    required String title,
    required Widget page,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton.icon(
        icon: Icon(icon, size: 28),
        label: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        style: ElevatedButton.styleFrom(
          elevation: 8,
          backgroundColor: Colors.white,
          foregroundColor: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => page),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,

        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff2563EB),
              Color(0xff60A5FA),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),

        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(25),

            child: Column(
              children: [

                const SizedBox(height: 20),

                const Icon(
                  Icons.qr_code_2,
                  size: 120,
                  color: Colors.white,
                ),

                const SizedBox(height: 20),

                const Text(
                  "QR Code Application",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  "Generate dan Scan QR Code\nMenggunakan Flutter",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 18,
                  ),
                ),

                const Spacer(),

                menuButton(
                  context: context,
                  icon: Icons.qr_code,
                  title: "Generate QR Code",
                  page: const GenerateQRCodePage(),
                ),

                const SizedBox(height: 20),

                menuButton(
                  context: context,
                  icon: Icons.qr_code_scanner,
                  title: "Scan QR Code",
                  page: const ScanQRPage(),
                ),

                const SizedBox(height: 50),

              ],
            ),
          ),
        ),
      ),
    );
  }
}