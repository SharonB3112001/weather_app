class ForecastModel {
  final DateTime date;
  final double temperature;
  final String description;

  ForecastModel({
    required this.date,
    required this.temperature,
    required this.description,
  });

  factory ForecastModel.fromJson(Map<String, dynamic> json) {
    return ForecastModel(
      date: DateTime.tryParse(json['datetime']) ?? DateTime.now(),
      temperature: (json['temp'] ?? 0).toDouble(),
      description: json['conditions'] ?? '',
    );
  }
}
