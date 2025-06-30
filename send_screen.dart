import 'package:flutter/material.dart';

class SendScreen extends StatefulWidget {
  const SendScreen({super.key});

  @override
  State<SendScreen> createState() => _SendScreenState();
}

class _SendScreenState extends State<SendScreen> {
  final List<Map<String, dynamic>> contacts = [
    {"name": "Rahul", "image": Icons.person},
    {"name": "Sneha", "image": Icons.person_outline},
  ];

  final TextEditingController _messageController = TextEditingController();
  String? selectedContact;

  void sendMessage() {
    if (selectedContact != null && _messageController.text.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Message sent to $selectedContact:\n${_messageController.text}"),
        ),
      );
      _messageController.clear();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please select a contact and enter a message")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Send to Contact")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text("Choose a contact", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: contacts.map((contact) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedContact = contact['name'];
                    });
                  },
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        child: Icon(contact['image']),
                      ),
                      const SizedBox(height: 5),
                      Text(contact['name'],
                          style: TextStyle(
                              fontWeight: selectedContact == contact['name']
                                  ? FontWeight.bold
                                  : FontWeight.normal)),
                    ],
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _messageController,
              decoration: const InputDecoration(
                hintText: "Enter message or amount",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: sendMessage,
              child: const Text("Send"),
            ),
          ],
        ),
      ),
    );
  }
}
