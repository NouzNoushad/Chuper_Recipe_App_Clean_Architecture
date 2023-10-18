import 'package:chuper_recipe_app/config/routes/route_constant.dart';
import 'package:chuper_recipe_app/config/routes/routes.dart';
import 'package:chuper_recipe_app/domain/usecases/recipe_details_usecase.dart';
import 'package:chuper_recipe_app/domain/usecases/recipe_usecase.dart';
import 'package:chuper_recipe_app/presentation/bloc/recipe_bloc/recipe_bloc.dart';
import 'package:chuper_recipe_app/presentation/bloc/recipe_details/recipe_details_bloc.dart';
import 'package:chuper_recipe_app/service_locator.dart' as di;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/theme/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              RecipeBloc(recipeUseCase: di.sl<RecipeUseCase>()),
        ),
        BlocProvider(
          create: (context) => RecipeDetailsBloc(
              recipeDetailsUseCase: di.sl<RecipeDetailsUseCase>()),
        ),
      ],
      child: MaterialApp(
        theme: appTheme(),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: Routes.onGenerateRoute,
        initialRoute: RouteConstant.home,
      ),
    );
  }
}
