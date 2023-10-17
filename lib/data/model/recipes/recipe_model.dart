import 'package:chuper_recipe_app/domain/entity/recipes/recipe_entity.dart';
import 'meals_model.dart';

class RecipeModel extends RecipeEntity {
  const RecipeModel({required List<MealsModel>? meals}) : super(meals: meals);

  factory RecipeModel.fromJson(Map<String, dynamic> json) => RecipeModel(
        meals: List<MealsModel>.from(json["meals"].map((x) => MealsModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "meals": meals != null ? List<dynamic>.from(meals!.map((x) => x.toJson())) : [],
      };
}


