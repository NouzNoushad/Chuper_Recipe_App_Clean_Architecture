import 'package:chuper_recipe_app/presentation/bloc/recipe_bloc/recipe_bloc.dart';
import 'package:chuper_recipe_app/presentation/screens/recipe_home/components/recipe_app_bar.dart';
import 'package:chuper_recipe_app/presentation/screens/recipe_home/components/recipe_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/colors.dart';

class RecipeHomeScreen extends StatefulWidget {
  const RecipeHomeScreen({super.key});

  @override
  State<RecipeHomeScreen> createState() => _RecipeHomeScreenState();
}

class _RecipeHomeScreenState extends State<RecipeHomeScreen> {
  @override
  void initState() {
    context.read<RecipeBloc>().add(const RecipeLoadedEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPicker.backgroundColor,
      appBar: recipeAppBar(),
      body: BlocBuilder<RecipeBloc, RecipeState>(
        builder: (context, state) {
          if (state is RecipeLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is RecipeLoadedState) {
            return ListView.builder(
              itemCount: state.recipeModel.meals?.length,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              itemBuilder: (context, index) {
                final meal = state.recipeModel.meals?[index];
                return RecipeCard(meal: meal);
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
