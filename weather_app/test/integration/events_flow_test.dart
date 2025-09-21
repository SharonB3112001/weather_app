import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

import 'package:weather_app/features/events/data/models/event_model.dart';
import 'package:weather_app/features/events/data/datasources/event_remote_ds.dart';
import 'package:weather_app/features/events/data/datasources/event_local_ds.dart';
import 'package:weather_app/features/events/data/repositories/event_repository_impl.dart';
import 'package:weather_app/features/events/domain/usecases/get_events_usecase.dart';
import 'package:weather_app/features/events/providers/event_provider.dart';
import 'package:weather_app/features/events/presentation/pages/event_page.dart';
import 'package:weather_app/core/network/api_client.dart';

class MockHttpClient extends Mock implements http.Client {}
class MockLocalDS extends Mock implements EventLocalDataSource {}

void main() {
  late MockHttpClient client;
  late ApiClient apiClient;
  late EventRemoteDataSource remoteDs;
  late MockLocalDS localDs;
  late EventRepositoryImpl repository;
  late GetEventsUseCase usecase;

  setUp(() {
    client = MockHttpClient();
    apiClient = ApiClient(client: client);
    remoteDs = EventRemoteDataSource(apiClient);
    localDs = MockLocalDS(); // Mock LocalDataSource
    repository = EventRepositoryImpl(remote: remoteDs, local: localDs);
    usecase = GetEventsUseCase(repository);
  });

  test('Full flow: API → Repository → UseCase', () async {
    final fakeApiResponse = {
      "events": [
        {
          "id": "1",
          "type": "Tornado",
          "description": "Evento peligroso",
          "date": "2025-09-20T10:00:00Z",
          "location": "Bogotá",
          "latitude": 1.23,
          "longitude": 4.56
        }
      ]
    };

    when(() => client.get(any())).thenAnswer(
      (_) async => http.Response(jsonEncode(fakeApiResponse), 200),
    );

    when(() => localDs.cacheEvents(any())).thenAnswer((_) async => Future.value());

    final result = await usecase(10.9685, -74.7813);

    expect(result, isA<List<EventModel>>());
    expect(result.first.type, "Tornado");
    expect(result.first.location, "Bogotá");

    verify(() => localDs.cacheEvents(any())).called(1);
  });

  testWidgets('Provider + UI shows event from mocked API', (tester) async {
    final fakeEvents = [
      EventModel(
        id: "2",
        type: "Granizo",
        description: "Evento fuerte",
        date: DateTime.parse("2025-09-20T10:00:00Z"),
        location: "Cartagena",
        latitude: 0.0,
        longitude: 0.0,
      ),
    ];

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          eventsProvider.overrideWith(
            (ref) => Future.value(fakeEvents),
          ),
        ],
        child: const MaterialApp(home: EventPage()),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text("Granizo"), findsOneWidget);
    expect(find.text("Evento fuerte"), findsOneWidget);
  });
}
