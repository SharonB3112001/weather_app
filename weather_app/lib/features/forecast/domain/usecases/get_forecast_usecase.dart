import '../../../forecast/data/models/forecast_model.dart';
import '../../../forecast/data/datasources/forecast_remote_ds.dart';

class GetForecastUseCase {
  final ForecastRemoteDataSource remote;

  GetForecastUseCase(this.remote);

  Future<List<ForecastModel>> call(double lat, double lon) {
    return remote.fetchForecast(lat, lon);
  }
}
