import 'package:flutter/material.dart';

class PayScreen extends StatefulWidget {
  const PayScreen({super.key});

  @override
  State<PayScreen> createState() => _PayScreenState();
}

class _PayScreenState extends State<PayScreen> {
  List<String> cart = [];

  final List<String> items = [
    "Electricity Bill",
    "Mobile Recharge",
    "Gas Cylinder",
    "Water Bill",
    "DTH Recharge",
  ];

  void addToCart(String item) {
    setState(() {
      cart.add(item);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$item added to cart')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pay Your Bills")),
      body: Column(
        children: [
          const SizedBox(height: 10),
          const Text("Choose a bill to pay", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return ListTile(
                  title: Text(item),
                  trailing: ElevatedButton(
                    onPressed: () => addToCart(item),
                    child: const Text(" + Add to Cart"),
                  ),
                );
              },
            ),
          ),
          Container(
            color: Colors.grey[200],
            padding: const EdgeInsets.all(12),
            width: double.infinity,
            child: Text("🛒 Cart Items: ${cart.join(", ")}", style: const TextStyle(fontSize: 14)),
          )
        ],
      ),
    );
  }
}
