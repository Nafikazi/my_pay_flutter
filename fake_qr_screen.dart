import 'package:flutter/material.dart';

class FakeQrScreen extends StatelessWidget {
  const FakeQrScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Scan QR")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Scan this QR", style: TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            Image.network(
              'https://api.qrserver.com/v1/create-qr-code/?size=200x200&data=FakeUPIPaymentLink',
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 20),
            const Text("₹200 to Pay", style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
