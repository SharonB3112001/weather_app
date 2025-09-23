import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/forecast_providers.dart';
import '../widgets/forecast_card.dart';
import '../../../../core/network/providers/network_info_providers.dart';

class ForecastPage extends ConsumerWidget {
  const ForecastPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final forecastAsync = ref.watch(forecastProvider);
    final networkInfo = ref.watch(networkInfoProvider);

    networkInfo.isConnected.then((connected) {
      if (!connected) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Sin conexión a internet. Mostrando datos guardados."),
            duration: Duration(seconds: 3),
          ),
        );
      }
    });

    return Scaffold(
      appBar: AppBar(title: const Text("Clima últimos 5 días")),
      body: forecastAsync.when(
        data: (forecast) {
          if (forecast.isEmpty) {
            return const Center(
              child: Text(
                "Selecciona una ubicación en el mapa para ver el pronóstico",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            );
          }

          return ListView.builder(
            itemCount: forecast.length,
            itemBuilder: (_, i) => ForecastCard(forecast: forecast[i]),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text("Error al cargar pronóstico: $err")),
      ),
    );
  }
}
