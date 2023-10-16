import 'package:chuper_recipe_app/core/api/api_consumer.dart';
import 'package:chuper_recipe_app/core/api/error_handler.dart';
import 'package:http/http.dart';

import 'status_code.dart';

class BaseClient extends ApiConsumer {
  Client baseClient = Client();
  Map<String, String> headers = {"Content-Type": "application/json"};

  @override
  Future<String?> getRequest(String url) async {
    Uri uri = Uri.parse(url);
      Response response = await get(uri);
      if (response.statusCode == StatusCode.ok ||
          response.statusCode == StatusCode.created) {
        return response.body;
      } else {
        ErrorHandler.handleResponse(response);
      }
      return null;
  }
}