import 'package:coursework/presentation/bloc/notion/notion_bloc.dart';
import 'package:coursework/presentation/bloc/notion/notion_event.dart';
import 'package:coursework/presentation/bloc/notion/notion_state.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotionRetry extends StatelessWidget {
  final String message;
  final NotionEvent retryEvent;

  const NotionRetry({
    super.key,
    required this.message,
    required this.retryEvent,
  });

  Future<void> _refresh(BuildContext context) async {
    final bloc = context.read<NotionBloc>();
    bloc.add(retryEvent);
    await bloc.stream.firstWhere((state) => state is! NotionLoadingState);
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      // dragging with a mouse keeps the gesture usable on web and desktop
      behavior: ScrollConfiguration.of(
        context,
      ).copyWith(dragDevices: PointerDeviceKind.values.toSet()),
      child: RefreshIndicator(
        onRefresh: () => _refresh(context),
        child: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(message, textAlign: TextAlign.center),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
