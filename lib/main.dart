import 'package:chuper_recipe_app/app.dart';
import 'package:chuper_recipe_app/service_locator.dart' as di;
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.initServiceLocator();
  runApp(const MyApp());
}
