import 'package:flutter/material.dart';
import 'widgets.dart'; // PlanCard aur PlansList idhar se import karega

class RechargePlansScreen extends StatelessWidget {
  final String number;

  const RechargePlansScreen({super.key, required this.number});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Plans for $number")),
      body: DefaultTabController(
        length: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text("Suggested Plans",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  PlanCard(price: 19, details: "1 GB • 1 Day"),
                  PlanCard(price: 349, details: "2GB/day • 28 Days"),
                  PlanCard(price: 229, details: "1GB/day • 29 Days"),
                  PlanCard(price: 999, details: "2GB/day • 89 Days"),
                ],
              ),
            ),
            TabBar(tabs: [
              Tab(text: 'Popular'),
              Tab(text: 'Data Packs'),
              Tab(text: 'Yearly'),
            ]),
            Expanded(
              child: TabBarView(children: [
                PlansList(),
                PlansList(),
                PlansList(),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
