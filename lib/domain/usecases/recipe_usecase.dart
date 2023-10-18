import 'package:chuper_recipe_app/core/errors/failure.dart';
import 'package:chuper_recipe_app/data/model/recipes/recipe_model.dart';
import 'package:chuper_recipe_app/domain/repository/recipe_repository.dart';
import 'package:dartz/dartz.dart';

class RecipeUseCase {
  final RecipeRepository recipeRepository;
  RecipeUseCase({
    required this.recipeRepository,
  });

  Future<Either<Failed, RecipeModel>> call() => recipeRepository.getRecipes();
}
