import 'dart:convert';

import 'package:chuper_recipe_app/core/api/api_consumer.dart';
import 'package:chuper_recipe_app/core/api/end_points.dart';
import 'package:chuper_recipe_app/data/model/recipe_model.dart';
import 'package:flutter/material.dart';

abstract class RemoteRecipeDataSource {
  getRecipeDataSource(String country);
}

class RemoteRecipeDataSourceImpl implements RemoteRecipeDataSource {
  late ApiConsumer apiConsumer;

  @override
  Future<RecipeModel?> getRecipeDataSource(String country) async {
    var response =
        await apiConsumer.getRequest("$baseUrl/${Endpoints.filter}=$country");
    debugPrint('////////////// response: $response');
    if (response != null) {
      return RecipeModel.fromJson(json.decode(response));
    }
    return null;
  }
}
