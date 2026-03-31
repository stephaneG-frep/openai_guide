import 'package:flutter/material.dart';
import 'app_theme.dart';
import 'content/content.dart';
import 'models/app_settings.dart';
import 'models/progress_state.dart';
import 'storage/progress_storage.dart';
import 'storage/settings_storage.dart';
import 'screens/home_screen.dart';
import 'screens/manual_screen.dart';
import 'screens/quiz_screen.dart';
import 'screens/coach_screen.dart';
import 'screens/settings_screen.dart';

void main() {
  runApp(const OpenAIGuideApp());
}

class OpenAIGuideApp extends StatelessWidget {
  const OpenAIGuideApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<AppTheme>(
      valueListenable: themeNotifier,
      builder: (context, theme, _) {
        return MaterialApp(
          title: 'Notice IA',
          debugShowCheckedModeBanner: false,
          theme: buildMaterialTheme(theme),
          home: const AppShell(),
        );
      },
    );
  }
}

class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  bool _isLoading = true;
  int _currentIndex = 0;
  ProgressState _progress = ProgressState.initial;
  AppSettings _settings = AppSettings.defaults;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final storedProgress = await getStoredProgress();
    final storedSettings = await getStoredSettings();
    if (mounted) {
      setState(() {
        _progress = storedProgress ?? ProgressState.initial;
        _settings = storedSettings ?? AppSettings.defaults;
        _isLoading = false;
      });
    }
  }

  Future<void> _markChapterRead(String chapterId) async {
    if (_progress.readChapterIds.contains(chapterId)) return;
    final next = _progress.copyWith(
      readChapterIds: [..._progress.readChapterIds, chapterId],
    );
    setState(() => _progress = next);
    await saveStoredProgress(next);
  }

  Future<void> _toggleFavorite(String chapterId) async {
    final exists = _progress.favoriteChapterIds.contains(chapterId);
    final next = _progress.copyWith(
      favoriteChapterIds: exists
          ? _progress.favoriteChapterIds.where((id) => id != chapterId).toList()
          : [..._progress.favoriteChapterIds, chapterId],
    );
    setState(() => _progress = next);
    await saveStoredProgress(next);
  }

  Future<void> _saveQuizResult(int score) async {
    final next = _progress.copyWith(
      quizAttempts: _progress.quizAttempts + 1,
      quizBestScore: score > _progress.quizBestScore ? score : _progress.quizBestScore,
    );
    setState(() => _progress = next);
    await saveStoredProgress(next);
  }

  Future<void> _saveOpenAiSettings(String apiKey, String model) async {
    final next = _settings.copyWith(openaiApiKey: apiKey, openaiModel: model);
    setState(() => _settings = next);
    await saveStoredSettings(next);
  }

  Future<void> _resetProgress() async {
    await clearStoredProgress();
    setState(() => _progress = ProgressState.initial);
  }

  static const _navItems = [
    NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Accueil'),
    NavigationDestination(icon: Icon(Icons.menu_book_outlined), label: 'Manuel'),
    NavigationDestination(icon: Icon(Icons.quiz_outlined), label: 'Quiz'),
    NavigationDestination(icon: Icon(Icons.smart_toy_outlined), label: 'Coach'),
    NavigationDestination(icon: Icon(Icons.settings_outlined), label: 'Parametres'),
  ];

  String get _title {
    switch (_currentIndex) {
      case 0: return 'Notice IA';
      case 1: return 'Manuel IA';
      case 2: return 'Quiz IA';
      case 3: return 'Coach Prompts';
      case 4: return 'Parametres';
      default: return 'Notice IA';
    }
  }

  Widget _buildScreen() {
    switch (_currentIndex) {
      case 0:
        return HomeScreen(
          chaptersRead: _progress.readChapterIds.length,
          totalChapters: kChapters.length,
          quizAttempts: _progress.quizAttempts,
          quizBestScore: _progress.quizBestScore,
          quizTotal: kQuizQuestions.length,
          favoriteCount: _progress.favoriteChapterIds.length,
          onGoManual: () => setState(() => _currentIndex = 1),
          onGoQuiz: () => setState(() => _currentIndex = 2),
          onGoCoach: () => setState(() => _currentIndex = 3),
          onGoSettings: () => setState(() => _currentIndex = 4),
        );
      case 1:
        return ManualScreen(
          readChapterIds: _progress.readChapterIds,
          favoriteChapterIds: _progress.favoriteChapterIds,
          onReadChapter: _markChapterRead,
          onToggleFavorite: _toggleFavorite,
        );
      case 2:
        return QuizScreen(
          previousBest: _progress.quizBestScore,
          totalQuestions: kQuizQuestions.length,
          onQuizFinished: _saveQuizResult,
        );
      case 3:
        return CoachScreen(
          openaiApiKey: _settings.openaiApiKey,
          openaiModel: _settings.openaiModel,
        );
      case 4:
        return SettingsScreen(
          openaiApiKey: _settings.openaiApiKey,
          openaiModel: _settings.openaiModel,
          onSaveOpenAiSettings: _saveOpenAiSettings,
          onResetProgress: _resetProgress,
        );
      default:
        return const SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(
        backgroundColor: context.surfaceBg,
        body: Center(
          child: CircularProgressIndicator(color: context.sun),
        ),
      );
    }

    return ValueListenableBuilder<AppTheme>(
      valueListenable: themeNotifier,
      builder: (ctx, theme, child) => Scaffold(
        backgroundColor: ctx.surfaceBg,
        appBar: AppBar(
          title: Text(_title),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: ctx.headerGradient,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          backgroundColor: Colors.transparent,
        ),
        body: _buildScreen(),
        bottomNavigationBar: NavigationBar(
          selectedIndex: _currentIndex,
          onDestinationSelected: (i) => setState(() => _currentIndex = i),
          destinations: _navItems,
        ),
      ),
    );
  }
}
