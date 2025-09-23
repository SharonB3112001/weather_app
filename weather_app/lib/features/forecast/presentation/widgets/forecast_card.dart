import 'package:flutter/material.dart';
import '../../data/models/forecast_model.dart';
import '../pages/forecast_detail_page.dart';

class ForecastCard extends StatelessWidget {
  final ForecastDayModel forecast;

  const ForecastCard({super.key, required this.forecast});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        leading: const Icon(Icons.calendar_today, color: Colors.blue),
        title: Text(
          forecast.date,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          "🌡️ ${forecast.temp}°C "
          "(min: ${forecast.tempMin}°C, max: ${forecast.tempMax}°C)\n"
          "💧 Humedad: ${forecast.humidity}%\n"
          "☁️ ${forecast.conditions}",
        ),
        isThreeLine: true,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ForecastDetailPage(forecast: forecast),
            ),
          );
        },
      ),
    );
  }
}
