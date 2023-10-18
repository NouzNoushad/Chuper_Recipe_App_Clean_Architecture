import 'package:chuper_recipe_app/core/errors/failure.dart';
import 'package:chuper_recipe_app/data/model/recipe_details/details_model.dart';
import 'package:chuper_recipe_app/domain/repository/recipe_repository.dart';
import 'package:dartz/dartz.dart';

class RecipeDetailsUseCase {
  final RecipeRepository recipeRepository;
  RecipeDetailsUseCase({required this.recipeRepository});

  Future<Either<Failed, DetailsModel>> call(String mealId) =>
      recipeRepository.getRecipeDetails(mealId);
}
