import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_book/Models/MealsModel.dart';
import 'package:recipe_book/pages/FavoriteMealProvider.dart';
import 'package:recipe_book/pages/Mealsdetails.dart';

class Favorite extends ConsumerStatefulWidget {
  const Favorite({super.key});

  @override
  ConsumerState<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends ConsumerState<Favorite>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final List<MealsModel> favoriteMeal = ref.watch(favoriteMealProvider);

    return Scaffold(
      backgroundColor: Colors.black,

      // ================= APP BAR =================
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        title: Row(
          children: [
            const SizedBox(width: 8),
            Text(
              "My Favorites",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 24,
                color: Colors.white,
                fontFamily: GoogleFonts.lato().fontFamily,
              ),
            ),
          ],
        ),
      ),

      // ================= BODY =================
      body: favoriteMeal.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.favorite_border, color: Colors.white24, size: 80),
                  SizedBox(height: 15),
                  Text(
                    "No Favorites Yet",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Add your favorite recipes here",
                    style: TextStyle(color: Colors.white54, fontSize: 15),
                  ),
                ],
              ),
            )
          // ================= FAVORITE LIST =================
          : AnimatedBuilder(
              animation: _animationController,
              child: ListView.builder(
                padding: const EdgeInsets.all(12),
                itemCount: favoriteMeal.length,
                itemBuilder: (context, index) {
                  final meal = favoriteMeal[index];

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(18),

                      // ================= OPEN DETAILS =================
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Mealsdetails(meal: meal),
                          ),
                        );
                      },

                      child: Card(
                        color: Colors.white10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              // ================= IMAGE =================
                              ClipRRect(
                                borderRadius: BorderRadius.circular(14),
                                child: Image.asset(
                                  meal.imageUrl,
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),

                              const SizedBox(width: 12),

                              // ================= DETAILS =================
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      meal.title,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 19,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),

                                    const SizedBox(height: 10),

                                    // Duration
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.timer,
                                          color: Colors.orange,
                                          size: 18,
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          "${meal.duration} min",
                                          style: const TextStyle(
                                            color: Colors.white70,
                                          ),
                                        ),
                                      ],
                                    ),

                                    const SizedBox(height: 5),

                                    // Complexity
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.speed,
                                          color: Colors.orange,
                                          size: 18,
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          meal.complexity.name,
                                          style: const TextStyle(
                                            color: Colors.white70,
                                          ),
                                        ),
                                      ],
                                    ),

                                    const SizedBox(height: 5),

                                    // Affordability
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.currency_rupee,
                                          color: Colors.orange,
                                          size: 18,
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          meal.affordability.name,
                                          style: const TextStyle(
                                            color: Colors.white70,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),

                              // ================= FAVORITE ICON =================
                              IconButton(
                                onPressed: () {
                                  final bool wasAdded = ref
                                      .read(favoriteMealProvider.notifier)
                                      .toggleFavMealStatus(meal);

                                  ScaffoldMessenger.of(context)
                                      .hideCurrentSnackBar();

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        wasAdded
                                            ? "Added to favorite list"
                                            : "Removed from favorite list",
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      backgroundColor: wasAdded
                                          ? Colors.green
                                          : Colors.red,
                                      duration: const Duration(seconds: 2),
                                    ),
                                  );
                                },
                                icon: const Icon(
                                  Icons.favorite,
                                  color: Color.fromARGB(255, 132, 227, 8),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),

              builder: (context, child) {
                return SlideTransition(
                  position: Tween(begin: Offset(0, -0.2), end: Offset(0, 0))
                      .animate(
                        CurvedAnimation(
                          parent: _animationController,
                          curve: Curves.easeIn,
                        ),
                      ),
                      child: child,
                );
              },
            ),
    );
  }
}
