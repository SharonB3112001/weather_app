import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/features/events/data/models/event_model.dart';
import 'package:weather_app/features/events/presentation/pages/event_page.dart';
import 'package:weather_app/features/events/providers/event_providers.dart';

void main() {
  testWidgets('EventPage shows events list', (WidgetTester tester) async {
    final events = [
      EventModel(
        type: "Granizo",
        description: "Evento fuerte",
        dateTime: DateTime.now(),
        latitude: 0.0,
        longitude: 0.0,
      ),
    ];

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          eventProvider.overrideWith((ref) async => events),
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
