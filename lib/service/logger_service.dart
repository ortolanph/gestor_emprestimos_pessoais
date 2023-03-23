import 'package:logging/logging.dart';
import 'package:logging_appenders/logging_appenders.dart';

class LoggerService {
  final Logger _logger = Logger("GEP");

  Logger get logger => _logger;

  void init() {
    Logger.root.level = Level.ALL;
    final consoleAppender = PrintAppender.setupLogging(stderrLevel: Level.ALL);
    final fileAppender = RotatingFileAppender(baseFilePath: 'gep_log.log');
    _logger.onRecord.listen(consoleAppender.call);
    _logger.onRecord.listen(fileAppender.call);
  }
}
