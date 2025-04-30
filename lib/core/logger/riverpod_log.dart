import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'log.dart';

class RiverpodObserver extends ProviderObserver {
  @override
  void didAddProvider(
    ProviderBase<Object?> provider,
    Object? value,
    ProviderContainer container,
  ) {
    Log.debug(_format(event: 'Added', provider: provider, value: value));
  }

  @override
  void didDisposeProvider(
    ProviderBase<Object?> provider,
    ProviderContainer container,
  ) {
    Log.warning(_format(event: 'Disposed', provider: provider));
  }

  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    Log.info(
      _format(
        event: 'Updated',
        provider: provider,
        value: newValue,
        previousValue: previousValue,
      ),
    );
  }

  @override
  void providerDidFail(
    ProviderBase<Object?> provider,
    Object error,
    StackTrace stackTrace,
    ProviderContainer container,
  ) {
    Log.fatal(error: error, stackTrace: stackTrace);
    Log.error(_format(event: 'Failed', provider: provider, value: error));
  }

  /// Formats provider logs for consistent and readable output.
  String _format({
    required String event,
    required ProviderBase<Object?> provider,
    Object? value,
    Object? previousValue,
  }) {
    final buffer = StringBuffer('[Riverpod][$event] ');
    buffer.write('Provider: ${provider.name ?? provider.runtimeType}');

    if (value != null) {
      buffer.write(', Value: $value');
    }

    if (previousValue != null) {
      buffer.write(', Previous: $previousValue');
    }

    return buffer.toString();
  }
}
