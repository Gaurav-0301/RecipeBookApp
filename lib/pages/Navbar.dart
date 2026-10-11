import 'package:flutter/material.dart';
import 'package:recipe_book/pages/Favorite.dart';
import 'package:recipe_book/pages/HomeScreen.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  final List<Widget> _screens = [
    HomeScreen(),
    Favorite(),
  ];

  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_index],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,

        onTap: (index) {
          setState(() {
            _index = index;
          });
        },

        backgroundColor:
            Theme.of(context).scaffoldBackgroundColor,

        selectedItemColor: Colors.white,

        unselectedItemColor:  Color.fromARGB(255, 107, 107, 107),

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category_rounded),
            label: "Categories",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border_rounded),
            label: "Favorite",
          ),
        ],
      ),
    );
  }
}