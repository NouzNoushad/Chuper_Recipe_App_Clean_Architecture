import 'package:chuper_recipe_app/core/utils/colors.dart';
import 'package:chuper_recipe_app/presentation/bloc/recipe_details/recipe_details_bloc.dart';
import 'package:chuper_recipe_app/presentation/screens/recipe_details/components/recipe_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecipeDetailsScreen extends StatefulWidget {
  final String mealId;
  const RecipeDetailsScreen({super.key, required this.mealId});

  @override
  State<RecipeDetailsScreen> createState() => _RecipeDetailsScreenState();
}

class _RecipeDetailsScreenState extends State<RecipeDetailsScreen> {
  @override
  void initState() {
    context
        .read<RecipeDetailsBloc>()
        .add(RecipeDetailsLoadedEvent(widget.mealId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPicker.backgroundColor,
      body: SafeArea(
        child: BlocBuilder<RecipeDetailsBloc, RecipeDetailsState>(
          builder: (context, state) {
            if (state is RecipeDetailsLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: ColorPicker.seedColor,
                ),
              );
            }
            if (state is RecipeDetailsLoadedState) {
              var meal = state.details.mealDetails![0];
              return ListView(children: [
                RecipeImage(meal: meal),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            meal.strMeal ?? '',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.link)),
                              const SizedBox(
                                width: 20,
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.videocam,
                                    color: ColorPicker.likeColor,
                                  )),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        meal.strInstructions ?? '',
                        style: const TextStyle(
                          height: 2,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                )
              ]);
            }
            return Container();
          },
        ),
      ),
    );
  }
}
