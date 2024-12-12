import 'dart:developer';
import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart' as dom;
import 'package:ai_detector/constant/const.dart';
import 'package:ai_detector/model/ai_res.dart';
import 'package:dio/dio.dart';

class DetectAIAPI {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: Constant.BASE_URL,
      contentType: "application/json",
      receiveDataWhenStatusError: true,
      headers: {
        "Authorization": Constant.API_TOKEN, // Authorization in headers
      },
    ),
  );

  /// Detect AI using the ChatGPT detector endpoint.
  static Future<AIDetector> detectAI(String input) async {
    try {
      final response = await dio.post(
        '/Hello-SimpleAI/chatgpt-detector-roberta',
        data: {"inputs": input},
      );

      log('Response data: ${response.data}');
      if (response.data != null && response.data is List && response.data[0] is List) {
        return AIDetector.fromJson(response.data[0][0]);
      } else {
        throw Exception('Unexpected response format');
      }
    } catch (e) {
      log('Error in detectAI: $e');
      rethrow;
    }
  }

  /// Fetch and parse HTML tags from the provided URL.
  static Future<List<dom.Element>> fetchAndParseTags(String url) async {
    try {
      final response = await dio.get(url);

      if (response.statusCode == 200) {
        final document = parser.parse(response.data);

        final hTags = document.getElementsByTagName('h1');
        final pTags = document.getElementsByTagName('p');

        if (hTags.isNotEmpty) {
          return [
            hTags[0],
            ...pTags,
          ];
        } else {
          log('No <h1> tags found');
          return [...pTags];
        }
      } else {
        throw Exception('Failed to fetch HTML content: ${response.statusCode}');
      }
    } catch (e) {
      log('Error in fetchAndParseTags: $e');
      rethrow;
    }
  }
}
