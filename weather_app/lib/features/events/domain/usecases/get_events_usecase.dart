import '../repositories/event_repository.dart';
import '../../data/models/event_model.dart';

class GetEventsUseCase {
  final EventRepository repository;

  GetEventsUseCase(this.repository);

  Future<List<EventModel>> call(double lat, double lon) {
    return repository.getEvents(lat, lon);
  }
}
