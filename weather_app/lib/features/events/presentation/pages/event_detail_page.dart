import 'package:flutter/material.dart';
import '../../data/models/event_model.dart';

class EventDetailPage extends StatelessWidget {
  final EventModel event;

  const EventDetailPage({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(event.type)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(event.description, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 10),
            Text("Fecha: ${event.date}"),
            Text("Ubicación: ${event.location}"),
          ],
        ),
      ),
    );
  }
}
