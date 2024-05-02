import 'package:app3/models/newsRecipe.dart'; // Adjust import if needed
import 'package:app3/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../components/button.dart';
import '../components/input_recipes.dart';
import '../components/recipes_card.dart';

class RecipePage extends StatelessWidget {
  RecipePage({super.key, this.createNewRecipe});

  final void Function()? createNewRecipe;
  final NewsRecipe newsRecipe = NewsRecipe(); // Initialize NewsRecipe
  void openDashboard(BuildContext context) {
    final auth = AuthService();
    auth.signOut();
  }

  Widget buildIconButton(
      IconData icon, VoidCallback onPressed, String tooltip) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(icon),
      iconSize: 30,
      color: const Color(0xFF4D8BAA),
      padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
      tooltip: tooltip,
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFE9F0F5),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 80),
            Row(
              children: [
                buildIconButton(
                    Icons.menu, () => openDashboard(context), "Menu"),
                const SizedBox(width: 10),
                Container(
                  constraints: const BoxConstraints(maxWidth: 220),
                  height: 60,
                  width: 220,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: const Color(0xFF4D8BAA),
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      const Text(
                        "Hi, Rosser",
                        style: TextStyle(
                          color: Color(0xFF4D8BAA),
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                buildIconButton(Icons.notifications,
                    () => openDashboard(context), "Notifications"),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 25), // Adjust padding for the entire container
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.all(0), // Adjust padding for the row
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () => openDashboard(context),
                            icon: const Icon(Icons.info),
                            iconSize: 25,
                            color: const Color(0xFF4D8BAA),
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            "Recipes",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(
                          25, 0, 25, 0), // Adjust padding for the text
                      child: Text(
                        "Elevate your cooking game with our recipes function! Explore a variety of delicious dishes, perfect for any occasion. From simple meals to gourmet creations, discover endless culinary inspiration at your fingertips.",
                        style: TextStyle(
                          color: Color(0xFF4D8BAA),
                          fontSize: 13,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(screenSize.width * 0.05),
              child: Container(
                padding: EdgeInsets.fromLTRB(
                    screenSize.width * 0.02,
                    screenSize.width * 0.02,
                    screenSize.width * 0.01,
                    screenSize.width * 0.02),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyButton(
                      onTap: null,
                      title: "Discover",
                      width: screenSize.width * 0.4,
                      left: 0,
                      right: screenSize.width * 0.025,
                    ),
                    MyButton(
                      onTap: null,
                      title: "Favorites",
                      width: screenSize.width * 0.4,
                      left: screenSize.width * 0.025,
                      right: 0,
                      color: Colors.white,
                      textColor: const Color(0xFF4D8BAA),
                    ),
                  ],
                ),
              ),
            ),
            // Display RecipesCards from newsRecipe
            Wrap(
              spacing: 20,
              runSpacing: 20,
              children: newsRecipe.menu
                  .map((recipe) => RecipesCard(recipe: recipe))
                  .toList(),
            ),
            Container(
              alignment: Alignment.bottomRight,
              child: MyButton(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => InputRecipes(),
                    ),
                  );
                },
                title: "New recipe",
                width: screenSize.width * 0.425,
                left: 0,
                right: screenSize.width * 0.05,
                color: const Color(0xFF4D8BAA),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
