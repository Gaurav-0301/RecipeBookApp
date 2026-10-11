
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_book/Data/Data.dart';
import 'package:recipe_book/pages/MealsScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  int activeIndex = -1;

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

  Future<void> openMealsScreen(int index) async {
    setState(() {
      activeIndex = index;
    });

    await Future.delayed(const Duration(milliseconds: 100));

    if (!mounted) return;

    setState(() {
      activeIndex = -1;
    });

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MealsScreen(
          title: Categeories[index].title,
          catId: Categeories[index].id,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        title: Text(
          'Recipe Book',
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 24,
            color: Colors.white,
            fontFamily: GoogleFonts.lato().fontFamily,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: AnimatedBuilder(
          animation: _animationController,
          child: GridView(
            gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            children: List.generate(Categeories.length, (index) {
              final bool isActive = activeIndex == index;

              return Padding(
                padding: const EdgeInsets.only(top: 10),
                child: MouseRegion(
                  onEnter: (_) {
                    setState(() {
                      activeIndex = index;
                    });
                  },
                  onExit: (_) {
                    setState(() {
                      activeIndex = -1;
                    });
                  },
                  child: GestureDetector(
                    onTap: () => openMealsScreen(index),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeInOut,
                      transform: Matrix4.identity()
                        ..scale(isActive ? 1.05 : 1.0),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Categeories[index].color.withOpacity(0.55),
                            Categeories[index].color.withOpacity(0.9),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(
                          isActive ? 30 : 26,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(26),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            // IMAGE
                            Image.asset(
                              Categeories[index].image,
                              fit: BoxFit.cover,
                              errorBuilder:
                                  (context, error, stackTrace) {
                                return Container(
                                  color: Categeories[index].color,
                                  child: const Icon(
                                    Icons.restaurant,
                                    size: 50,
                                    color: Colors.white,
                                  ),
                                );
                              },
                            ),

                            // DARK OVERLAY
                            Container(
                              color: Colors.black.withOpacity(0.30),
                            ),

                            // TITLE
                            Positioned(
                              left: 15,
                              right: 15,
                              bottom: 15,
                              child: Text(
                                Categeories[index].title,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
          builder: (context, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 0.3),
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
      ),
    );
  }
}
