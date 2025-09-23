import '../repositories/forecast_repository.dart';
import '../datasources/forecast_remote_ds.dart';
import '../models/forecast_model.dart';
import '../../../../core/network/network_info.dart';

class ForecastRepositoryImpl implements ForecastRepository {
  final ForecastRemoteDataSource remote;
  final NetworkInfo networkInfo;

  ForecastRepositoryImpl({
    required this.remote,
    required this.networkInfo,
  });

  @override
  Future<List<ForecastDayModel>> getForecast(double lat, double lon) async {
    final connected = await networkInfo.isConnected;
    if (connected) {
      return await remote.fetchLast5Days(lat, lon);
    } else {
      
      return [];
    }
  }
}
