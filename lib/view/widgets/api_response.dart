import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/model/api_response_model.dart';
import 'package:news_app/view/widgets/api_result.dart';
import 'package:news_app/view/widgets/app_api.dart';

abstract class ApiResponse {
  static Future<ApiResult<ApiResponseModel>> apiResponse() async {
    var url = Uri.https(AppApi.baseUrl, AppApi.endpoint, {
      'apiKey': AppApi.apiKey,
      'q': AppApi.q,
    });
      
    try {
      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return ApiSuccess<ApiResponseModel>(ApiResponseModel.fromJson(json));
    } catch (e) {
      return ApiError<ApiResponseModel>(e.toString());
    }
  }
}
