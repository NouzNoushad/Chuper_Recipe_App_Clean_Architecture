import 'dart:io';

import 'package:chuper_recipe_app/core/errors/failure.dart';
import 'package:chuper_recipe_app/data/datasource/remote_recipe_datasource.dart';
import 'package:chuper_recipe_app/data/model/recipe_model.dart';
import 'package:chuper_recipe_app/domain/repository/recipe_repository.dart';
import 'package:dartz/dartz.dart';

class RecipeRepositoryImpl extends RecipeRepository {
  final RemoteRecipeDataSource remoteRecipeDataSource;

  RecipeRepositoryImpl({required this.remoteRecipeDataSource});

  @override
  Future<Either<Failure, RecipeModel>> getRecipes() async {
    try {
      final recipeData =
          await remoteRecipeDataSource.getRecipeDataSource("Indian");
      return Right(recipeData);
    } on SocketException {
      return Left(ServerFailure());
    }
  }
}
