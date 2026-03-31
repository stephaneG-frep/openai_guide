import 'package:flutter/material.dart';
import '../app_theme.dart';
import '../content/content.dart';

class ManualScreen extends StatefulWidget {
  final List<String> readChapterIds;
  final List<String> favoriteChapterIds;
  final void Function(String chapterId) onReadChapter;
  final void Function(String chapterId) onToggleFavorite;

  const ManualScreen({
    super.key,
    required this.readChapterIds,
    required this.favoriteChapterIds,
    required this.onReadChapter,
    required this.onToggleFavorite,
  });

  @override
  State<ManualScreen> createState() => _ManualScreenState();
}

class _ManualScreenState extends State<ManualScreen> {
  String _activeChapterId = kChapters.first.id;
  String _search = '';
  bool _favoritesOnly = false;

  List<Chapter> get _filtered {
    return kChapters.where((c) {
      final text =
          '${c.title} ${c.explanation} ${c.short}'.toLowerCase();
      final matchSearch = text.contains(_search.trim().toLowerCase());
      final matchFav = _favoritesOnly
          ? widget.favoriteChapterIds.contains(c.id)
          : true;
      return matchSearch && matchFav;
    }).toList();
  }

  Chapter? get _activeChapter {
    final filtered = _filtered;
    return filtered.firstWhere(
      (c) => c.id == _activeChapterId,
      orElse: () => filtered.isNotEmpty ? filtered.first : kChapters.first,
    );
  }

  @override
  Widget build(BuildContext context) {
    final filtered = _filtered;
    final active = _activeChapter;

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Chapitres',
              style: TextStyle(
                  color: context.slate50,
                  fontSize: 24,
                  fontWeight: FontWeight.w800)),
          const SizedBox(height: 10),
          TextField(
            onChanged: (v) => setState(() => _search = v),
            style: TextStyle(color: context.slate50),
            decoration: InputDecoration(
              hintText: 'Rechercher un chapitre...',
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
          const SizedBox(height: 8),
          OutlinedButton(
            onPressed: () => setState(() => _favoritesOnly = !_favoritesOnly),
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: context.steel),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
            child: Text(
              _favoritesOnly
                  ? 'Afficher tous les chapitres'
                  : 'Afficher favoris seulement',
              style: TextStyle(
                  color: context.slate50, fontWeight: FontWeight.w700),
            ),
          ),
          const SizedBox(height: 10),
          if (filtered.isEmpty) ...[
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: context.cardBg,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: context.steel),
              ),
              child: Text('Aucun chapitre ne correspond a ce filtre.',
                  style: TextStyle(color: context.slate300)),
            ),
          ] else ...[
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: filtered.map((c) {
                final isActive = c.id == _activeChapterId ||
                    (active?.id == c.id);
                return GestureDetector(
                  onTap: () => setState(() => _activeChapterId = c.id),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 7, horizontal: 12),
                    decoration: BoxDecoration(
                      color: isActive ? context.emeraldBg : context.navy800,
                      borderRadius: BorderRadius.circular(999),
                      border: Border.all(
                          color: isActive ? context.emerald : context.steel),
                    ),
                    child: Text(
                      c.short,
                      style: TextStyle(
                        color: isActive
                            ? context.emeraldSoft
                            : context.slate300,
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 12),
            if (active != null) _buildChapterCard(context, active),
          ],
        ],
      ),
    );
  }

  Widget _buildChapterCard(BuildContext context, Chapter chapter) {
    final isRead = widget.readChapterIds.contains(chapter.id);
    final isFav = widget.favoriteChapterIds.contains(chapter.id);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.cardBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: context.steel),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(chapter.title,
              style: TextStyle(
                  color: context.slate50,
                  fontSize: 22,
                  fontWeight: FontWeight.w800)),
          const SizedBox(height: 8),
          Text(chapter.explanation,
              style: TextStyle(
                  color: const Color(0xFFD1D5DB), fontSize: 15, height: 1.5)),
          const SizedBox(height: 10),
          Text('Exemple de prompt',
              style: TextStyle(
                  color: context.sun,
                  fontSize: 14,
                  fontWeight: FontWeight.w700)),
          const SizedBox(height: 6),
          Container(
            padding: const EdgeInsets.all(11),
            decoration: BoxDecoration(
              color: context.navy950,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: context.steel),
            ),
            child: Text(chapter.promptExample,
                style: TextStyle(
                    color: context.slate50, fontSize: 14, height: 1.4)),
          ),
          const SizedBox(height: 10),
          Text('Bonne pratique',
              style: TextStyle(
                  color: context.sun,
                  fontSize: 14,
                  fontWeight: FontWeight.w700)),
          const SizedBox(height: 6),
          Text(chapter.bestPractice,
              style: TextStyle(
                  color: const Color(0xFFD1D5DB), fontSize: 15, height: 1.5)),
          const SizedBox(height: 14),
          OutlinedButton(
            onPressed: () => widget.onReadChapter(chapter.id),
            style: OutlinedButton.styleFrom(
              backgroundColor: context.emeraldBg,
              side: BorderSide(color: context.emerald),
              padding: const EdgeInsets.symmetric(vertical: 11),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
            child: Text(
              isRead ? 'Chapitre deja valide' : 'Marquer comme lu',
              style: TextStyle(
                  color: context.emeraldSoft, fontWeight: FontWeight.w700),
            ),
          ),
          const SizedBox(height: 8),
          OutlinedButton(
            onPressed: () => widget.onToggleFavorite(chapter.id),
            style: OutlinedButton.styleFrom(
              backgroundColor: context.amberBg,
              side: BorderSide(color: context.amber),
              padding: const EdgeInsets.symmetric(vertical: 11),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
            child: Text(
              isFav ? 'Retirer des favoris' : 'Ajouter aux favoris',
              style: TextStyle(
                  color: context.accentLight, fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }
}
