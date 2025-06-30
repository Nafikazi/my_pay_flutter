import 'package:flutter/material.dart';
import 'recharge_plans_screen.dart';

class RechargeScreen extends StatelessWidget {
  final List<String> recentNumbers = [
    "9876543210",
    "9123456789",
    "9988776655",
    "9090909090",
    "9000000000",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Select a Number")),
      body: ListView.builder(
        itemCount: recentNumbers.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(recentNumbers[index]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => RechargePlansScreen(number: recentNumbers[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
