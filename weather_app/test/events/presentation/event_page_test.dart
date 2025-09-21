import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/features/events/data/models/event_model.dart';
import 'package:weather_app/features/events/presentation/pages/event_page.dart';
import 'package:weather_app/features/events/providers/event_provider.dart'; // 👈 corregido

void main() {
  testWidgets('EventPage shows events list', (WidgetTester tester) async {
    final events = [
      EventModel(
        id: "1", // 👈 agregado
        type: "Granizo",
        description: "Evento fuerte",
        date: DateTime.now(), // 👈 corregido
        location: "Bogotá",   // 👈 agregado
        latitude: 0.0,
        longitude: 0.0,
      ),
    ];

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          eventsProvider.overrideWith((ref) async => events), // 👈 corregido
        ],
        child: const MaterialApp(
          home: EventPage(),
        ),
      ),
    );

    await tester.pump();

    expect(find.text("Granizo"), findsOneWidget);
    expect(find.text("Evento fuerte"), findsOneWidget);
  });
}
