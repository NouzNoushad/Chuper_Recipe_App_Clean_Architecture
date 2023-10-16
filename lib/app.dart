import 'package:chuper_recipe_app/config/routes/route_constant.dart';
import 'package:chuper_recipe_app/config/routes/routes.dart';
import 'package:chuper_recipe_app/utils/colors.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: ColorPicker.seedColor),
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Routes.onGenerateRoute,
      initialRoute: RouteConstant.home,
    );
  }
}
