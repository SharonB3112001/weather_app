import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/event_model.dart';
import '../../../favorites/providers/favorite_provider.dart';
import '../../data/models/realm_models.dart';

class EventDetailPage extends ConsumerWidget {
  final EventModel event;

  const EventDetailPage({super.key, required this.event});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFav = ref.watch(
      favoritesProvider.select((list) => list.any((f) => f.id == event.id)),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(event.type.isNotEmpty ? event.type : "Evento climático"),
        actions: [
          IconButton(
            tooltip: isFav ? 'Quitar de favoritos' : 'Agregar a favoritos',
            icon: Icon(
              isFav ? Icons.favorite : Icons.favorite_border,
              color: Colors.redAccent,
            ),
            onPressed: () {
              final realmEvent = EventRealm(
                event.id,
                event.type,
                event.description,
                event.date,
                event.location,
                event.latitude,
                event.longitude,
              );

              ref.read(favoritesProvider.notifier).toggle(realmEvent);

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    isFav
                        ? 'Eliminado de favoritos'
                        : 'Agregado a favoritos',
                  ),
                  duration: const Duration(seconds: 2),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Text(
              event.description.isNotEmpty
                  ? event.description
                  : "Sin descripción disponible",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),

            Row(
              children: [
                const Icon(Icons.calendar_today, size: 18),
                const SizedBox(width: 8),
                Text(
                  "Fecha: ${event.date.toLocal().toString().split(' ').first}",
                ),
              ],
            ),
            const SizedBox(height: 10),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.place, size: 18),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    event.location.isNotEmpty
                        ? event.location
                        : "Ubicación desconocida",
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            if (event.latitude != 0 && event.longitude != 0)
              Row(
                children: [
                  const Icon(Icons.map, size: 18),
                  const SizedBox(width: 8),
                  Text("Coords: ${event.latitude}, ${event.longitude}"),
                ],
              ),

            const SizedBox(height: 20),
            const Divider(),
            const Text(
              "Más información próximamente...",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
