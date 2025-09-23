import '../../data/models/forecast_model.dart';

abstract class ForecastRepository {
  Future<List<ForecastDayModel>> getForecast(double lat, double lon);
}
