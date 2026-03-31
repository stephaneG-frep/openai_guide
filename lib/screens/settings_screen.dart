import 'package:flutter/material.dart';
import '../app_theme.dart';

class SettingsScreen extends StatefulWidget {
  final String openaiApiKey;
  final String openaiModel;
  final Future<void> Function(String apiKey, String model) onSaveOpenAiSettings;
  final Future<void> Function() onResetProgress;

  const SettingsScreen({
    super.key,
    required this.openaiApiKey,
    required this.openaiModel,
    required this.onSaveOpenAiSettings,
    required this.onResetProgress,
  });

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late final TextEditingController _apiKeyCtrl;
  late final TextEditingController _modelCtrl;

  String _status = '';
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _apiKeyCtrl = TextEditingController(text: widget.openaiApiKey);
    _modelCtrl = TextEditingController(text: widget.openaiModel);
  }

  @override
  void dispose() {
    _apiKeyCtrl.dispose();
    _modelCtrl.dispose();
    super.dispose();
  }

  Future<void> _saveApiSettings() async {
    setState(() => _isSaving = true);
    await widget.onSaveOpenAiSettings(_apiKeyCtrl.text, _modelCtrl.text);
    if (mounted) {
      setState(() {
        _isSaving = false;
        _status = _apiKeyCtrl.text.trim().isNotEmpty
            ? 'Cle API enregistree'
            : 'Cle API effacee';
      });
    }
  }

  void _confirmReset() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: context.cardBg,
        title: Text('Reinitialiser la progression',
            style: TextStyle(color: context.slate50)),
        content: Text(
            'Supprimer chapitres lus, favoris et scores quiz ?',
            style: TextStyle(color: context.slate300)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text('Annuler', style: TextStyle(color: context.slate300)),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(ctx);
              await widget.onResetProgress();
              if (mounted) setState(() => _status = 'Progression reinitialisee');
            },
            child: const Text('Reinitialiser',
                style: TextStyle(color: Colors.redAccent)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 34),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _card(context, [
            _title(context, 'OpenAI'),
            Text(
                "Entre ta cle API OpenAI pour utiliser le coach de prompts.",
                style: TextStyle(
                    color: context.slate300, fontSize: 14, height: 1.4)),
            _label(context, 'Cle API'),
            _input(_apiKeyCtrl, 'sk-...', obscure: true),
            _label(context, 'Modele'),
            _input(_modelCtrl, 'gpt-4o-mini'),
            _primaryBtn(
                context,
                _isSaving ? 'Sauvegarde...' : 'Sauvegarder',
                _isSaving ? null : _saveApiSettings),
            if (_status.isNotEmpty)
              Text(_status, style: TextStyle(color: context.slate300)),
          ]),
          const SizedBox(height: 12),
          _card(context, [
            _title(context, 'Donnees'),
            Text(
                'Reinitialise les donnees locales de progression (chapitres lus, favoris, tentatives et meilleur score).',
                style: TextStyle(
                    color: context.slate300, fontSize: 14, height: 1.4)),
            _dangerBtn(context, 'Reinitialiser ma progression', _confirmReset),
          ]),
          const SizedBox(height: 12),
          _card(context, [
            _title(context, 'Theme'),
            Row(children: [
              Expanded(child: _themeBtn(context, 'Vert / Orange', AppTheme.greenOrange)),
              const SizedBox(width: 8),
              Expanded(child: _themeBtn(context, 'Rouge / Bleu', AppTheme.redBlue)),
            ]),
            _themeBtn(context, 'Nokia — Bleu marine', AppTheme.nokia),
          ]),
        ],
      ),
    );
  }

  Widget _card(BuildContext context, List<Widget> children) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.cardBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: context.steel),
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: children
              .expand((w) => [w, const SizedBox(height: 10)])
              .toList()
            ..removeLast()),
    );
  }

  Widget _title(BuildContext context, String text) => Text(text,
      style: TextStyle(
          color: context.slate50, fontSize: 21, fontWeight: FontWeight.w800));

  Widget _label(BuildContext context, String text) => Text(text,
      style: TextStyle(
          color: context.sun, fontSize: 14, fontWeight: FontWeight.w700));

  Widget _input(TextEditingController ctrl, String hint,
      {bool obscure = false}) {
    return TextField(
      controller: ctrl,
      obscureText: obscure,
      autocorrect: false,
      style: TextStyle(color: context.slate50),
      decoration: InputDecoration(
        hintText: hint,
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
    );
  }

  Widget _primaryBtn(BuildContext context, String label, VoidCallback? onTap) =>
      ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: context.emerald,
          padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        child: Text(label,
            style: TextStyle(
                color: context.emeraldBg, fontWeight: FontWeight.w800)),
      );

  Widget _dangerBtn(BuildContext context, String label, VoidCallback onTap) =>
      OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          backgroundColor: const Color(0xFF7F1D1D),
          side: const BorderSide(color: Color(0xFFFCA5A5)),
          padding: const EdgeInsets.symmetric(vertical: 11),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        child: Text(label,
            style: const TextStyle(
                color: Color(0xFFFEE2E2), fontWeight: FontWeight.w700)),
      );

  Widget _themeBtn(BuildContext context, String label, AppTheme theme) {
    final isActive = themeNotifier.value == theme;
    return OutlinedButton(
      onPressed: () => themeNotifier.value = theme,
      style: OutlinedButton.styleFrom(
        backgroundColor: isActive ? context.emeraldBg : context.navy800,
        side: BorderSide(color: isActive ? context.emerald : context.steel),
        padding: const EdgeInsets.symmetric(vertical: 11),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Text(label,
          style: TextStyle(
              color: isActive ? context.emeraldSoft : context.slate300,
              fontWeight: FontWeight.w700)),
    );
  }
}
