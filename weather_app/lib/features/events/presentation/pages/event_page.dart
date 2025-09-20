import 'package:flutter/material.dart';
import '../widgets/event_card.dart';
import '../../providers/event_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EventPage extends ConsumerWidget {
  const EventPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final eventsAsync = ref.watch(eventsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Eventos climáticos")),
      body: eventsAsync.when(
        data: (events) => ListView.builder(
          itemCount: events.length,
          itemBuilder: (_, i) => EventCard(event: events[i]),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text("Error: $err")),
      ),
    );
  }
}
