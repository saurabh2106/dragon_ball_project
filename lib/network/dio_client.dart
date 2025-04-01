import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DioClient {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://dragonball-api.com/api/',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
    ),
  );

  DioClient() {
    dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestBody: true,
        responseBody: true,
        error: true,
      ),
    );
  }

  Future<Response> get(
    String endpointUrl, {
    Map<String, dynamic>? params,
  }) async {
    try {
      final response = await dio.get(endpointUrl, queryParameters: params);
      return response;
    } on DioException catch (e) {
      print('❌ API Error: ${e.response?.statusCode} - ${e.message}');
      throw Exception('API error - Failed to fetch data: ${e.message}');
    } catch (e) {
      print('❌ Unknown Error: $e');
      rethrow;
    }
  }
}

final dioProvider = Provider<DioClient>((ref) => DioClient());
