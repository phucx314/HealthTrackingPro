import 'package:flutter/material.dart';
import 'package:app3/models/recipe.dart';

class RecipesCard extends StatelessWidget {
  final Recipe recipe;

  const RecipesCard({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
          20, 0, 2, 20), // Add bottom padding to create space between cards
      child: Container(
        width: 165, // Adjust the height of the card
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 120, // Adjust the height of the image container
              decoration: BoxDecoration(
                color: const Color(0xFF4D8BAA),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset(
                recipe.imagePath ?? 'placeholder_image_path.png',
                fit: BoxFit.cover, // Ensure the image fits within the container
              ),
            ),
            const SizedBox(
              height: 10,
            ), // Add space between image and text
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    recipe.description ?? 'No description available',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    recipe.detail ?? 'No detail available',
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
