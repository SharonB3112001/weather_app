import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/features/forecast/data/models/forecast_model.dart';

void main() {
  test('ForecastModel fromJson works', () {
    final json = {
      "datetime": "2025-09-20",
      "temp": 22,
      "description": "Soleado"
    };

    final forecast = ForecastModel.fromJson(json);

    expect(forecast.temp, 22);
    expect(forecast.description, "Soleado");
  });
}
