part of 'recipe_details_bloc.dart';

sealed class RecipeDetailsState extends Equatable {
  const RecipeDetailsState();

  @override
  List<Object> get props => [];
}

final class RecipeDetailsInitial extends RecipeDetailsState {}

final class RecipeDetailsLoading extends RecipeDetailsState {}

class RecipeDetailsLoadedState extends RecipeDetailsState {
  final DetailsModel details;
  const RecipeDetailsLoadedState(this.details);

  @override
  List<Object> get props => [details];
}

class RecipeDetailsErrorState extends RecipeDetailsState {
  final String error;
  const RecipeDetailsErrorState(this.error);

  @override
  List<Object> get props => [error];
}
