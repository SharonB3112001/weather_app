import '../../data/models/forecast_model.dart';
import '../../data/repositories/forecast_repository.dart';

class GetForecastUseCase {
  final ForecastRepository repository;

  GetForecastUseCase(this.repository);

  Future<List<ForecastDayModel>> call(double lat, double lon) {
    return repository.getForecast(lat, lon);
  }
}
