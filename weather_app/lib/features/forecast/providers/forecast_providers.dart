import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../data/models/forecast_model.dart';
import '../data/datasources/forecast_remote_ds.dart';
import '../data/repositories/forecast_repository_impl.dart';
import '../domain/usecases/get_forecast_usecase.dart';
import '../../../core/network/api_client.dart';
import '../../../core/network/providers/network_info_providers.dart'; 
import '../../events/providers/location_provider.dart';

final apiClientProvider = Provider((ref) => ApiClient(client: http.Client()));

final forecastRemoteDSProvider =
    Provider((ref) => ForecastRemoteDataSource(ref.read(apiClientProvider)));

final forecastRepositoryProvider = Provider((ref) {
  return ForecastRepositoryImpl(
    remote: ref.read(forecastRemoteDSProvider),
    networkInfo: ref.read(networkInfoProvider),
  );
});

final getForecastUseCaseProvider =
    Provider((ref) => GetForecastUseCase(ref.read(forecastRepositoryProvider)));

final forecastProvider = FutureProvider<List<ForecastDayModel>>((ref) async {
  final location = ref.watch(locationProvider);

  if (location == null) return [];

  return ref.read(getForecastUseCaseProvider).call(
        location.latitude,
        location.longitude,
      );
});
