import 'package:logger/logger.dart';

class Log {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 2,
      errorMethodCount: 8,
      lineLength: 80,
      colors: true,
      printEmojis: true,
      dateTimeFormat: (time) => time.toIso8601String(),
    ),
  );

  // Static logging methods

  static void debug(String message) => _logger.d(message);

  static void info(String message) => _logger.i(message);

  static void warning(String message) => _logger.w(message);

  static void error(String message) => _logger.e(message);

  static void fatal({
    required Object error,
    required StackTrace stackTrace,
    String message = 'Fatal Error',
  }) => _logger.f(message, error: error, stackTrace: stackTrace);

  static void log(Level level, String message) => _logger.log(level, message);
}
