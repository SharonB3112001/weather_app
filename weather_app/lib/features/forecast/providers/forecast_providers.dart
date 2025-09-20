import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import '../../../core/network/api_client.dart';
import '../data/datasources/forecast_remote_ds.dart';
import '../data/models/forecast_model.dart';
import '../domain/usecases/get_forecast_usecase.dart';

final apiClientProvider = Provider((ref) => ApiClient(client: http.Client()));

final forecastRemoteDSProvider =
    Provider((ref) => ForecastRemoteDataSource(ref.read(apiClientProvider)));

final getForecastUseCaseProvider = Provider(
  (ref) => GetForecastUseCase(ref.read(forecastRemoteDSProvider)),
);

final forecastProvider = FutureProvider<List<ForecastModel>>((ref) async {
  const lat = 10.9685;
  const lon = -74.7813;
  return ref.read(getForecastUseCaseProvider).call(lat, lon);
});
