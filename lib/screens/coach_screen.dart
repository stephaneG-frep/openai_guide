import 'package:flutter/material.dart';
import '../app_theme.dart';
import '../services/openai_coach.dart';

class CoachScreen extends StatefulWidget {
  final String openaiApiKey;
  final String openaiModel;

  const CoachScreen({
    super.key,
    required this.openaiApiKey,
    required this.openaiModel,
  });

  @override
  State<CoachScreen> createState() => _CoachScreenState();
}

class _CoachScreenState extends State<CoachScreen> {
  final _controller = TextEditingController();
  String _answer =
      "Ecris ton besoin (ex: 'aide moi a rediger un prompt pour vendre mon app') puis appuie sur Analyser.";
  bool _loading = false;

  Future<void> _runCoach() async {
    final input = _controller.text.trim();
    if (input.isEmpty) return;
    setState(() => _loading = true);
    try {
      final result = await askPromptCoach(input, widget.openaiApiKey, widget.openaiModel);
      setState(() => _answer = result);
    } catch (e) {
      setState(() => _answer = "Impossible de contacter le service. ${e.toString()}");
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: context.cardBg,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: context.steel),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Coach de prompts',
                style: TextStyle(
                    color: context.slate50,
                    fontSize: 22,
                    fontWeight: FontWeight.w800)),
            const SizedBox(height: 8),
            Text(
              'Donne ton objectif et recois une proposition de prompt ameliore.',
              style: TextStyle(color: context.slate300, fontSize: 14, height: 1.4),
            ),
            if (widget.openaiApiKey.trim().isEmpty) ...[
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  color: context.amberBg,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: context.amber),
                ),
                child: Text(
                  'Cle API manquante — va dans Parametres pour la configurer.',
                  style: TextStyle(color: context.accentLight, fontSize: 13),
                ),
              ),
            ],
            const SizedBox(height: 10),
            TextField(
              controller: _controller,
              maxLines: 5,
              style: TextStyle(color: context.slate50),
              decoration: InputDecoration(
                hintText:
                    'Ex: Je veux un prompt pour creer un plan marketing IA sur 30 jours.',
                hintStyle: TextStyle(color: context.slate300),
                filled: true,
                fillColor: context.navy950,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: context.steel),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: context.emerald),
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _loading ? null : _runCoach,
              style: ElevatedButton.styleFrom(
                backgroundColor: context.emerald,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape:
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              child: Text(
                _loading ? 'Analyse en cours...' : 'Analyser',
                style: TextStyle(
                    color: context.emeraldBg, fontWeight: FontWeight.w800),
              ),
            ),
            if (_loading) ...[
              const SizedBox(height: 10),
              Center(child: CircularProgressIndicator(color: context.sun)),
            ],
            const SizedBox(height: 12),
            Text('Reponse',
                style: TextStyle(
                    color: context.sun,
                    fontWeight: FontWeight.w700,
                    fontSize: 14)),
            const SizedBox(height: 6),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: context.navy950,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: context.steel),
              ),
              child: SelectableText(
                _answer,
                style: const TextStyle(
                    color: Color(0xFFE2E8F0), fontSize: 14, height: 1.5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
