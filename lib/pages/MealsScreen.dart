
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_book/Data/MealsData.dart';
import 'package:recipe_book/Models/MealsModel.dart';
import 'package:recipe_book/pages/MealsDetails.dart';

class MealsScreen extends StatefulWidget {
  final String title;
  final String catId;

  const MealsScreen({required this.title, required this.catId, super.key});

  @override
  State<MealsScreen> createState() => _MealsScreenState();
}

class _MealsScreenState extends State<MealsScreen>
    with SingleTickerProviderStateMixin {
      
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<MealsModel> filteredMeals = meals.where((meal) {
      return meal.categories.contains(widget.catId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        title: Text(
          widget.title,
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 24,
            color: Colors.white,
            fontFamily: GoogleFonts.lato().fontFamily,
          ),
        ),
      ),

      body: AnimatedBuilder(
        animation: _animationController,
        child: ListView.builder(
          itemCount: filteredMeals.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        Mealsdetails(meal: filteredMeals[index]),
                  ),
                );
              },
              child: Card(
                clipBehavior: Clip.hardEdge,
                elevation: 4,
                child: Stack(
                  children: [
                    Hero(
                      tag: filteredMeals[index].id,
                      child: Image.asset(
                        filteredMeals[index].imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 6,
                        ),
                        color: Colors.black54,
                        child: Column(
                          children: [
                            Text(
                              filteredMeals[index].title,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w300,
                                color: Colors.white,
                              ),
                            ),

                            const SizedBox(height: 8),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                // Affordability
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.currency_rupee,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                    const SizedBox(width: 3),
                                    Text(
                                      filteredMeals[index].affordability.name,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),

                                // Complexity
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.speed,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                    const SizedBox(width: 3),
                                    Text(
                                      filteredMeals[index].complexity.name,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),

                                // Duration
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.timer,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                    const SizedBox(width: 3),
                                    Text(
                                      "${filteredMeals[index].duration} min",
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        builder: (context, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(-0.4, 0),
              end: Offset.zero,
            ).animate(
              CurvedAnimation(
                parent: _animationController,
                curve: Curves.easeInOut,
              ),
            ),
            child: child,
          );
        },
      ),
    );
  }
}
