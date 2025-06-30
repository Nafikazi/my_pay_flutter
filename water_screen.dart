import 'package:flutter/material.dart';

class WaterScreen extends StatelessWidget {
  const WaterScreen({super.key});

  final List<Map<String, String>> providers = const [
    {
      "image": "https://yt3.ggpht.com/a/AGF-l79wzazZAkxI2j01wRteO8LfEA5CqrB9dEwm=s900-c-k-c0xffffffff-no-rj-mo",
      "name": "Delhi Jal Board"
    },
    {
      "image": "https://tse3.mm.bing.net/th/id/OIP._3QEjxW5A6-OW6Ue3TvqkgAAAA?rs=1&pid=ImgDetMain&o=7&rm=3",
      "name": "Chennai Metropolitan Water"
    },
    {
      "image": "https://lh3.googleusercontent.com/-I2G6BzBQppU/Yf_WwUDokZI/AAAAAAACK1I/YfpEtN3hSdcinxpXQnu5IcQOI5A8_V_vgCNcBGAsYHQ/s1600/BWSSB-LOGO-1.png",
      "name": "BWSSB"
    },
    {
      "image": "https://tse4.mm.bing.net/th/id/OIP.4NSA5bq0S_B5iYb2XIAE2AHaHa?w=500&h=500&rs=1&pid=ImgDetMain&o=7&rm=3",
      "name": "Hyderabad Water Supply"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Select Water Provider")),
      body: ListView.builder(
        itemCount: providers.length,
        itemBuilder: (context, index) {
          final item = providers[index];
          return ListTile(
            leading: Image.network(item['image']!, width: 40, height: 40),
            title: Text(item['name']!),
            onTap: () {
              // Future: Navigate to provider detail
            },
          );
        },
      ),
    );
  }
}
