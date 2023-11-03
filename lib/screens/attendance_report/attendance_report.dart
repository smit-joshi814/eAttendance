import 'package:flutter/material.dart';

class ExpertList extends StatelessWidget {
  const ExpertList({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FilledButton.icon(
        label: const Text('Download Attendance Report'),
        icon: const Icon(Icons.document_scanner),
        onPressed: () {},
      ),
    );
  }
}
