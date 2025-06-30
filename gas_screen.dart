import 'package:flutter/material.dart';

class GasScreen extends StatelessWidget {
  const GasScreen({super.key});

  final List<Map<String, String>> gasProviders = const [
    {
      "image": "https://th.bing.com/th/id/OIP.BDPKzCBSd-Ittgu-LnmFmQHaE8?w=258&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3",
      "name": "Bharat Gas"
    },
    {
      "image": "https://th.bing.com/th/id/OIP.J3mBSd5cTNvSDRIEIjTZ1gHaHa?w=170&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7",
      "name": "Bharat Gas - Commercial"
    },
    {
      "image": "https://www.clipartmax.com/png/middle/198-1989212_1-hp-petrol-pump-logo.png",
      "name": "HP Gas"
    },
    {
      "image": "https://www.presentations.gov.in/wp-content/uploads/2020/06/IndianOil-Preview.png",
      "name": "Indane Gas (Indian Oil)"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Select your Gas Provider")),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text("All Billers", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          ),
          ...gasProviders.map((item) => ListTile(
            leading: Image.network(item['image']!, width: 40, height: 40),
            title: Text(item['name']!),
            onTap: () {

            },
          )),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(12),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                "https://www.phonepe.com/webstatic/7888/static/default-og-image-cf861ccf43bc0cabaa06ab6f4ec99753.jpg",
                height: 160,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
