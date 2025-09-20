import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

import 'package:weather_app/features/events/data/models/event_model.dart';
import 'package:weather_app/features/events/data/datasources/event_remote_ds.dart';
import 'package:weather_app/features/events/data/repositories/event_repository_impl.dart';
import 'package:weather_app/features/events/domain/usecases/get_events_usecase.dart';
import 'package:weather_app/features/events/presentation/pages/event_page.dart';
import 'package:weather_app/features/events/providers/event_providers.dart';

// ---- Mock HTTP ----
class MockHttpClient extends Mock implements http.Client {}

void main() {
  late MockHttpClient client;
  late EventRemoteDataSource remoteDs;
  late EventRepositoryImpl repository;
  late GetEventsUseCase usecase;

  setUp(() {
    client = MockHttpClient();
    remoteDs = EventRemoteDataSourceImpl(client: client, baseUrl: "https://fakeapi.com", apiKey: "FAKE_KEY");
    repository = EventRepositoryImpl(remoteDataSource: remoteDs);
    usecase = GetEventsUseCase(repository);
  });

  test('Full flow: API → Repository → UseCase', () async {
    final fakeResponse = {
      "events": [
        {
          "type": "Tornado",
          "description": "Evento peligroso",
          "datetime": "2025-09-20T10:00:00Z",
          "latitude": 1.23,
          "longitude": 4.56
        }
      ]
    };

    when(() => client.get(any())).thenAnswer(
      (_) async => http.Response(jsonEncode(fakeResponse), 200),
    );

    final result = await usecase("Bogotá");

    expect(result, isA<List<EventModel>>());
    expect(result.first.type, "Tornado");
    expect(result.first.description, "Evento peligroso");
  });

  testWidgets('Provider + UI shows event from mocked API', (tester) async {
    final fakeEvents = [
      EventModel(
        type: "Granizo",
        description: "Evento fuerte",
        dateTime: DateTime.parse("2025-09-20T10:00:00Z"),
        latitude: 0.0,
        longitude: 0.0,
      ),
    ];

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          eventProvider.overrideWith((ref) async => fakeEvents),
        ],
        child: const MaterialApp(home: EventPage()),
      ),
    );

    await tester.pump();

    expect(find.text("Granizo"), findsOneWidget);
    expect(find.text("Evento fuerte"), findsOneWidget);
  });
}
