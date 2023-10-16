import 'package:chuper_recipe_app/data/model/meals_model.dart';
import 'package:equatable/equatable.dart';

class RecipeEntity extends Equatable {
  final List<MealsModel>? meals;

  const RecipeEntity({required this.meals});

  @override
  List<Object?> get props => [meals];
}
