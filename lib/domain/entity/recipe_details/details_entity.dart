import 'package:chuper_recipe_app/data/model/recipe_details/meal_details_model.dart';
import 'package:equatable/equatable.dart';

class DetailsEntity extends Equatable {
  final List<MealDetailsModel>? mealDetails;

  const DetailsEntity({this.mealDetails});

  @override
  List<Object?> get props => [mealDetails];
}
