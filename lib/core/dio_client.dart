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

  Future<List<T>> getList<T>(
    String path,
    T Function(Map<String, dynamic>) fromJson,
  ) async {
    try {
      final response = await dio.get(_normalizePath(path));
      final List<dynamic> data = response.data ?? [];
      final dtos = data
          .map((json) => fromJson(json as Map<String, dynamic>))
          .toList();

      return dtos;
    } catch (e) {
      debugPrint('dio "getList" exception: $e');
      return [];
    }
  }

  Future<T> create<T>(
    String path,
    T value,
    Map<String, dynamic> Function(T) toJson,
    T Function(Map<String, dynamic>) fromJson,
  ) async {
    try {
      final response = await dio.post(
        _normalizePath(path),
        data: toJson(value),
      );

      return fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      throw Exception('datasource exception: $e');
    }
  }

  Future<void> delete(String path, int id) async {
    try {
      await dio.delete('${_normalizePath(path)}/$id');
    } catch (e) {
      throw Exception('datasource exception: $e');
    }
  }

  String _normalizePath(String path) {
    return path.startsWith('/') ? path : '/$path';
  }
}
