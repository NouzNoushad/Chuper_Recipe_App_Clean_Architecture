import 'package:chuper_recipe_app/config/routes/route_constant.dart';
import 'package:chuper_recipe_app/presentation/screens/recipe_details/layout/details_screen.dart';
import 'package:chuper_recipe_app/presentation/screens/recipe_home/layout/recipe_home.dart';
import 'package:flutter/material.dart';

import '../../core/utils/colors.dart';

class Routes {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstant.home:
        return MaterialPageRoute(
            settings: const RouteSettings(name: RouteConstant.home),
            builder: (context) => const RecipeHomeScreen());
      case RouteConstant.details:
        return MaterialPageRoute(
            settings: const RouteSettings(name: RouteConstant.details),
            builder: (context) => RecipeDetailsScreen(
              mealId: settings.arguments as String,
            ));
      default:
        return MaterialPageRoute(
            builder: (context) => const Scaffold(
                  backgroundColor: ColorPicker.backgroundColor,
                  body: Center(child: Text('No Page Found')),
                ));
    }
  }
}
