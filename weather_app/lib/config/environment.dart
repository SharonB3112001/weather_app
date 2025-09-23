import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String get apiKey => dotenv.env['API_KEY'] ?? '';
  static String get baseUrl => dotenv.env['BASE_URL'] ?? '';
  static const openAiKey = String.fromEnvironment('GEMINI_API_KEY');

  static Future<void> init() async {
    await dotenv.load(fileName: ".env");
  }
}
