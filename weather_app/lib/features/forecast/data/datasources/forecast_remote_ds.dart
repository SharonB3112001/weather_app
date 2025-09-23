import '../../../../core/network/api_client.dart';
import '../models/forecast_model.dart';

class ForecastRemoteDataSource {
  final ApiClient client;

  ForecastRemoteDataSource(this.client);

  Future<List<ForecastDayModel>> fetchLast5Days(double lat, double lon) async {
    final endpoint =
        "/timeline/$lat,$lon?unitGroup=metric&lang=es&include=days&pastDays=5";

    final data = await client.get(endpoint);

    final days = (data['days'] as List<dynamic>? ?? [])
        .map((d) => ForecastDayModel.fromJson(d))
        .toList();

    final today = DateTime.now();

    final onlyPast = days.where((d) {
      final parsedDate = DateTime.tryParse(d.date);
      if (parsedDate == null) return false;
      return parsedDate.isBefore(today) || _isSameDay(parsedDate, today);
    }).toList();

    onlyPast.sort((a, b) => a.date.compareTo(b.date));

    if (onlyPast.length > 5) {
      return onlyPast.sublist(onlyPast.length - 5);
    }
    return onlyPast;
  }

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }
}
