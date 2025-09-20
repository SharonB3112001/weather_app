import 'package:flutter/material.dart';
import '../../data/models/event_model.dart';
import '../pages/event_detail_page.dart';

class EventCard extends StatelessWidget {
  final EventModel event;

  const EventCard({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(event.type),
        subtitle: Text(event.description),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => EventDetailPage(event: event),
            ),
          );
        },
      ),
    );
  }
}
