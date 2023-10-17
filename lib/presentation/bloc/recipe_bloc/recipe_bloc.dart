import 'package:bloc/bloc.dart';
import 'package:chuper_recipe_app/core/errors/failure.dart';
import 'package:chuper_recipe_app/core/usecases/usecase.dart';
import 'package:chuper_recipe_app/data/model/recipes/recipe_model.dart';
import 'package:chuper_recipe_app/domain/usecases/recipe_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../core/utils/strings.dart';

part 'recipe_event.dart';
part 'recipe_state.dart';

class RecipeBloc extends Bloc<RecipeEvent, RecipeState> {
  final RecipeUseCase recipeUseCase;
  RecipeBloc({
    required this.recipeUseCase,
  }) : super(RecipeInitial()) {
    on<RecipeLoadedEvent>(getRecipes());
  }

  EventHandler<RecipeLoadedEvent, RecipeState> getRecipes() =>
      (event, emit) async {
        emit(RecipeLoadingState());
        try {
          Either<Failed, RecipeModel> recipeModel =
              await recipeUseCase(NoParams());
          emit(recipeModel.fold(
              (failure) => RecipeErrorState(failureToMsg(failure)),
              (recipes) => RecipeLoadedState(recipes)));
        } catch (error) {
          emit(RecipeErrorState(error.toString()));
        }
      };

  String failureToMsg(Failed failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return AppString.serverFailure;
      default:
        return AppString.unexpectedError;
    }
  }
}
