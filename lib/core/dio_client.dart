import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioClient {
  late Dio dio;

  DioClient() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://slimbde.atwebpages.com/php-api',
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    );
  }

  Future<T> get<T>(
    String path,
    T Function(Map<String, dynamic>) fromJson, {
    Map<String, dynamic>? queryParameters = const {},
  }) async {
    try {
      final response = await dio.get(
        _normalizePath(path),
        queryParameters: queryParameters,
      );
      return fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      debugPrint('dio "get" exception: $e');
      rethrow;
    }
  }

  Future<String> authenticate(String login, String password) async {
    final response = await dio.get(
      _normalizePath('/users/authenticate'),
      queryParameters: {'login': login, 'password': password},
    );

    return response.data?.toString() ?? '';
  }

  Future<String> register(String login, String password) async {
    final response = await dio.post(
      _normalizePath('/users'),
      data: {
        'login': login,
        'password': password,
      },
      options: Options(
        contentType: Headers.formUrlEncodedContentType,
        responseType: ResponseType.plain,
      ),
    );

    return response.data?.toString() ?? '';
  }

  Future<String> alterCredentials({
    required String prevLogin,
    required String login,
    required String password,
  }) async {
    final response = await dio.get(
      _normalizePath('/users/altercredentials'),
      queryParameters: {
        'prevLogin': prevLogin,
        'login': login,
        'password': password,
      },
    );

    return response.data?.toString() ?? '';
  }

  Future<List<T>> getList<T>(
    String path,
    T Function(Map<String, dynamic>) fromJson, {
    Map<String, dynamic>? queryParameters = const {},
  }) async {
    try {
      final response = await dio.get(
        _normalizePath(path),
        queryParameters: queryParameters,
      );
      final List<dynamic> data = response.data ?? [];
      final dtos = <T>[];

      for (final json in data) {
        try {
          dtos.add(fromJson(json as Map<String, dynamic>));
        } catch (e) {
          debugPrint('dio "getList" skip item: $e');
        }
      }

      return dtos;
    } catch (e) {
      debugPrint('dio "getList" exception: $e');
      return [];
    }
  }

  String _normalizePath(String path) {
    return path.startsWith('/') ? path : '/$path';
  }
}
