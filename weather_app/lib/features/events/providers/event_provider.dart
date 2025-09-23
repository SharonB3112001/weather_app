import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/models/event_model.dart';
import '../data/datasources/event_remote_ds.dart';
import '../data/datasources/event_local_ds.dart';
import '../data/repositories/event_repository_impl.dart';
import '../domain/usecases/get_events_usecase.dart';
import 'package:http/http.dart' as http;
import 'package:realm/realm.dart';
import '../data/models/realm_models.dart';
import '../../../core/network/api_client.dart';
import '../providers/location_provider.dart';
import '../../../core/network/providers/network_info_providers.dart';

final apiClientProvider = Provider((ref) => ApiClient(client: http.Client()));
final realmProvider =
    Provider((ref) => Realm(Configuration.local([EventRealm.schema])));

final eventRemoteDSProvider =
    Provider((ref) => EventRemoteDataSource(ref.read(apiClientProvider)));

final eventLocalDSProvider =
    Provider((ref) => EventLocalDataSource(ref.read(realmProvider)));

final eventRepositoryProvider = Provider((ref) {
  return EventRepositoryImpl(
    remote: ref.read(eventRemoteDSProvider),
    local: ref.read(eventLocalDSProvider),
    networkInfo: ref.read(networkInfoProvider),
  );
});

final getEventsUseCaseProvider = Provider(
  (ref) => GetEventsUseCase(ref.read(eventRepositoryProvider)),
);

final eventsProvider = FutureProvider<List<EventModel>>((ref) async {
  final location = ref.watch(locationProvider);

  if (location == null) return [];

  return ref.read(getEventsUseCaseProvider).call(
        location.latitude,
        location.longitude,
      );
});
