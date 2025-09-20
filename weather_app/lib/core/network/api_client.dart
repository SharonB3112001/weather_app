import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../config/environment.dart';
import '../errors/exceptions.dart';

class ApiClient {
  final http.Client client;

  ApiClient({required this.client});

  Future<dynamic> get(String endpoint) async {
    final url = Uri.parse('${Environment.baseUrl}$endpoint&key=${Environment.apiKey}');

    final response = await client.get(url);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw ServerException("Error ${response.statusCode}: ${response.body}");
    }
  }
}
