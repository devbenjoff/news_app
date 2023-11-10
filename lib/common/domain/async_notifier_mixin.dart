import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/common/domain/entities/failure.dart';
import 'package:news_app/common/domain/providers/global_failure_provider.dart';

mixin AsyncNotifierMixin {
  FutureOr<T> executeBuildWithGlobalFailure<T>(
      FutureOr<T> Function() f, Ref ref) async {
    try {
      return await f();
    } catch (e) {
      ref
          .read(globalFailureProvider.notifier)
          .update((_) => Failure.generic(error: e));
      rethrow;
    }
  }
}
