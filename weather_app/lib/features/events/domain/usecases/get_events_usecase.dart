import '../../data/models/event_model.dart';
import '../../data/repositories/event_repository_impl.dart';

class GetEventsUseCase {
  final EventRepositoryImpl repository;

  GetEventsUseCase(this.repository);

  Future<List<EventModel>> call(double lat, double lon) {
    return repository.getEvents(lat, lon);
  }
}
