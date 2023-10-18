part of 'recipe_details_bloc.dart';

sealed class RecipeDetailsEvent extends Equatable {
  const RecipeDetailsEvent();

  @override
  List<Object> get props => [];
}

class RecipeDetailsLoadedEvent extends RecipeDetailsEvent {
  final String mealId;
  const RecipeDetailsLoadedEvent(this.mealId);

  @override
  List<Object> get props => [mealId];
}
