import 'package:flutter/material.dart';
import 'package:my_pay/banktransferoptionsscreen.dart';
import 'package:my_pay/electricity_providers_screen.dart';
import 'package:my_pay/gas_screen.dart';
import 'package:my_pay/pay_screen.dart';
import 'package:my_pay/send_screen.dart';
import 'package:my_pay/service_item.dart';
import 'package:my_pay/fake_qr_screen.dart';
import 'package:my_pay/recent_numbers_screen.dart';
import 'package:my_pay/water_screen.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

  class _HomeScreenState extends State<HomeScreen> {
  bool showHistory = false;

  final List<Map<String, dynamic>> services = const [
    {"icon": Icons.phone_android, "label": "Recharge"},
    {"icon": Icons.flash_on, "label": "Electricity"},
    {"icon": Icons.water_drop, "label": "Water"},
    {"icon": Icons.wifi, "label": "Wi-Fi"},
    {"icon": Icons.local_gas_station, "label": "Gas"},
    {"icon": Icons.account_balance, "label": "Bank"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome, User 👋'),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(child: Icon(Icons.person)),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _balanceCard(),
            const SizedBox(height: 20),
            _quickActions(),
            const SizedBox(height: 20),
            if (!showHistory) ...[
             
              const SizedBox(height: 20),
              _servicesGrid(),

              _rewardsCarousel(),
              const SizedBox(height: 20),

              _managePaymentsRow(),
              const SizedBox(height: 20),

              _upiLiteBanner(),
              const SizedBox(height: 20),

              _rewardsReferSection(),
              const SizedBox(height: 20),
            ] else ...[

              buildRecentTransactions(),

            ],
            _financeServicesSection(),


          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {},
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.wallet), label: 'Wallet'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),

        ],
      ),

    );
  }

  Widget _balanceCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.indigo,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const Icon(Icons.account_balance_wallet, color: Colors.white, size: 40),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Wallet Balance', style: TextStyle(color: Colors.white70)),
              Text('₹ 1,3000', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
            ],
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
            child: const Text('+  Add Money', style: TextStyle(color: Colors.indigo)),
          )
        ],
      ),
    );
  }

  Widget _quickActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _actionItem(Icons.home, 'Home', () {
          setState(() => showHistory = false);
        }),
        _actionItem(Icons.send, 'Send', () {
          setState(() => showHistory = false);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const SendScreen()),
          );
        }),

        _actionItem(Icons.qr_code, 'Scan', () {
          setState(() => showHistory = false);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const FakeQrScreen()),
          );
        }),
        _actionItem(Icons.payment, 'Pay', () {
          setState(() => showHistory = false);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const PayScreen()),
          );
        }),

        _actionItem(Icons.history, 'History', () {
          setState(() => showHistory = true);
        }),
      ],
    );
  }

  Widget _actionItem(IconData icon, String label, VoidCallback onTap) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: CircleAvatar(
            radius: 26,
            backgroundColor: Colors.indigo.shade100,
            child: Icon(icon, color: Colors.indigo),
          ),
        ),
        const SizedBox(height: 8),
        Text(label),
      ],
    );
  }

  Widget _servicesGrid() {
    return GridView.builder(
      itemCount: services.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
      ),
      itemBuilder: (context, index) {
        final label = services[index]['label'];
        return ServiceItem(
          icon: services[index]['icon'],
          label: label,
          onTap: () {
            if (label == "Recharge") {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => RechargeScreen()),
              );


            } else if (label == "Bank") {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const  BankTransferOptionsScreen()),
              );

            } else if (label == "Electricity") {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ElectricityProvidersScreen()),
              );
            } else if (label == "Water") {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const WaterScreen()),
              );
            } else if (label == "Gas") {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const GasScreen()),
              );

            }
          },
        );
      },
    );
  }


  Widget buildRecentTransactions() {
    List<Map<String, String>> transactions = [
      {"title": "Electricity Bill", "amount": "- ₹500", "date": "28 Jun"},
      {"title": "Gas Recharge", "amount": "- ₹300", "date": "27 Jun"},
      {"title": "Money Added", "amount": "+ ₹1000", "date": "25 Jun"},
      {"title": "Home Rent", "amount": "- ₹11,000", "date": "2 Jun"},
      {"title": "salary", "amount": "+ ₹60,000", "date": "1 July"},
      {"title": "shoping", "amount": "- ₹1000", "date": "10 Jun"},
      {"title": "Oil", "amount": "- ₹250", "date": "2 May"},
      {"title": "Pen", "amount": "- ₹20", "date": "3 Jun"},
      {"title": "Laptop", "amount": "- ₹70,000", "date": "25 Jun"},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Text(
            "Recent Transactions",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: transactions.length,
          separatorBuilder: (_, __) => const Divider(),
          itemBuilder: (context, index) {
            final tx = transactions[index];
            return ListTile(
              leading: const Icon(Icons.receipt_long),
              title: Text(tx['title']!),
              subtitle: Text(tx['date']!),
              trailing: Text(
                tx['amount']!,
                style: TextStyle(
                  color: tx['amount']!.startsWith('+') ? Colors.green : Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
Widget _financeServicesSection() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'Financial Services',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 12),
      Wrap(
        spacing: 12,
        runSpacing: 12,
        children: [
          _buildServiceTile("Loans", "Personal, Gold and More", Icons.account_balance_wallet),
          _buildServiceTile("Insurance", "Offer", Icons.health_and_safety),
          _buildServiceTile("Savings", "Save Daily, Gold SIP", Icons.savings),
          _buildServiceTile("Travel & Transit", "Flight, Train, Bus, Hotel", Icons.directions_transit),
          _buildServiceTile("Mutual Funds", "SIPs & Investments", Icons.show_chart),
        ],
      ),
    ],
  );
}

Widget _buildServiceTile(String title, String subtitle, IconData icon) {
  return Container(
    width: 160,
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.grey[200],
      borderRadius: BorderRadius.circular(16),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 32, color: Colors.indigo),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text(subtitle, style: const TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          ),
        )
      ],
    ),
  );
}
// 🔹 Rewards Carousel
Widget _rewardsCarousel() {
  return Container(
    height: 120,
    decoration: BoxDecoration(
      color: Colors.teal.shade900,
      borderRadius: BorderRadius.circular(16),
    ),
    padding: const EdgeInsets.all(16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Text(
          "Redeem your Rewards",
          style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Icon(Icons.card_giftcard, color: Colors.white, size: 40),
      ],
    ),
  );
}

// 🔹 Manage Payments Row
Widget _managePaymentsRow() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text("Manage Payments", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      const SizedBox(height: 12),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          _PaymentItem(icon: Icons.account_balance_wallet, label: "Wallet"),
          _PaymentItem(icon: Icons.flash_on, label: "UPI Lite"),
          _PaymentItem(icon: Icons.group, label: "UPI Circle"),
          _PaymentItem(icon: Icons.credit_card, label: "RuPay on UPI"),
        ],
      ),
    ],
  );
}

class _PaymentItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const _PaymentItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey.shade200,
          child: Icon(icon, color: Colors.black),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}

// 🔹 UPI Lite Banner
Widget _upiLiteBanner() {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.purple.shade900,
      borderRadius: BorderRadius.circular(16),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Expanded(
          child: Text(
            "Top up & Pay With UPI Lite\nInstant PIN-free payments",
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),
        Icon(Icons.flash_on, color: Colors.white, size: 40),
      ],
    ),
  );
}

// 🔹 Rewards & Refer Section
Widget _rewardsReferSection() {
  return Row(
    children: [
      Expanded(
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: const [
              Icon(Icons.card_giftcard, color: Colors.deepPurple),
              SizedBox(height: 8),
              Text("Rewards", style: TextStyle(fontWeight: FontWeight.bold)),
              Text("Offers & Cashbacks", style: TextStyle(fontSize: 12)),
            ],
          ),
        ),
      ),
      const SizedBox(width: 10),
      Expanded(
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: const [
              Icon(Icons.campaign, color: Colors.indigo),
              SizedBox(height: 8),
              Text("Refer & Earn", style: TextStyle(fontWeight: FontWeight.bold)),
              Text("Get ₹100", style: TextStyle(fontSize: 12)),
            ],
          ),
        ),
      ),
    ],
  );
}



