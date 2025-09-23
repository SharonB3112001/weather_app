class ForecastDayModel {
  final String date;
  final double tempMax;
  final double tempMin;
  final double temp;
  final double humidity;
  final double precip;
  final String conditions;
  final String description;
  final String icon;

  ForecastDayModel({
    required this.date,
    required this.tempMax,
    required this.tempMin,
    required this.temp,
    required this.humidity,
    required this.precip,
    required this.conditions,
    required this.description,
    required this.icon,
  });

  factory ForecastDayModel.fromJson(Map<String, dynamic> json) {
    return ForecastDayModel(
      date: json['datetime'] ?? '',
      tempMax: (json['tempmax'] ?? 0).toDouble(),
      tempMin: (json['tempmin'] ?? 0).toDouble(),
      temp: (json['temp'] ?? 0).toDouble(),
      humidity: (json['humidity'] ?? 0).toDouble(),
      precip: (json['precip'] ?? 0).toDouble(),
      conditions: json['conditions'] ?? '',
      description: json['description'] ?? '',
      icon: json['icon'] ?? '',
    );
  }
}
