import 'package:flutter/material.dart';
import '../app_theme.dart';

class HomeScreen extends StatelessWidget {
  final int chaptersRead;
  final int totalChapters;
  final int quizAttempts;
  final int quizBestScore;
  final int quizTotal;
  final int favoriteCount;
  final VoidCallback onGoManual;
  final VoidCallback onGoQuiz;
  final VoidCallback onGoCoach;
  final VoidCallback onGoSettings;

  const HomeScreen({
    super.key,
    required this.chaptersRead,
    required this.totalChapters,
    required this.quizAttempts,
    required this.quizBestScore,
    required this.quizTotal,
    required this.favoriteCount,
    required this.onGoManual,
    required this.onGoQuiz,
    required this.onGoCoach,
    required this.onGoSettings,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: context.heroGradient,
        ),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 16),
              Text(
                "Apprendre l'IA de facon pratique",
                style: TextStyle(
                  color: context.slate50,
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Manuel mobile avec exemples de prompts, quiz et coach pour progresser chaque jour.",
                style: TextStyle(color: context.slate300, fontSize: 16, height: 1.4),
              ),
              const SizedBox(height: 18),
              // Carte progression
              Container(
                decoration: BoxDecoration(
                  color: context.cardBg,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: context.steel),
                ),
                padding: const EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Progression',
                      style: TextStyle(
                          color: context.sun,
                          fontSize: 16,
                          fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(height: 8),
                    _statLine(context, 'Chapitres lus', '$chaptersRead/$totalChapters'),
                    _statLine(context, 'Tentatives quiz', '$quizAttempts'),
                    _statLine(context, 'Meilleur score', '$quizBestScore/$quizTotal'),
                    _statLine(context, 'Favoris', '$favoriteCount'),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              _primaryBtn(context, 'Lire le manuel', onGoManual),
              const SizedBox(height: 10),
              _secondaryBtn(context, 'Passer le quiz', onGoQuiz),
              const SizedBox(height: 10),
              _coachBtn(context, 'Parler au coach prompts', onGoCoach),
              const SizedBox(height: 10),
              _settingsBtn(context, 'Ouvrir les parametres', onGoSettings),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _statLine(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(color: context.slate300, fontSize: 14)),
          Text(value,
              style: TextStyle(
                  color: context.slate100,
                  fontSize: 14,
                  fontWeight: FontWeight.w700)),
        ],
      ),
    );
  }

  Widget _primaryBtn(BuildContext context, String label, VoidCallback onTap) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: context.amber,
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Text(label,
          style: TextStyle(
              color: context.cardBg, fontWeight: FontWeight.w800, fontSize: 15)),
    );
  }

  Widget _secondaryBtn(BuildContext context, String label, VoidCallback onTap) {
    return OutlinedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 14),
        side: BorderSide(color: context.steel),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Text(label,
          style: TextStyle(
              color: context.slate50, fontWeight: FontWeight.w700, fontSize: 15)),
    );
  }

  Widget _coachBtn(BuildContext context, String label, VoidCallback onTap) {
    return OutlinedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
        backgroundColor: context.emeraldBg,
        padding: const EdgeInsets.symmetric(vertical: 14),
        side: BorderSide(color: context.emerald),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Text(label,
          style: TextStyle(
              color: context.emeraldSoft,
              fontWeight: FontWeight.w700,
              fontSize: 15)),
    );
  }

  Widget _settingsBtn(BuildContext context, String label, VoidCallback onTap) {
    return OutlinedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 14),
        side: BorderSide(color: context.steel),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Text(label,
          style: TextStyle(
              color: context.slate50, fontWeight: FontWeight.w700, fontSize: 15)),
    );
  }
}
