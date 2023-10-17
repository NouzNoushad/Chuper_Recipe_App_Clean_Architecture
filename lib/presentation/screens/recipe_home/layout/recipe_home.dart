import 'package:chuper_recipe_app/core/utils/extension.dart';
import 'package:chuper_recipe_app/presentation/bloc/recipe_bloc/recipe_bloc.dart';
import 'package:chuper_recipe_app/presentation/screens/recipe_home/components/recipe_app_bar.dart';
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
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    height: context.height * 0.35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          width: 3, color: ColorPicker.likeBackground),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 4,
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                                child: Image.network(
                                  meal!.strMealThumb.toString(),
                                  width: double.infinity,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              const Positioned(
                                top: 10,
                                right: 10,
                                child: CircleAvatar(
                                  backgroundColor: ColorPicker.likeBackground,
                                  child: Icon(
                                    Icons.favorite_outline,
                                    color: ColorPicker.whiteColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            decoration: const BoxDecoration(
                                color: ColorPicker.whiteColor,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                )),
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Text(
                              meal.strMeal.toString() ?? "",
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  overflow: TextOverflow.ellipsis),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
