import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:developer' as devtools show log;

final dio = Dio();

final baseUrl =
    'https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=${dotenv.env['geminiApiKey']}';

final options = Options(
  headers: {
    'Content-Type': 'application/json',
  },
  validateStatus: (status) {
    return status! < 400;
  },
);

// Get Call
Future<Map<String, dynamic>> getRequest({
  required Map<String, String> queryParams,
}) async {
  Uri uri = Uri.parse(baseUrl).replace(queryParameters: queryParams);
  try {
    Response response = await dio.getUri(
      uri,
      options: options,
    );
    return response.data;
  }
  // Internet connection error handling
  on DioException catch (error) {
    if (error.type == DioExceptionType.connectionError) {
      throw Exception(
          'Your internet is not connected. Check your internet connection!');
    } else {
      throw Exception('Error while fetching query!');
    }
  } catch (error) {
    devtools.log('Error: $error');
    rethrow;
  }
}

// Post Call
Future<Map<String, dynamic>> postRequest({
  required Map<String, dynamic> data,
}) async {
  try {
    final response = await dio.postUri(
      Uri.parse(baseUrl),
      data: data,
      options: options,
    );
    return response.data;
  }
  // Internet connection error handling
  on DioException catch (error) {
    if (error.type == DioExceptionType.connectionError) {
      throw Exception(
          'Your internet is not connected. Check your internet connection!');
    } else {
      throw Exception('Error while fetching query!');
    }
  } catch (error) {
    devtools.log('Error: $error');
    rethrow;
  }
}
