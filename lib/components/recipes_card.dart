import 'package:flutter/material.dart';
import 'package:app3/models/recipe.dart';

class RecipesCard extends StatelessWidget {
  final Recipe recipe;

  const RecipesCard({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: Container(
        width: 160,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 120,
              decoration: BoxDecoration(
                color: const Color(0xFF4D8BAA),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset(
                recipe.imagePath ?? 'placeholder_image_path.png',
                fit: BoxFit.cover, // Change fit to BoxFit.fill
              ),
            ),
            const SizedBox(height: 10),
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
