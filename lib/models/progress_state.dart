class ProgressState {
  final List<String> readChapterIds;
  final List<String> favoriteChapterIds;
  final int quizAttempts;
  final int quizBestScore;

  const ProgressState({
    required this.readChapterIds,
    required this.favoriteChapterIds,
    required this.quizAttempts,
    required this.quizBestScore,
  });

  static const ProgressState initial = ProgressState(
    readChapterIds: [],
    favoriteChapterIds: [],
    quizAttempts: 0,
    quizBestScore: 0,
  );

  ProgressState copyWith({
    List<String>? readChapterIds,
    List<String>? favoriteChapterIds,
    int? quizAttempts,
    int? quizBestScore,
  }) {
    return ProgressState(
      readChapterIds: readChapterIds ?? this.readChapterIds,
      favoriteChapterIds: favoriteChapterIds ?? this.favoriteChapterIds,
      quizAttempts: quizAttempts ?? this.quizAttempts,
      quizBestScore: quizBestScore ?? this.quizBestScore,
    );
  }

  Map<String, dynamic> toJson() => {
        'readChapterIds': readChapterIds,
        'favoriteChapterIds': favoriteChapterIds,
        'quizAttempts': quizAttempts,
        'quizBestScore': quizBestScore,
      };

  factory ProgressState.fromJson(Map<String, dynamic> json) {
    return ProgressState(
      readChapterIds: (json['readChapterIds'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      favoriteChapterIds: (json['favoriteChapterIds'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      quizAttempts: (json['quizAttempts'] as int?) ?? 0,
      quizBestScore: (json['quizBestScore'] as int?) ?? 0,
    );
  }
}
