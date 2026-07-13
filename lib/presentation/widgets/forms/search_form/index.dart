import 'package:coursework/presentation/bloc/search/search_bloc.dart';
import 'package:coursework/presentation/bloc/search/search_event.dart';
import 'package:coursework/presentation/bloc/search/search_state.dart';
import 'package:coursework/presentation/l10n/app_localizations.dart';
import 'package:coursework/presentation/widgets/shared/form_action_button.dart';
import 'package:coursework/presentation/widgets/shared/form_text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'search_error.dart';
import 'search_results.dart';

class SearchForm extends StatefulWidget {
  const SearchForm({super.key});

  @override
  State<SearchForm> createState() => _SearchFormState();
}

class _SearchFormState extends State<SearchForm> {
  final TextEditingController _queryController = TextEditingController();

  void _onSearch() {
    final query = _queryController.text.trim();
    if (query.isEmpty) {
      return;
    }

    context.read<SearchBloc>().add(SearchWordsEvent(query: query));
  }

  @override
  void dispose() {
    _queryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        final isLoading = state is SearchLoadingState;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: FormTextInput.controlHeight,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: FormTextInput(
                      controller: _queryController,
                      isLoading: isLoading,
                      onSubmitted: _onSearch,
                      hintText: l10n.searchFormPlaceholder,
                      textInputAction: TextInputAction.search,
                    ),
                  ),
                  const SizedBox(width: 12),
                  FormActionButton(
                    label: l10n.searchFormSubmit,
                    onPressed: _onSearch,
                    isLoading: isLoading,
                  ),
                ],
              ),
            ),
            if (state is SearchLoadedState) ...[
              const SizedBox(height: 4),
              Expanded(
                child: SearchResults(words: state.words, query: state.query),
              ),
            ],
            if (state is SearchErrorState) ...[
              const SizedBox(height: 16),
              SearchError(message: state.message),
            ],
          ],
        );
      },
    );
  }
}
