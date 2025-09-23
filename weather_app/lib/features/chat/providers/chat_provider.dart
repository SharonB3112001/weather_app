import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/ai/ai_service.dart';
import '../../forecast/providers/forecast_providers.dart';
import '../../events/providers/event_provider.dart';

class ChatMessage {
  final String role;
  final String content;
  ChatMessage(this.role, this.content);
}

class ChatNotifier extends StateNotifier<List<ChatMessage>> {
  final AIService aiService;
  final Ref ref;

  ChatNotifier(this.aiService, this.ref) : super([]);

  Future<void> sendMessage(String message) async {
    state = [...state, ChatMessage("user", message)];

    try {
      final forecast = await ref.read(forecastProvider.future);
      final events = await ref.read(eventsProvider.future);

      final context = """
Pronóstico últimos 5 días:
${forecast.map((f) => "${f.date}: ${f.temp}°C (min ${f.tempMin}°C, max ${f.tempMax}°C), ${f.conditions}").join("\n")}

Eventos climáticos recientes:
${events.map((e) => "${e.date.toLocal().toString().split(" ").first}: ${e.type} - ${e.description}").join("\n")}
""";

      final reply = await aiService.askAI(
        message,
        context: context,
      );

      state = [...state, ChatMessage("assistant", reply)];
    } catch (e) {
      state = [...state, ChatMessage("assistant", "Error: $e")];
    }
  }
}

final chatProvider =
    StateNotifierProvider<ChatNotifier, List<ChatMessage>>((ref) {
  return ChatNotifier(AIService(), ref);
});
