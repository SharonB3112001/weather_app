import 'package:flutter/material.dart';
import '../../data/models/forecast_model.dart';

class ForecastDetailPage extends StatelessWidget {
  final ForecastDayModel forecast;

  const ForecastDetailPage({super.key, required this.forecast});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Clima ${forecast.date}"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Text(
              forecast.description.isNotEmpty
                  ? forecast.description
                  : forecast.conditions,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),

            Row(
              children: [
                const Icon(Icons.thermostat, size: 18),
                const SizedBox(width: 8),
                Text("Temp: ${forecast.temp}°C "
                    "(min: ${forecast.tempMin}°C, max: ${forecast.tempMax}°C)"),
              ],
            ),
            const SizedBox(height: 10),

            Row(
              children: [
                const Icon(Icons.water_drop, size: 18),
                const SizedBox(width: 8),
                Text("Humedad: ${forecast.humidity}%"),
              ],
            ),
            const SizedBox(height: 10),

            Row(
              children: [
                const Icon(Icons.cloud, size: 18),
                const SizedBox(width: 8),
                Text("Precipitación: ${forecast.precip} mm"),
              ],
            ),
            const SizedBox(height: 20),

            Center(
              child: Column(
                children: [
                  Icon(
                    Icons.wb_sunny, 
                    size: 50,
                    color: Colors.orange,
                  ),
                  const SizedBox(height: 10),
                  Text("Condiciones: ${forecast.conditions}"),
                ],
              ),
            ),

            const Divider(height: 40),
            const Text(
              "Fuente: VisualCrossing Weather API",
              style: TextStyle(color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
