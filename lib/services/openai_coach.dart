import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String> askPromptCoach(String userPrompt, String apiKey, String model) async {
  if (apiKey.trim().isEmpty) {
    return 'Cle API manquante. Ajoute ta cle OpenAI dans les Parametres.';
  }
  final response = await http.post(
    Uri.parse('https://api.openai.com/v1/responses'),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $apiKey',
    },
    body: jsonEncode({
      'model': model.trim().isNotEmpty ? model : 'gpt-4o-mini',
      'input': [
        {
          'role': 'system',
          'content':
              'Tu es un coach de prompts en francais. Reponds en 3 parties: diagnostic, prompt ameliore, variante courte.',
        },
        {'role': 'user', 'content': userPrompt},
      ],
    }),
  );
  if (response.statusCode != 200) {
    return 'Erreur API (${response.statusCode}). ${response.body}';
  }
  final data = jsonDecode(response.body) as Map<String, dynamic>;
  final outputText = data['output_text'];
  if (outputText is String && outputText.trim().isNotEmpty) {
    return outputText.trim();
  }
  final output = data['output'];
  if (output is List) {
    final chunks = output
        .expand((item) {
          final content = item is Map ? item['content'] : null;
          return content is List ? content : <dynamic>[];
        })
        .map((c) => c is Map ? c['text'] : null)
        .whereType<String>()
        .join('\n')
        .trim();
    if (chunks.isNotEmpty) return chunks;
  }
  return "Je n'ai pas pu lire la reponse du modele. Reessaie avec une question plus precise.";
}
