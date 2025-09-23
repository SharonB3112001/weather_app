import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AIService {
  final String _endpoint =
      "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent";

  Future<String> askAI(String message, {String context = ""}) async {
    final apiKey = dotenv.env['GEMINI_API_KEY'] ?? "";

    final response = await http.post(
      Uri.parse("$_endpoint?key=$apiKey"),
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "contents": [
          {
            "parts": [
              {
                "text":
                    "Contexto: $context\nPregunta: $message\nResponde en español de forma clara."
              }
            ]
          }
        ]
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data["candidates"][0]["content"]["parts"][0]["text"];
    } else {
      throw Exception("Error al consultar la IA: ${response.body}");
    }
  }
}
