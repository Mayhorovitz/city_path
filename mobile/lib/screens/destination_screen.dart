import 'package:flutter/material.dart';

class DestinationScreen extends StatelessWidget {
  const DestinationScreen({super.key});

  final List<String> destinations = const [
    'Rothschild Blvd',
    'Habima Square',
    'Carmel Market',
    'Tel Aviv Port',
    'Dizengoff Center',
    'Azrieli Towers',
    'Yarkon Park',
    'Neve Tzedek',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F2E9),
      appBar: AppBar(
        title: const Text('Choose Destination'),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: destinations.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final place = destinations[index];
          return ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(color: Colors.grey.shade300),
            ),
            tileColor: Colors.white,
            leading: const Icon(Icons.location_on, color: Colors.teal),
            title: Text(place),
            onTap: () {
              // TODO: Save selected destination and return
              Navigator.pop(context, place);
            },
          );
        },
      ),
    );
  }
}
