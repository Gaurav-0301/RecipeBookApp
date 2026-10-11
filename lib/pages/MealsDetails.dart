
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_book/Models/MealsModel.dart';
import 'package:recipe_book/pages/FavoriteMealProvider.dart';

class Mealsdetails extends ConsumerStatefulWidget {
  final MealsModel meal;

  const Mealsdetails({required this.meal, super.key});

  @override
  ConsumerState<Mealsdetails> createState() => _MealsdetailsState();
}

class _MealsdetailsState extends ConsumerState<Mealsdetails> {
  double imageOpacity = 0.3;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          imageOpacity = 1.0;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final MealsModel meal = widget.meal;

    final List<MealsModel> favoriteMeal =
        ref.watch(favoriteMealProvider);

    final bool isFav = favoriteMeal.contains(meal);

    return Scaffold(
      backgroundColor: Colors.black,

      // ================= APP BAR =================
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        title: Text(
          meal.title,
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 24,
            color: Colors.white,
            fontFamily: GoogleFonts.lato().fontFamily,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              ref
                  .read(favoriteMealProvider.notifier)
                  .toggleFavMealStatus(meal);
            },
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 100),
              transitionBuilder: (child, animation) {
                return RotationTransition(
                  turns: Tween<double>(
                    begin: 0.5,
                    end: 1.0,
                  ).animate(animation),
                  child: child,
                );
              },
              child: Icon(
                isFav
                    ? Icons.favorite
                    : Icons.favorite_border_outlined,
                color: isFav ? Colors.pink : Colors.white,
                key: ValueKey(isFav),
              ),
            ),
          ),
        ],
      ),

      // ================= BODY =================
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ================= IMAGE WITH FADE ANIMATION =================
            AnimatedOpacity(
              opacity: imageOpacity,
              duration: const Duration(milliseconds: 800),
              curve: Curves.easeIn,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Hero(
                  tag: meal.id,
                  child: Image.asset(
                    meal.imageUrl,
                    width: double.infinity,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // ================= TITLE =================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                meal.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),

            const SizedBox(height: 15),

            // ================= INFORMATION =================
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _infoItem(Icons.timer, "${meal.duration} min"),
                _infoItem(
                  Icons.currency_rupee,
                  meal.affordability.name,
                ),
                _infoItem(Icons.speed, meal.complexity.name),
              ],
            ),

            const SizedBox(height: 25),

            // ================= DIETARY INFO =================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  if (meal.isVegetarian)
                    _tag(Icons.eco, "Vegetarian"),
                  if (meal.isVegan)
                    _tag(Icons.spa, "Vegan"),
                  if (meal.isGlutenFree)
                    _tag(Icons.no_food, "Gluten Free"),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // ================= INGREDIENTS =================
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Ingredients",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),

            const SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: meal.ingredients.map((ingredient) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.circle,
                          size: 8,
                          color: Colors.orange,
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            ingredient,
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),

            const SizedBox(height: 30),

            // ================= STEPS =================
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "How to Prepare",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),

            const SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: List.generate(meal.steps.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.orange,
                          child: Text(
                            "${index + 1}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            meal.steps[index],
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 17,
                              height: 1.4,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // ================= INFO ITEM =================
  Widget _infoItem(IconData icon, String text) {
    return Column(
      children: [
        Icon(icon, color: Colors.orange, size: 25),
        const SizedBox(height: 5),
        Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
        ),
      ],
    );
  }

  // ================= TAG =================
  Widget _tag(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.greenAccent, size: 18),
          const SizedBox(width: 5),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
