import 'package:flutter/material.dart';
import '../../data/models/forecast_model.dart';

class ForecastCard extends StatelessWidget {
  final ForecastModel day;

  const ForecastCard({super.key, required this.day});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text("${day.date.toLocal()}".split(' ')[0]),
        subtitle: Text(day.description),
        trailing: Text("${day.temperature.toStringAsFixed(1)} °C"),
      ),
    );
  }
}
