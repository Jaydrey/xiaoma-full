import 'package:dio/dio.dart';
import 'package:xiaoma/app/settings/settings.dart';

class DioSettings {
  DioSettings();

  static Dio configureDio() {
    final dioOptions = BaseOptions(
      baseUrl: ApiSettings.autocompletionBase,
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 10),
      contentType: ApiSettings.contentType,
    );
    final dio = Dio(dioOptions);
    return dio;
  }
}
