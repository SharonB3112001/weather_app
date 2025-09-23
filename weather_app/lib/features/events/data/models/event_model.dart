class EventModel {
  final String id;
  final String type;
  final String description;
  final DateTime date;
  final String location;
  final double latitude;
  final double longitude;

  EventModel({
    required this.id,
    required this.type,
    required this.description,
    required this.date,
    required this.location,
    required this.latitude,
    required this.longitude,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      id: json['id']?.toString() ?? DateTime.now().millisecondsSinceEpoch.toString(),
      type: json['type'] ?? '',
      description: json['description'] ?? '',
      date: DateTime.tryParse(json['datetime'] ?? '') ?? DateTime.now(),
      location: json['location'] ?? '',
      latitude: (json['latitude'] ?? 0).toDouble(),
      longitude: (json['longitude'] ?? 0).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'description': description,
      'datetime': date.toIso8601String(),
      'location': location,
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}
