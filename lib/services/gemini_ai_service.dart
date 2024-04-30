import 'package:open_ai_test/services/dio_calls.dart';
import 'dart:developer' as devtools show log;

class GeminiAIService {
  // Singleton Constructor
  factory GeminiAIService() => _shared;
  static final _shared = GeminiAIService._sharedInstance();
  GeminiAIService._sharedInstance();

  // Function for generating content based on the query passed in the argument
  Future<String> getQueryResult({required String query}) async {
    try {
      final response = await postRequest(
        // Data format according to the documentation of Gemini API
        data: {
          "contents": [
            {
              "role": "user",
              "parts": [
                {"text": query}
              ],
            },
          ]
        },
      );
      // Checking if 'candidates' array exists in response
      if (response.containsKey('candidates') &&
          response['candidates'] is List) {
        final List candidates = response['candidates'];

        // Checking if 'candidates' array is not empty
        if (candidates.isNotEmpty) {
          // Checking if the query is not a sensitive query
          if (candidates[0]['finishReason'] == 'SAFETY') {
            throw Exception('The content is not safe to view!');
          }
          // Checking if the finishReason is "STOP"
          else if (candidates[0]['finishReason'] == 'STOP') {
            final result = candidates[0]['content']['parts'][0]['text'];
            devtools.log(result);
            return result;
          }
          // Throwing error if the finish reason is not "STOP"
          else {
            throw Exception('Error in fetching the result!');
          }
        }
        // Throwing error if the candidates array is empty
        else {
          throw Exception('Error in fetching the result!');
        }
      } else {
        throw Exception('Invalid response format!');
      }
    }
    // Catching all the errors here
    catch (error) {
      devtools.log(error.toString());
      rethrow;
    }
  }
}
