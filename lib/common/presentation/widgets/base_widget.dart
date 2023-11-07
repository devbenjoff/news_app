import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loggy/loggy.dart';
import 'package:news_app/common/domain/entities/failure.dart';
import 'package:news_app/common/domain/providers/global_failure_provider.dart';
import 'package:news_app/common/domain/providers/global_loading_provider.dart';
import 'package:news_app/common/presentation/widgets/base_loading_indicator.dart';

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
    final showLoading = ref.watch(globalLoadingProvider);

    return Stack(
      children: [
        widget.child,
        if (showLoading) const BaseLoadingIndicator(),
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
