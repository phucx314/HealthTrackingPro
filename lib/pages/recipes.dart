import 'package:app3/components/appbar.dart';
import 'package:app3/models/newsRecipe.dart'; // Adjust import if needed
import 'package:app3/models/recipe.dart';
import 'package:app3/services/auth_service.dart';
import 'package:app3/services/firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../colors/color_set.dart';
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

  final FirestoreService firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: htaPrimaryColors.shade100,
        body: SafeArea(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(15, 25, 15, 25),
                child: MyAppBar(username: "Rosser"),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(0),
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
                                padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
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
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                MyButton(
                                  onTap: () {
                                    // Handle Discover button tap
                                  },
                                  title: "Discover",
                                  width: 150,
                                  left: 0,
                                  right: 25,
                                ),
                                MyButton(
                                  onTap: () {
                                    // Handle Favorites button tap
                                  },
                                  title: "Favorites",
                                  width: 150,
                                  left: 25,
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
                          spacing: 10, // Khoảng cách giữa các thẻ
                          runSpacing: 10, // Khoảng cách giữa các dòng
                          children: [
                            StreamBuilder<QuerySnapshot>(
                              stream: firestoreService.getRecipesStream(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  List<QueryDocumentSnapshot> recipesList =
                                      snapshot.data!.docs;

                                  return Wrap(
                                    spacing: 0,
                                    runSpacing: 10,
                                    children: recipesList.map((document) {
                                      Recipe recipe = Recipe(
                                        description: document['description'],
                                        imagePath: document['imagePath'],
                                        detail: document['detail'],
                                        name: document['name'],
                                        dateCreate:
                                            document['dateCreate'].toDate(),
                                        favorites: document['favorites'],
                                        author: document['author'],
                                      );

                                      return RecipesCard(recipe: recipe);
                                    }).toList(),
                                  );
                                } else {
                                  return const CircularProgressIndicator();
                                }
                              },
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                          child: Container(
                            alignment: Alignment.bottomRight,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment
                                  .end, // Đảm bảo các thành phần trong hàng được căn phải
                              children: [
                                MyButton(
                                  onTap: () {
                                    //su dung cai nay de den voi trang dang gap loi
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => InputRecipes(),
                                      ),
                                    );
                                    // su dung newsRecipe cai nay chi de tesst
                                    // newsRecipe
                                    //     .addRecipesToFirestore(newsRecipe.menu);
                                  },
                                  title: "New recipe",
                                  width: screenSize.width * 0.425,
                                  left: 0,
                                  right:
                                      0, // Đặt khoảng cách bên phải là 0 để nút nằm bên phải
                                  color: const Color(0xFF4D8BAA),
                                  borderRadius: 30,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
