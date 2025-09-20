import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/core/network/api_client.dart';

void main() {
  test('ApiClient should use provided http.Client', () {
    final apiClient = ApiClient(client: http.Client());

    expect(apiClient.client, isA<http.Client>());
  });
}
