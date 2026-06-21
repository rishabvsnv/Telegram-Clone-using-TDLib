import 'package:flutter/material.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final calls = [
      CallModel(name: 'John Doe', time: 'Today, 10:24 AM', isIncoming: true),
      CallModel(
        name: 'Emma Wilson',
        time: 'Today, 09:12 AM',
        isIncoming: false,
      ),
      CallModel(
        name: 'Alex Johnson',
        time: 'Yesterday, 08:45 PM',
        isIncoming: true,
      ),
      CallModel(
        name: 'Sophia Brown',
        time: 'Yesterday, 05:10 PM',
        isIncoming: false,
      ),
      CallModel(
        name: 'Michael Smith',
        time: 'Monday, 11:30 AM',
        isIncoming: true,
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Contacts')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: calls.length,
        separatorBuilder: (_, _) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final call = calls[index];

          return ListTile(
            leading: CircleAvatar(
              radius: 26,
              child: Text(
                call.name[0],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            title: Text(
              call.name,
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            subtitle: Expanded(child: Text('+91 9876543210')),
          );
        },
      ),
    );
  }
}

class CallModel {
  final String name;
  final String time;
  final bool isIncoming;

  const CallModel({
    required this.name,
    required this.time,
    required this.isIncoming,
  });
}
