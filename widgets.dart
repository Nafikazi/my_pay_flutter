import 'package:flutter/material.dart';



class PlanCard extends StatelessWidget {
  final int price;
  final String details;

  const PlanCard({super.key, required this.price, required this.details});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("₹$price", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Text(details, style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}

class PlansList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(title: Text("₹199 Plan"), subtitle: Text("1.5GB/day for 28 days")),
        ListTile(title: Text("₹399 Plan"), subtitle: Text("3GB/day for 56 days")),
        ListTile(title: Text("₹699 Plan"), subtitle: Text("2GB/day for 84 days")),
      ],
    );
  }
}
