import 'package:coursework/domain/word.dart';
import 'package:flutter/material.dart';

class ProfileTodayWordsTable extends StatelessWidget {
  final List<Word> words;
  final TextStyle textStyle;

  const ProfileTodayWordsTable({
    super.key,
    required this.words,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Table(
        columnWidths: const {
          0: FlexColumnWidth(1.2),
          1: FlexColumnWidth(1),
          2: FlexColumnWidth(1.2),
        },
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: [
          for (var i = 0; i < words.length; i++)
            TableRow(
              key: ValueKey(
                words[i].id ??
                    '${words[i].word}-${words[i].addDate}-'
                    '${words[i].example}',
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: Text(
                    '${i + 1}. ${words[i].word}',
                    style: textStyle.copyWith(fontWeight: FontWeight.w700),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: Text(
                    words[i].ipa ?? '',
                    textAlign: TextAlign.center,
                    style: textStyle,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: Text(
                    words[i].translation,
                    textAlign: TextAlign.end,
                    style: textStyle,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
