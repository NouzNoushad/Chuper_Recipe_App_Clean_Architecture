import 'package:chuper_recipe_app/core/errors/failure.dart';
import 'package:chuper_recipe_app/data/model/recipe_details/details_model.dart';
import 'package:dartz/dartz.dart';
import '../../data/model/recipes/recipe_model.dart';

abstract class RecipeRepository {
  Future<Either<Failed, RecipeModel>> getRecipes();
  Future<Either<Failed, DetailsModel>> getRecipeDetails(String mealId);
}
