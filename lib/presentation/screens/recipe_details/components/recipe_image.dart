import 'package:chuper_recipe_app/core/utils/extension.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';
import '../../../../data/model/recipe_details/meal_details_model.dart';

class RecipeImage extends StatelessWidget {
  final MealDetailsModel meal;
  const RecipeImage({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: context.height * 0.5,
          width: double.infinity,
          child: meal.strMealThumb != null
              ? Image.network(
                  meal.strMealThumb.toString(),
                  fit: BoxFit.fill,
                )
              : const Center(
                  child: Icon(
                  Icons.image,
                  size: 35,
                  color: Colors.grey,
                )),
        ),
        Positioned(
            top: 0,
            left: 0,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                width: context.width,
                color: Colors.white12,
                alignment: Alignment.centerLeft,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: ColorPicker.whiteColor,
                ),
              ),
            ))
      ],
    );
  }
}
