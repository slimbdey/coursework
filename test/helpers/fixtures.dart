import 'package:coursework/application/infrastructure/queries/training_set_provider.dart';
import 'package:coursework/domain/db_info.dart';
import 'package:coursework/domain/notion.dart';
import 'package:coursework/domain/word.dart';
import 'package:coursework/presentation/bloc/training/training_state.dart';

Notion notion({int id = 1, String issue = 'issue', String answer = 'answer'}) =>
    Notion(id: id, issue: issue, answer: answer);

Word word({
  int id = 1,
  String text = 'hello',
  String translation = 'привет',
  String addDate = '2024-01-01',
  String example = 'Hello world',
  String? answer,
}) => Word(
  id: id,
  word: text,
  translation: translation,
  addDate: addDate,
  example: example,
  issue: text,
  answer: answer ?? translation,
);

DbInfo dbInfo({
  int gerunds = 1,
  int idioms = 2,
  int phrasals = 3,
  int phrases = 4,
  int words = 5,
}) => DbInfo(
  gerunds: gerunds,
  idioms: idioms,
  phrasals: phrasals,
  phrases: phrases,
  words: words,
);

TrainingSet trainingSet({
  List<List<Word>>? groups,
  List<int>? roundGroupCounts,
}) {
  final resolvedGroups =
      groups ??
      [
        [word(id: 1, text: 'a', translation: 'а')],
        [word(id: 2, text: 'b', translation: 'б')],
      ];
  return TrainingSet(
    groups: resolvedGroups,
    roundGroupCounts: roundGroupCounts ?? [1, resolvedGroups.length],
  );
}

TrainingLoadedState trainingLoaded({
  List<Word>? roundWords,
  int currentIndex = 0,
  int currentRoundIndex = 0,
  List<int> roundGroupCounts = const [1],
  List<List<Word>>? groups,
  bool isFinished = false,
}) {
  final words = roundWords ?? [word(id: 1, translation: 'да')];
  final resolvedGroups = groups ?? [words];
  return TrainingLoadedState(
    login: 'u@test.com',
    groups: resolvedGroups,
    roundGroupCounts: roundGroupCounts,
    roundWords: words,
    currentIndex: currentIndex,
    currentRoundIndex: currentRoundIndex,
    isFinished: isFinished,
  );
}
