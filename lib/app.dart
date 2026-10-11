import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_book/pages/Navbar.dart';

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: "Recipe Book",

      theme: ThemeData(
        brightness: Brightness.dark,

        scaffoldBackgroundColor: Colors.black,

        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 180, 57, 11),
          brightness: Brightness.dark,
        ),

        fontFamily: GoogleFonts.lato().fontFamily,
      ),

      // IMPORTANT
      home: const Navbar(),
    );
  }
}