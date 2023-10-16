import 'package:chuper_recipe_app/config/routes/route_constant.dart';
import 'package:chuper_recipe_app/presentation/screens/recipe_home/layout/recipe_home.dart';
import 'package:chuper_recipe_app/utils/colors.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstant.home:
        return MaterialPageRoute(
            settings: const RouteSettings(name: RouteConstant.home),
            builder: (context) => const RecipeHomeScreen());
      default:
        return MaterialPageRoute(
            builder: (context) => const Scaffold(
                  backgroundColor: ColorPicker.backgroundColor,
                  body: Center(child: Text('No Page Found')),
                ));
    }
  }
}
