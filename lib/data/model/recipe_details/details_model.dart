import 'package:chuper_recipe_app/domain/entity/recipe_details/details_entity.dart';

import 'meal_details_model.dart';

class DetailsModel extends DetailsEntity{
  const DetailsModel({required List<MealDetailsModel>? mealDetails}) : super(mealDetails: mealDetails);

  factory DetailsModel.fromJson(Map<String, dynamic> json) => DetailsModel(
        mealDetails: List<MealDetailsModel>.from(json["meals"].map((x) => MealDetailsModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "meals": mealDetails != null ? List<dynamic>.from(mealDetails!.map((x) => x.toJson())) : [],
      };
}