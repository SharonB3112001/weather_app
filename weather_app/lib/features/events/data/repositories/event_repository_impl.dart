import '../../domain/repositories/event_repository.dart';
import '../datasources/event_remote_ds.dart';
import '../datasources/event_local_ds.dart';
import '../models/event_model.dart';

class EventRepositoryImpl implements EventRepository {
  final EventRemoteDataSource remote;
  final EventLocalDataSource local;

  EventRepositoryImpl({required this.remote, required this.local});

  @override
  Future<List<EventModel>> getEvents(double lat, double lon) async {
    try {
      final events = await remote.fetchEvents(lat, lon);
      local.cacheEvents(events);
      return events;
    } catch (_) {
      return local.getCachedEvents();
    }
  }
}
