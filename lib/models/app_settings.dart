class AppSettings {
  final String openaiApiKey;
  final String openaiModel;

  const AppSettings({
    required this.openaiApiKey,
    required this.openaiModel,
  });

  static const AppSettings defaults = AppSettings(
    openaiApiKey: '',
    openaiModel: 'gpt-4o-mini',
  );

  AppSettings copyWith({
    String? openaiApiKey,
    String? openaiModel,
  }) {
    return AppSettings(
      openaiApiKey: openaiApiKey ?? this.openaiApiKey,
      openaiModel: openaiModel ?? this.openaiModel,
    );
  }

  Map<String, dynamic> toJson() => {
        'openaiApiKey': openaiApiKey,
        'openaiModel': openaiModel,
      };

  factory AppSettings.fromJson(Map<String, dynamic> json) {
    return AppSettings(
      openaiApiKey: (json['openaiApiKey'] as String?)?.trim() ?? '',
      openaiModel: (json['openaiModel'] as String?)?.trim().isNotEmpty == true
          ? (json['openaiModel'] as String).trim()
          : AppSettings.defaults.openaiModel,
    );
  }
}
