import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../forecast/providers/forecast_providers.dart';

class DashboardCharts extends ConsumerWidget {
  const DashboardCharts({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final forecastAsync = ref.watch(forecastProvider);

    return forecastAsync.when(
      data: (forecast) {
        if (forecast.isEmpty) {
          return const Center(child: Text("No hay datos de clima"));
        }

        return Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 40), 
            child: SizedBox(
              height: 220,
              width: MediaQuery.of(context).size.width * 0.8,
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 36,
                        getTitlesWidget: (value, meta) {
                          return Text(
                            "${value.toInt()}°C",
                            style: const TextStyle(fontSize: 10),
                          );
                        },
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          final index = value.toInt();
                          if (index < forecast.length) {
                            final date = DateTime.parse(forecast[index].date);
                            const days = ["Lun", "Mar", "Mié", "Jue", "Vie", "Sáb", "Dom"];
                            return Text(
                              days[date.weekday - 1],
                              style: const TextStyle(fontSize: 12),
                            );
                          }
                          return const Text("");
                        },
                      ),
                    ),
                    rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  ),
                  barGroups: List.generate(forecast.length, (i) {
                    return BarChartGroupData(
                      x: i,
                      barRods: [
                        BarChartRodData(
                          toY: forecast[i].temp,
                          color: Colors.blueAccent,
                          width: 16,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ],
                    );
                  }),
                ),
              ),
            ),
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (_, __) => const Text("Error al cargar datos"),
    );
  }
}
