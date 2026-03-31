import 'package:flutter/material.dart';
import '../app_theme.dart';
import '../content/content.dart';

class QuizScreen extends StatefulWidget {
  final int previousBest;
  final int totalQuestions;
  final Future<void> Function(int score) onQuizFinished;

  const QuizScreen({
    super.key,
    required this.previousBest,
    required this.totalQuestions,
    required this.onQuizFinished,
  });

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _index = 0;
  int _score = 0;
  bool _done = false;

  QuizQuestion get _current => kQuizQuestions[_index];

  Future<void> _answer(String option) async {
    int next = _score;
    if (option == _current.answer) {
      next = _score + 1;
      setState(() => _score = next);
    }
    if (_index + 1 >= kQuizQuestions.length) {
      setState(() => _done = true);
      await widget.onQuizFinished(next);
      return;
    }
    setState(() => _index++);
  }

  void _restart() {
    setState(() {
      _index = 0;
      _score = 0;
      _done = false;
    });
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
            Text(
              'Meilleur score actuel: ${widget.previousBest}/${widget.totalQuestions}',
              style: TextStyle(color: context.slate300, fontSize: 13),
            ),
            const SizedBox(height: 10),
            if (!_done) ...[
              Text(
                'Question ${_index + 1}/${kQuizQuestions.length}',
                style: TextStyle(
                    color: context.slate50,
                    fontSize: 22,
                    fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 8),
              Text(
                _current.question,
                style: TextStyle(
                    color: const Color(0xFFD1D5DB),
                    fontSize: 15,
                    height: 1.5),
              ),
              const SizedBox(height: 12),
              ..._current.options.map((opt) => Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: OutlinedButton(
                      onPressed: () => _answer(opt),
                      style: OutlinedButton.styleFrom(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.all(12),
                        side: BorderSide(color: context.steel),
                        backgroundColor: context.navy800,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      child: Text(opt,
                          style: TextStyle(
                              color: context.slate50,
                              fontWeight: FontWeight.w600,
                              fontSize: 14)),
                    ),
                  )),
            ] else ...[
              Text('Resultat final',
                  style: TextStyle(
                      color: context.slate50,
                      fontSize: 22,
                      fontWeight: FontWeight.w800)),
              const SizedBox(height: 8),
              Text(
                'Tu as obtenu $_score/${kQuizQuestions.length}.',
                style: TextStyle(
                    color: const Color(0xFFD1D5DB),
                    fontSize: 15,
                    height: 1.5),
              ),
              const SizedBox(height: 14),
              ElevatedButton(
                onPressed: _restart,
                style: ElevatedButton.styleFrom(
                  backgroundColor: context.amber,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: Text('Recommencer le quiz',
                    style: TextStyle(
                        color: context.cardBg,
                        fontWeight: FontWeight.w800)),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
