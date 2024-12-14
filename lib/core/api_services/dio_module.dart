import 'package:dio/dio.dart';

abstract class HttpMethods {
  static const String post = "POST";
  static const String get = "GET";
  static const String put = "PUT";
  static const String patch = "PATCH";
  static const String delete = "DELETE";
}

class HttpManager {
  final Dio _dio = Dio();

  Future<Map<String, dynamic>> restRequest({
    required String url,
    String method = HttpMethods.get,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    bool useAuth = false, // Optional parameter to add x-api-key header
  }) async {
    final headersDefault = headers ?? {}
      ..addAll({
        'content-type': 'application/json',
        'accept': 'application/json',
      });

    if (useAuth) {
      // Replace 'YOUR_API_KEY' with your actual API key
      const apiKey = '';

      //   PrintLog.printLog('Using API key: $apiKey');

      // Add the x-api-key to the headers
      headersDefault['x-api-key'] = apiKey;

      // PrintLog.printLog('Headers: $headersDefault');
    }

    try {
      Response response = await _dio.request(
        url,
        options: Options(method: method, headers: headersDefault),
        data: body,
        queryParameters: queryParameters,
      );

      return {
        'statusCode': response.statusCode,
        'statusMessage': response.statusMessage,
        'data': response.data,
      };
    } on DioException catch (e) {
      // Handle Dio-specific exceptions
      return {
        'statusCode': e.response?.statusCode,
        'statusMessage': e.response?.statusMessage ?? e.message,
        'error': e.message,
      };
    } catch (e) {
      // Handle any other types of exceptions
      return {
        'error': e.toString(),
      };
    }
  }
}
