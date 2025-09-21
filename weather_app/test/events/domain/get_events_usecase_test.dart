import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/features/events/data/models/event_model.dart';
import 'package:weather_app/features/events/domain/repositories/event_repository.dart';
import 'package:weather_app/features/events/domain/usecases/get_events_usecase.dart';

class MockEventRepository extends Mock implements EventRepository {}

void main() {
  late MockEventRepository repository;
  late GetEventsUseCase usecase;

  setUp(() {
    repository = MockEventRepository();
    usecase = GetEventsUseCase(repository);
  });

  test('should return list of events from repository', () async {
    final events = [
      EventModel(
        id: "1",
        type: "Tornado",
        description: "Evento de prueba",
        date: DateTime.now(),
        location: "Bogotá",
        latitude: 1.0,
        longitude: 2.0,
      )
    ];

    when(() => repository.getEvents(1.0, 2.0))
        .thenAnswer((_) async => events);

    final result = await usecase(1.0, 2.0);

    expect(result, isA<List<EventModel>>());
    expect(result.length, 1);
    verify(() => repository.getEvents(1.0, 2.0)).called(1);
  });
}
