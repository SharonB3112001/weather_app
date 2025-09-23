import '../../domain/repositories/event_repository.dart';
import '../datasources/event_remote_ds.dart';
import '../datasources/event_local_ds.dart';
import '../models/event_model.dart';
import '../../../../core/network/network_info.dart';

class EventRepositoryImpl implements EventRepository {
  final EventRemoteDataSource remote;
  final EventLocalDataSource local;
  final NetworkInfo networkInfo; 

  EventRepositoryImpl({
    required this.remote,
    required this.local,
    required this.networkInfo,
  });

  @override
  Future<List<EventModel>> getEvents(double lat, double lon) async {
    if (await networkInfo.isConnected) {
      try {
        final events = await remote.fetchEvents(lat, lon);
        local.cacheEvents(events); 
        return events;
      } catch (_) {
        return local.getCachedEvents();
      }
    } else {
      return local.getCachedEvents();
    }
  }
}
