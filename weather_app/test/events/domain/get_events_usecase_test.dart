import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/features/events/data/models/event_model.dart';
import 'package:weather_app/features/events/data/repositories/event_repository_impl.dart';
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
        type: "Tornado",
        description: "Evento de prueba",
        dateTime: DateTime.now(),
        latitude: 1.0,
        longitude: 2.0,
      )
    ];

    when(() => repository.getEvents("Bogotá"))
        .thenAnswer((_) async => events);

    final result = await usecase("Bogotá");

    expect(result, isA<List<EventModel>>());
    expect(result.length, 1);
    verify(() => repository.getEvents("Bogotá")).called(1);
  });
}
