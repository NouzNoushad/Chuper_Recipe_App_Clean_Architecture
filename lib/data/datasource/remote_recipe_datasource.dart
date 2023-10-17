import 'dart:convert';

import 'package:chuper_recipe_app/core/api/api_consumer.dart';
import 'package:chuper_recipe_app/core/api/end_points.dart';
import 'package:chuper_recipe_app/data/model/recipes/recipe_model.dart';
import 'package:flutter/material.dart';

import '../model/recipe_details/details_model.dart';

abstract class RemoteRecipeDataSource {
  Future<RecipeModel> getRecipeDataSource(String country);
  Future<DetailsModel> getRecipeDetailsDataSource(String mealId);
}

class RemoteRecipeDataSourceImpl implements RemoteRecipeDataSource {
  late ApiConsumer apiConsumer;

  RemoteRecipeDataSourceImpl({required this.apiConsumer});

  @override
  Future<RecipeModel> getRecipeDataSource(String country) async {
    final response =
        await apiConsumer.getRequest("$baseUrl/${Endpoints.filter}=$country");
    debugPrint('////////////// response: $response');

    return RecipeModel.fromJson(json.decode(response));
  }

  @override
  Future<DetailsModel> getRecipeDetailsDataSource(String mealId) async {
    final response =
        await apiConsumer.getRequest("$baseUrl/${Endpoints.details}=$mealId");
    debugPrint('////////////// details response: $response');

    return DetailsModel.fromJson(json.decode(response));
  }
}
