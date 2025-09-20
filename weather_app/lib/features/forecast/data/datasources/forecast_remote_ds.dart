import '../../../../core/network/api_client.dart';
import '../models/forecast_model.dart';

class ForecastRemoteDataSource {
  final ApiClient client;

  ForecastRemoteDataSource(this.client);

  Future<List<ForecastModel>> fetchForecast(double lat, double lon) async {
    final endpoint = "/timeline/$lat,$lon?unitGroup=metric&lang=es&include=days&elements=datetime,temp,conditions";
    final data = await client.get(endpoint);

    final days = (data['days'] as List<dynamic>? ?? [])
        .take(5)
        .map((d) => ForecastModel.fromJson(d))
        .toList();

    return days;
  }
}
