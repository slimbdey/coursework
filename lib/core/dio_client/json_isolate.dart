import 'dart:isolate';

import 'package:flutter/foundation.dart';

const jsonIsolateListThreshold = 50;

Future<List<T>> parseJsonListMaybeIsolate<T>(
  List<dynamic> data,
  T Function(Map<String, dynamic>) fromJson,
) async {
  if (kIsWeb || data.length < jsonIsolateListThreshold) {
    return _mapJsonList(data, fromJson);
  }

  try {
    return await Isolate.run(() => _mapJsonList(data, fromJson));
  } catch (_) {
    return _mapJsonList(data, fromJson);
  }
}

List<T> _mapJsonList<T>(
  List<dynamic> data,
  T Function(Map<String, dynamic>) fromJson,
) {
  final dtos = <T>[];

  for (final json in data) {
    try {
      dtos.add(fromJson(json as Map<String, dynamic>));
    } catch (_) {
      // Skip malformed items
    }
  }

  return dtos;
}
