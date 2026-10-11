
import 'package:recipe_book/Models/MealsModel.dart';

List<MealsModel> meals = [

  // =========================
  // SOUTH INDIAN - CATEGORY 1
  // =========================

  MealsModel(
    id: 'm1',
    categories: ['1'],
    title: 'Masala Dosa',
    imageUrl:
        'assets/MasalaDosa.jpg',
    ingredients: [
      'Rice',
      'Urad Dal',
      'Potatoes',
      'Onion',
      'Green Chilli',
      'Mustard Seeds',
      'Curry Leaves',
      'Salt',
    ],
    steps: [
      'Prepare and ferment the dosa batter.',
      'Cook potatoes with onion and spices.',
      'Heat a tawa and spread the dosa batter.',
      'Add potato masala in the center.',
      'Fold and serve with sambar and chutney.',
    ],
    duration: 45,
    complexity: Complexity.simple,
    affordability: Affordability.affordable,
    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
  ),

  MealsModel(
    id: 'm2',
    categories: ['1'],
    title: 'Idli Sambar',
    imageUrl:
        'assets/idli.jpg_compressed',
    ingredients: [
      'Idli Rice',
      'Urad Dal',
      'Toor Dal',
      'Tomato',
      'Carrot',
      'Drumstick',
      'Tamarind',
      'Sambar Masala',
    ],
    steps: [
      'Prepare and ferment the idli batter.',
      'Steam the idlis until soft.',
      'Cook dal and vegetables for sambar.',
      'Add tamarind and sambar masala.',
      'Serve hot idlis with sambar and chutney.',
    ],
    duration: 40,
    complexity: Complexity.simple,
    affordability: Affordability.affordable,
    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
  ),

  MealsModel(
    id: 'm3',
    categories: ['1'],
    title: 'Medu Vada',
    imageUrl:
        'assets/meduwada.jpeg',
    ingredients: [
      'Urad Dal',
      'Green Chilli',
      'Ginger',
      'Curry Leaves',
      'Black Pepper',
      'Salt',
      'Oil',
    ],
    steps: [
      'Soak urad dal and grind into a thick batter.',
      'Add spices, chilli, ginger and curry leaves.',
      'Shape the batter into round vadas.',
      'Deep fry until golden brown.',
      'Serve with sambar and coconut chutney.',
    ],
    duration: 35,
    complexity: Complexity.simple,
    affordability: Affordability.affordable,
    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
  ),

  // =========================
  // NORTH INDIAN - CATEGORY 2
  // =========================

  MealsModel(
    id: 'm4',
    categories: ['2'],
    title: 'Chole Bhature',
    imageUrl:
        'assets/chole.jpeg',
    ingredients: [
      'Chickpeas',
      'Flour',
      'Onion',
      'Tomato',
      'Ginger',
      'Garlic',
      'Chole Masala',
      'Oil',
    ],
    steps: [
      'Soak and boil chickpeas.',
      'Prepare spicy onion and tomato gravy.',
      'Add chickpeas and chole masala.',
      'Prepare bhatura dough.',
      'Roll and deep fry bhatura.',
    ],
    duration: 50,
    complexity: Complexity.challenging,
    affordability: Affordability.affordable,
    isGlutenFree: false,
    isVegan: true,
    isVegetarian: true,
  ),

  MealsModel(
    id: 'm5',
    categories: ['2'],
    title: 'Rajma Chawal',
    imageUrl:
        'assets/RajmaChawal.jpeg',
    ingredients: [
      'Rajma',
      'Rice',
      'Onion',
      'Tomato',
      'Ginger',
      'Garlic',
      'Garam Masala',
      'Coriander',
    ],
    steps: [
      'Soak rajma overnight.',
      'Pressure cook rajma until soft.',
      'Prepare onion and tomato gravy.',
      'Add rajma and spices.',
      'Serve hot with steamed rice.',
    ],
    duration: 50,
    complexity: Complexity.simple,
    affordability: Affordability.affordable,
    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
  ),

  MealsModel(
    id: 'm6',
    categories: ['2'],
    title: 'Aloo Paratha',
    imageUrl:
        'assets/AlooParatha.jpeg',
    ingredients: [
      'Wheat Flour',
      'Potatoes',
      'Green Chilli',
      'Coriander',
      'Cumin',
      'Red Chilli Powder',
      'Salt',
      'Oil',
    ],
    steps: [
      'Prepare wheat flour dough.',
      'Boil and mash potatoes.',
      'Mix potatoes with spices and coriander.',
      'Stuff the filling inside dough.',
      'Roll and cook on a hot tawa.',
    ],
    duration: 35,
    complexity: Complexity.simple,
    affordability: Affordability.affordable,
    isGlutenFree: false,
    isVegan: true,
    isVegetarian: true,
  ),

  // =========================
  // CHINESE - CATEGORY 3
  // =========================

  MealsModel(
    id: 'm7',
    categories: ['3'],
    title: 'Veg Hakka Noodles',
    imageUrl:
        'assets/hakkanoodles.jpeg',
    ingredients: [
      'Hakka Noodles',
      'Carrot',
      'Capsicum',
      'Cabbage',
      'Spring Onion',
      'Soy Sauce',
      'Chilli Sauce',
      'Garlic',
    ],
    steps: [
      'Boil noodles and drain them.',
      'Heat oil in a wok.',
      'Stir fry garlic and vegetables.',
      'Add sauces and cooked noodles.',
      'Toss everything on high heat.',
    ],
    duration: 25,
    complexity: Complexity.simple,
    affordability: Affordability.affordable,
    isGlutenFree: false,
    isVegan: true,
    isVegetarian: true,
  ),

  MealsModel(
    id: 'm8',
    categories: ['3'],
    title: 'Vegetable Fried Rice',
    imageUrl:
        'assets/VegetableFriedRice.jpeg',
    ingredients: [
      'Basmati Rice',
      'Carrot',
      'Beans',
      'Capsicum',
      'Mushrooms',
      'Spring Onion',
      'Soy Sauce',
      'Garlic',
    ],
    steps: [
      'Cook rice and allow it to cool.',
      'Heat oil in a wok.',
      'Stir fry garlic and vegetables.',
      'Add soy sauce and seasoning.',
      'Add rice and stir fry on high heat.',
    ],
    duration: 30,
    complexity: Complexity.simple,
    affordability: Affordability.affordable,
    isGlutenFree: false,
    isVegan: true,
    isVegetarian: true,
  ),

  MealsModel(
    id: 'm9',
    categories: ['3'],
    title: 'Veg Manchurian',
    imageUrl:
        'assets/manchurian.jpg',
    ingredients: [
      'Cabbage',
      'Carrot',
      'Capsicum',
      'Spring Onion',
      'Corn Flour',
      'Soy Sauce',
      'Chilli Sauce',
      'Garlic',
    ],
    steps: [
      'Mix chopped vegetables with flour.',
      'Make small vegetable balls.',
      'Deep fry until golden.',
      'Prepare Manchurian gravy.',
      'Add fried balls and serve hot.',
    ],
    duration: 45,
    complexity: Complexity.challenging,
    affordability: Affordability.affordable,
    isGlutenFree: false,
    isVegan: true,
    isVegetarian: true,
  ),

  // =========================
  // ITALIAN - CATEGORY 4
  // =========================

  MealsModel(
    id: 'm10',
    categories: ['4'],
    title: 'Margherita Pizza',
    imageUrl:
        'assets/pizza.jpeg',
    ingredients: [
      'Pizza Dough',
      'Tomato Sauce',
      'Mozzarella',
      'Basil',
      'Olive Oil',
      'Salt',
    ],
    steps: [
      'Prepare the pizza dough.',
      'Spread tomato sauce over the dough.',
      'Add mozzarella cheese.',
      'Bake until the crust is golden.',
      'Add fresh basil and serve.',
    ],
    duration: 40,
    complexity: Complexity.challenging,
    affordability: Affordability.pricy,
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: true,
  ),

  MealsModel(
    id: 'm11',
    categories: ['4'],
    title: 'Penne Arrabbiata',
    imageUrl:
        'assets/Arrabbiata.webp',
    ingredients: [
      'Penne Pasta',
      'Tomatoes',
      'Garlic',
      'Red Chilli Flakes',
      'Olive Oil',
      'Parsley',
      'Salt',
    ],
    steps: [
      'Boil penne pasta until al dente.',
      'Heat olive oil with garlic and chilli.',
      'Add tomatoes and cook the sauce.',
      'Add cooked pasta to the sauce.',
      'Mix well and garnish with parsley.',
    ],
    duration: 25,
    complexity: Complexity.simple,
    affordability: Affordability.affordable,
    isGlutenFree: false,
    isVegan: true,
    isVegetarian: true,
  ),

  MealsModel(
    id: 'm12',
    categories: ['4'],
    title: 'Vegetable Lasagna',
    imageUrl:
        'assets/lasagne.jpeg',
    ingredients: [
      'Lasagna Sheets',
      'Tomato Sauce',
      'Zucchini',
      'Spinach',
      'Cheese',
      'Bechamel Sauce',
    ],
    steps: [
      'Prepare the vegetable filling.',
      'Prepare tomato and bechamel sauce.',
      'Layer sauce, vegetables and lasagna sheets.',
      'Add cheese on top.',
      'Bake until golden and bubbling.',
    ],
    duration: 60,
    complexity: Complexity.challenging,
    affordability: Affordability.pricy,
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: true,
  ),

  // =========================
  // MEXICAN - CATEGORY 5
  // =========================

  MealsModel(
    id: 'm13',
    categories: ['5'],
    title: 'Vegetable Tacos',
    imageUrl:
        'assets/taco.jpeg',
    ingredients: [
      'Corn Tortillas',
      'Zucchini',
      'Capsicum',
      'Corn',
      'Black Beans',
      'Onion',
      'Coriander',
      'Lime',
    ],
    steps: [
      'Chop and season the vegetables.',
      'Grill the vegetables with black beans.',
      'Warm the corn tortillas.',
      'Fill tortillas with vegetables.',
      'Add lime and coriander before serving.',
    ],
    duration: 30,
    complexity: Complexity.simple,
    affordability: Affordability.affordable,
    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
  ),

  MealsModel(
    id: 'm14',
    categories: ['5'],
    title: 'Vegetable Burrito',
    imageUrl:
        'assets/burritos.jpeg',
    ingredients: [
      'Tortilla',
      'Rice',
      'Black Beans',
      'Avocado',
      'Lettuce',
      'Tomato',
      'Cheese',
      'Salsa',
    ],
    steps: [
      'Prepare rice and beans.',
      'Place tortilla on a flat surface.',
      'Add rice, beans and vegetables.',
      'Add salsa and cheese.',
      'Roll the tortilla tightly into a burrito.',
    ],
    duration: 30,
    complexity: Complexity.simple,
    affordability: Affordability.affordable,
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: true,
  ),

  MealsModel(
    id: 'm15',
    categories: ['5'],
    title: 'Loaded Nachos',
    imageUrl:
        'assets/nachos.jpeg',
    ingredients: [
      'Tortilla Chips',
      'Cheese',
      'Black Beans',
      'Tomato',
      'Jalapeno',
      'Coriander',
      'Sour Cream',
      'Chilli Powder',
    ],
    steps: [
      'Arrange tortilla chips on a baking tray.',
      'Add cheese and black beans.',
      'Add tomatoes and jalapenos.',
      'Bake until the cheese melts.',
      'Garnish with coriander and serve.',
    ],
    duration: 20,
    complexity: Complexity.simple,
    affordability: Affordability.affordable,
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: true,
  ),
];
