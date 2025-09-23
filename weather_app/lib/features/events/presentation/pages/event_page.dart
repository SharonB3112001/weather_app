import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/event_card.dart';
import '../../providers/event_provider.dart';

class EventPage extends ConsumerWidget {
  const EventPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final eventsAsync = ref.watch(eventsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Eventos climáticos")),
      body: eventsAsync.when(
        data: (events) {
          if (events.isEmpty) {
            return const Center(
              child: Text(
                "No hay eventos climáticos extremos en esta ubicación",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            );
          }

          return ListView.builder(
            itemCount: events.length,
            itemBuilder: (_, i) => EventCard(event: events[i]),
          );
        },
        loading: () =>
            const Center(child: CircularProgressIndicator()),
        error: (err, _) =>
            Center(child: Text("Error al cargar eventos: $err")),
      ),
    );
  }
}
