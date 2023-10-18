import 'package:bloc/bloc.dart';
import 'package:chuper_recipe_app/core/errors/failure.dart';
import 'package:chuper_recipe_app/domain/usecases/recipe_details_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../data/model/recipe_details/details_model.dart';

part 'recipe_details_event.dart';
part 'recipe_details_state.dart';

class RecipeDetailsBloc extends Bloc<RecipeDetailsEvent, RecipeDetailsState> {
  final RecipeDetailsUseCase recipeDetailsUseCase;
  RecipeDetailsBloc({required this.recipeDetailsUseCase})
      : super(RecipeDetailsInitial()) {
    on<RecipeDetailsLoadedEvent>(getRecipeDetails());
  }

  EventHandler<RecipeDetailsLoadedEvent, RecipeDetailsState>
      getRecipeDetails() => (event, emit) async {
            emit(RecipeDetailsLoading());
            try {
              Either<Failed, DetailsModel> recipeDetails =
                  await recipeDetailsUseCase.call(event.mealId);
              emit(recipeDetails.fold(
                  (failure) => RecipeDetailsErrorState(failureToMsg(failure)),
                  (details) => RecipeDetailsLoadedState(details)));
            } catch (error) {
              emit(RecipeDetailsErrorState(error.toString()));
            }
          };
}
