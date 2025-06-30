import 'package:flutter/material.dart';

class ElectricityProvidersScreen extends StatelessWidget {
  final List<Map<String, String>> providers = [
    {
      'name': 'Adani Electricity Mumbai Limited (AEML)',
      'logo': 'https://tse4.mm.bing.net/th/id/OIP.M19b7g9_EsNU2u6HwEXFlAHaD4?rs=1&pid=ImgDetMain&o=7&rm=3',
    },
    {
      'name': 'Ajmer Vidyut Vitran Nigam Ltd (AVVNL)',
      'logo': 'https://tse2.mm.bing.net/th/id/OIP.pyVYV7cVaIydLMmftWLDVAAAAA?rs=1&pid=ImgDetMain&o=7&rm=3',
    },
    {
      'name': 'Assam Power Distribution Company Limited (APDCL) - Bill Payment',
      'logo': 'https://joblive.in/wp-content/uploads/2020/12/APDCL-Assam-Power-Distribution-Company-Limited.jpg',
    },
    {
      'name': 'Assam Power Distribution Company Ltd (APDCL) - Prepaid Recharge',
      'logo': 'https://baidpower.com/wp-content/uploads/APDCL-1-1024x1024.jpg',
    },
    {
      'name': 'Bharatpur Electricity Services Ltd (BESL)',
      'logo': 'https://rtspower.com/wp-content/uploads/2022/05/cesc-kolkata.png',
    },
    {
      'name': 'BEST Mumbai - Brihanmumbai Electricity',
      'logo': 'https://upload.wikimedia.org/wikipedia/en/3/32/BEST_Undertaking_logo.png',
    },
    {
      'name': 'BSES Rajdhani - Bill Payment',
      'logo': 'https://payincredit.com/storage/operators/bses-rajdhani.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: const Text("Select Provider"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Image.network(
              'https://www.financialexpress.com/wp-content/uploads/2024/08/Shailja-Tiwari-2024-08-30T134958.313.png',
              height: 30,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search by biller',
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey.shade200,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          // List of providers
          Expanded(
            child: ListView.separated(
              itemCount: providers.length,
              separatorBuilder: (_, __) => Divider(),
              itemBuilder: (context, index) {
                final provider = providers[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(provider['logo']!),
                  ),
                  title: Text(provider['name']!),
                  onTap: () {
                    // Action when clicked
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Selected: ${provider['name']}")),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
