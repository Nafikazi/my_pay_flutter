import 'package:flutter/material.dart';

class BankTransferOptionsScreen extends StatelessWidget {
  const BankTransferOptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final options = [
      {
        'icon': Icons.account_circle,
        'title': 'To Self Bank Account',
        'subtitle': 'transfer to own bank a/c',
      },
      {
        'icon': Icons.account_balance,
        'title': 'To Account Number & IFSC',
        'subtitle': 'transfer to another bank a/c',
      },
      {
        'icon': Icons.alternate_email,
        'title': 'To Any UPI App',
        'subtitle': 'transfer using UPI ID / number',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Send Money to Bank'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: options.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final option = options[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.purple.shade100,
              child: Icon(option['icon'] as IconData, color: Colors.purple),
            ),
            title: Text(option['title'] as String),
            subtitle: Text(option['subtitle'] as String),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              //
            },
          );
        },
      ),
    );
  }
}
