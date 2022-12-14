import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class DioLogger {
  DioLogger._();

  static final DioLogger _instance = DioLogger._();
  factory DioLogger() {
    return _instance;
  }
  final Logger _logger = Logger(
    filter: DevelopmentFilter(),
    printer: PrettyPrinter(
        lineLength: 80,
        methodCount: 0,
        colors: true, // Colorful log messages
        printEmojis: false, // Print an emoji for each log message
        printTime: false // Should each log print contain a timestamp
        ),
  );
  void onSend(RequestOptions options) {
    _logger.v(
      '''
๐  Req Path: ${options.path.toUpperCase()} [${options.method}]-> ${options.baseUrl}${options.path}
๐  Req Token: ${options.headers['Authorization']}
๐  Req QueryParams: ${options.queryParameters}  
๐  Req Data: ${options.data}
      ''',
    );
  }

  void onSuccess(Response<dynamic> response) {
    _logger.i(
      '''
๐ขโฉ Res Data: ๐งถ ${response.data} ๐งถ
๐ขโฉ Res Path: ${response.requestOptions.path.toUpperCase()} [${response.requestOptions.method}]<- ${response.requestOptions.baseUrl}${response.requestOptions.path} 
๐ขโฉ Res StatusCode: ${response.statusCode} 
๐ขโฉ Res StatusMessage: ${response.statusMessage}โกโจโจ
      ''',
    );
  }

  void onError(DioError error) {
    _logger.e(
      '''
๐ด Err Path: ${error.response!.requestOptions.path.toUpperCase()} [${error.response!.requestOptions.method}]<- ${error.response!.requestOptions.baseUrl}${error.response!.requestOptions.path}
๐ด Err Type : ${error.type} 
๐ด Err StatusCode: ${error.response!.statusCode} 
๐ด Err StatusMessage : ${error.response!.statusMessage} 
๐ด Err ResponseData: ${error.response!.data}
      ''',
    );
  }
}
