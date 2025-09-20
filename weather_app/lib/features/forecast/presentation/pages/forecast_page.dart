import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/forecast_card.dart';
import '../../../forecast/providers/forecast_providers.dart';

class ForecastPage extends ConsumerWidget {
  const ForecastPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final forecastAsync = ref.watch(forecastProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Clima últimos 5 días")),
      body: forecastAsync.when(
        data: (days) => ListView.builder(
          itemCount: days.length,
          itemBuilder: (_, i) => ForecastCard(day: days[i]),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text("Error: $err")),
      ),
    );
  }
}
