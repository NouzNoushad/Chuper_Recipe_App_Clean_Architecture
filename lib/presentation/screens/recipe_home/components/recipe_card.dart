import 'package:chuper_recipe_app/config/routes/route_constant.dart';
import 'package:chuper_recipe_app/core/utils/extension.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';
import '../../../../data/model/recipes/meals_model.dart';

class RecipeCard extends StatefulWidget {
  final MealsModel? meal;
  const RecipeCard({super.key, required this.meal});

  @override
  State<RecipeCard> createState() => _RecipeCardState();
}

class _RecipeCardState extends State<RecipeCard> {
  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    return widget.meal != null
        ? Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(RouteConstant.details,
                    arguments: widget.meal!.idMeal);
              },
              child: Container(
                height: context.height * 0.35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border:
                      Border.all(width: 3, color: ColorPicker.likeBackground),
                ),
                child: Column(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Stack(
                        children: [
                          widget.meal!.strMealThumb != null
                              ? ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                  child: Image.network(
                                    widget.meal!.strMealThumb.toString(),
                                    width: double.infinity,
                                    fit: BoxFit.fill,
                                  ),
                                )
                              : const Center(child: Icon(Icons.image)),
                          Positioned(
                            top: 10,
                            right: 10,
                            child: GestureDetector(
                              onTap: () {
                                isLiked = !isLiked;
                                setState(() {});
                              },
                              child: CircleAvatar(
                                backgroundColor: ColorPicker.likeBackground,
                                child: isLiked
                                    ? const Icon(
                                        Icons.favorite,
                                        color: ColorPicker.likeColor,
                                      )
                                    : const Icon(
                                        Icons.favorite_outline,
                                        color: ColorPicker.likeColor,
                                      ),
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
                          widget.meal!.strMeal ?? "",
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
            ),
          )
        : const Center(
            child: Text('No Meals Found'),
          );
  }
}
