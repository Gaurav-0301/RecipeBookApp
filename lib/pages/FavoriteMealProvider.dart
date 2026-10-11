import 'package:flutter_riverpod/legacy.dart';
import 'package:recipe_book/Models/MealsModel.dart';

class FavoriteMealNotifier extends StateNotifier<List<MealsModel>> {
  FavoriteMealNotifier() : super([]);

  bool toggleFavMealStatus(MealsModel meal) {
    bool isFavMeal = state.contains(meal);

    if (isFavMeal) {
      state=state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favoriteMealProvider =
    StateNotifierProvider<FavoriteMealNotifier, List<MealsModel>>((ref) {
      return FavoriteMealNotifier();
    });
