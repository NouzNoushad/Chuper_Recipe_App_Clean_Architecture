import '../../domain/entity/meals_entity.dart';

class MealsModel extends Meals {
  const MealsModel(
      {required String strMeal,
      required String strMealThumb,
      required String idMeal})
      : super(idMeal: idMeal, strMeal: strMeal, strMealThumb: strMealThumb);

  factory MealsModel.fromJson(Map<String, dynamic> json) => MealsModel(
        strMeal: json["strMeal"],
        strMealThumb: json["strMealThumb"],
        idMeal: json["idMeal"],
      );

  Map<String, dynamic> toJson() => {
        "strMeal": strMeal,
        "strMealThumb": strMealThumb,
        "idMeal": idMeal,
      };
}
