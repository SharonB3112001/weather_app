import '../../../../core/network/api_client.dart';
import '../models/event_model.dart';

class EventRemoteDataSource {
  final ApiClient client;

  EventRemoteDataSource(this.client);

  Future<List<EventModel>> fetchEvents(double lat, double lon) async {
    final endpoint = "/timeline/$lat,$lon?include=events&unitGroup=metric&lang=es";
    final data = await client.get(endpoint);

    final events = (data['events'] as List<dynamic>? ?? [])
        .map((e) => EventModel.fromJson(e))
        .toList();

    return events;
  }
}
