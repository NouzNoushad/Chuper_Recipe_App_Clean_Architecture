part of 'recipe_bloc.dart';

sealed class RecipeState extends Equatable {
  const RecipeState();

  @override
  List<Object> get props => [];
}

final class RecipeInitial extends RecipeState {}

final class RecipeLoadingState extends RecipeState {}

class RecipeLoadedState extends RecipeState {
  final RecipeModel recipeModel;
  const RecipeLoadedState(this.recipeModel);

  @override
  List<Object> get props => [recipeModel];
}

class RecipeErrorState extends RecipeState {
  final String error;
  const RecipeErrorState(this.error);

  @override
  List<Object> get props => [error];
}
