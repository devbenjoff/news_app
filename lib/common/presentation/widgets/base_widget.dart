import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loggy/loggy.dart';
import 'package:news_app/common/domain/entities/failure.dart';
import 'package:news_app/common/domain/providers/global_failure_provider.dart';
import 'package:news_app/features/home/domain/notifiers/news_notifier.dart';

class BaseWidget extends ConsumerStatefulWidget {
  final Widget child;
  const BaseWidget({super.key, required this.child});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BaseWidgetState();
}

class _BaseWidgetState extends ConsumerState<BaseWidget> {
  @override
  Widget build(BuildContext context) {
    ref.globalFailureListener(context);

    return Stack(
      children: [
        widget.child,
      ],
    );
  }
}

extension _WidgetRefExtensions on WidgetRef {
  void globalFailureListener(BuildContext context) {
    listen<Failure?>(globalFailureProvider, (_, failure) {
      if (failure == null) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(failure.title),
          backgroundColor: failure.isCritical ? Colors.red : Colors.orange,
          behavior: SnackBarBehavior.floating,
          action: SnackBarAction(
            label: 'Try again',
            onPressed: () => refresh(asyncNewsListProvider),
          ),
        ),
      );

      logError('''
        showing ${failure.isCritical ? '' : 'non-'}critical failure:
        title: ${failure.title}
        error: ${failure.error}
        stackTrace: ${failure.stackTrace}
      ''');
    });
  }
}
