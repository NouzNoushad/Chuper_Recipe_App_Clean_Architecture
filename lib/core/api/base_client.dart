import 'package:chuper_recipe_app/core/api/api_consumer.dart';
import 'package:chuper_recipe_app/core/api/error_handler.dart';
import 'package:http/http.dart';

import 'status_code.dart';

class ApiBaseClient extends ApiConsumer {
  late Client baseClient;
  ApiBaseClient({required this.baseClient});

  Map<String, String> headers = {"Content-Type": "application/json"};

  @override
  Future<String> getRequest(String url) async {
    Uri uri = Uri.parse(url);
    String responseBody = "";
    Response response = await get(uri);
    if (response.statusCode == StatusCode.ok ||
        response.statusCode == StatusCode.created) {
      responseBody = response.body;
    } else {
      ErrorHandler.handleResponse(response);
    }
    return responseBody;
  }
}
