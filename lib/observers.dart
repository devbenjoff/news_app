import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Observers extends ProviderObserver {
  @override
  void didAddProvider(
    ProviderBase provider,
    Object? value,
    ProviderContainer container,
  ) {
    debugPrint('''
    {
      "provider": "${provider.name ?? provider.runtimeType}",
      "newValue": "initialized with the value $value",
    }
    ''');
  }

  @override
  void didUpdateProvider(
    ProviderBase provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    debugPrint('''
    {
      "provider": "${provider.name ?? provider.runtimeType}",
      "newValue": "$newValue",
    }
    ''');
  }

  @override
  void providerDidFail(
    ProviderBase provider,
    Object error,
    StackTrace stackTrace,
    ProviderContainer container,
  ) {
    debugPrint('''
    {
      "provider": "${provider.name ?? provider.runtimeType}",
      "newValue": "failed with the error $error",
    }
    ''');
  }

  @override
  void didDisposeProvider(
    ProviderBase provider,
    ProviderContainer container,
  ) {
    debugPrint('''
    {
      "provider": "${provider.name ?? provider.runtimeType}",
      "newValue": "disposed",
    }
    ''');
  }
}
