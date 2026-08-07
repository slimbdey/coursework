import 'package:coursework/application/infrastructure/word_repository.dart';
import 'package:coursework/domain/word.dart';

class TrainingSet {
  final List<List<Word>> groups;
  final List<int> roundGroupCounts;

  const TrainingSet({required this.groups, required this.roundGroupCounts});

  bool get isEmpty => groups.isEmpty;

  List<Word> shuffledWordsForRound(int roundIndex) {
    final groupCount = roundGroupCounts[roundIndex];
    final words = groups.take(groupCount).expand((group) => group).toList();
    return words..shuffle();
  }
}

class TrainingSetProvider {
  static const maxGroups = 8;
  static const wordsPerGroup = 7;
  static const roundPresets = [1, 2, 4, 6, 8];

  final WordRepository repository;

  const TrainingSetProvider({required this.repository});

  Future<TrainingSet> getSet(String login) async {
    final words = await repository.getSet(login);
    final groups = _groupByDate(words);
    return TrainingSet(
      groups: groups,
      roundGroupCounts: _buildRoundCounts(groups.length),
    );
  }

  List<List<Word>> _groupByDate(List<Word> words) {
    final byDate = <String, List<Word>>{};
    for (final word in words) {
      byDate.putIfAbsent(word.addDate, () => <Word>[]).add(word);
    }

    final dates = byDate.keys.toList()..sort((a, b) => b.compareTo(a));

    return dates
        .take(maxGroups)
        .map((date) => byDate[date]!.take(wordsPerGroup).toList())
        .where((group) => group.isNotEmpty)
        .toList();
  }

  List<int> _buildRoundCounts(int groupCount) {
    if (groupCount <= 0) {
      return const [];
    }

    final rounds = roundPresets.where((count) => count <= groupCount).toList();
    if (rounds.isEmpty || rounds.last != groupCount) {
      rounds.add(groupCount);
    }
    return rounds;
  }
}
