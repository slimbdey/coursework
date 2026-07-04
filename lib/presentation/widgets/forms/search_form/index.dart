import 'package:coursework/presentation/bloc/search/search_bloc.dart';
import 'package:coursework/presentation/bloc/search/search_event.dart';
import 'package:coursework/presentation/bloc/search/search_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'search_error.dart';
import 'search_form_button.dart';
import 'search_form_input.dart';
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
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        final isLoading = state is SearchLoadingState;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: SearchFormInput.controlHeight,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: SearchFormInput(
                      controller: _queryController,
                      isLoading: isLoading,
                      onSubmitted: _onSearch,
                    ),
                  ),
                  const SizedBox(width: 12),
                  SearchFormButton(onPressed: _onSearch, isLoading: isLoading),
                ],
              ),
            ),
            if (state is SearchLoadedState) ...[
              const SizedBox(height: 16),
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
