import 'package:realm/realm.dart';
import '../models/realm_models.dart';
import '../models/event_model.dart';

class EventLocalDataSource {
  final Realm realm;

  EventLocalDataSource(this.realm);

  List<EventModel> getCachedEvents() {
    return realm.all<EventRealm>().map((e) {
      return EventModel(
        id: e.id,
        type: e.type,
        description: e.description,
        date: e.date,
        location: e.location,
        latitude: e.latitude,
        longitude: e.longitude,
      );
    }).toList();
  }

  void cacheEvents(List<EventModel> events) {
    realm.write(() {
      for (var event in events) {
        realm.add(
          EventRealm(
            event.id,
            event.type,
            event.description,
            event.date,
            event.location,
            event.latitude,
            event.longitude,
          ),
          update: true,
        );
      }
    });
  }

  void clearCache() {
    realm.write(() {
      realm.deleteAll<EventRealm>();
    });
  }
}
