import 'package:chuper_recipe_app/core/api/api_consumer.dart';
import 'package:chuper_recipe_app/core/api/base_client.dart';
import 'package:chuper_recipe_app/data/datasource/remote_recipe_datasource.dart';
import 'package:chuper_recipe_app/data/repository_impl/recipe_repository_impl.dart';
import 'package:chuper_recipe_app/domain/repository/recipe_repository.dart';
import 'package:chuper_recipe_app/domain/usecases/recipe_details_usecase.dart';
import 'package:chuper_recipe_app/domain/usecases/recipe_usecase.dart';
import 'package:chuper_recipe_app/presentation/bloc/recipe_bloc/recipe_bloc.dart';
import 'package:chuper_recipe_app/presentation/bloc/recipe_details/recipe_details_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> initServiceLocator() async {
  // Bloc
  sl.registerFactory<RecipeBloc>(() => RecipeBloc(recipeUseCase: sl()));
  sl.registerFactory<RecipeDetailsBloc>(
      () => RecipeDetailsBloc(recipeDetailsUseCase: sl()));

  // Use cases
  sl.registerLazySingleton<RecipeUseCase>(
      () => RecipeUseCase(recipeRepository: sl()));
  sl.registerLazySingleton<RecipeDetailsUseCase>(
      () => RecipeDetailsUseCase(recipeRepository: sl()));

  // Repository
  sl.registerLazySingleton<RecipeRepository>(
      () => RecipeRepositoryImpl(remoteRecipeDataSource: sl()));

  // Data source
  sl.registerLazySingleton<RemoteRecipeDataSource>(
      () => RemoteRecipeDataSourceImpl(apiConsumer: sl()));

  // Core
  sl.registerLazySingleton<ApiConsumer>(() => ApiBaseClient(baseClient: sl()));

  // External
  sl.registerLazySingleton(() => http.Client());
}
