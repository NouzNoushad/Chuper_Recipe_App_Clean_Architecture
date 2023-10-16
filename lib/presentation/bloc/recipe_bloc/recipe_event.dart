part of 'recipe_bloc.dart';

sealed class RecipeEvent extends Equatable {
  const RecipeEvent();

  @override
  List<Object> get props => [];
}

class RecipeLoadedEvent extends RecipeEvent {
  const RecipeLoadedEvent();

  @override
  List<Object> get props => [];
}
