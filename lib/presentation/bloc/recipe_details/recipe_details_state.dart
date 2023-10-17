part of 'recipe_details_bloc.dart';

sealed class RecipeDetailsState extends Equatable {
  const RecipeDetailsState();
  
  @override
  List<Object> get props => [];
}

final class RecipeDetailsInitial extends RecipeDetailsState {}
