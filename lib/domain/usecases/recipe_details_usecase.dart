import 'package:chuper_recipe_app/core/errors/failure.dart';
import 'package:chuper_recipe_app/core/usecases/usecase.dart';
import 'package:chuper_recipe_app/data/model/recipe_details/details_model.dart';
import 'package:chuper_recipe_app/domain/repository/recipe_repository.dart';
import 'package:dartz/dartz.dart';

class RecipeDetailsUseCase extends UseCase<DetailsModel, NoParams> {
  final RecipeRepository recipeRepository;
  final String mealId;
  RecipeDetailsUseCase({required this.recipeRepository, required this.mealId});

  @override
  Future<Either<Failed, DetailsModel>> call(NoParams params) {
    return recipeRepository.getRecipeDetails(mealId);
  }
}
