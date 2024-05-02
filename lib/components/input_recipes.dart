import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../models/recipe.dart';
import '../models/newsRecipe.dart';
import '../pages/recipes.dart';
import 'button.dart';
import 'text_field.dart';

class InputRecipes extends StatelessWidget {
  InputRecipes({super.key, this.createRecipe});

  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController detailController = TextEditingController();
  String? imagePath;
  final VoidCallback? createRecipe;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      // Do something with the picked image
      print('Picked image path: ${pickedImage.path}');
      imagePath = pickedImage.path;
    } else {
      print('No image selected');
    }
  }

  void _onBackPressed(BuildContext context) {
    Navigator.of(context).pop();
  }

  void _createRecipe(BuildContext context) {
    // Get values from controllers and image path
    final String description = descriptionController.text;
    final String detail = detailController.text;

    // Perform the creation of a new recipe here
    // Call the createRecipe() function if provided
    // if (createRecipe != null) {
    Recipe myRecipe = Recipe(
      description: description,
      imagePath:
          imagePath ?? '', // Default to empty string if imagePath is null
      detail: detail,
      name: '',
      dateCreate: DateTime.now(),
      favorites: false,
      author: '',
    );
    NewsRecipe newsRecipe = NewsRecipe();
    newsRecipe.addRecipe(myRecipe);

    // Pop until reaching the recipes page
    Navigator.of(context)
        .popUntil((route) => route.settings.name == '/recipes');
    print("Object created successfully");
    // } else {
    // print("createRecipe callback is null");
    // }
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
            const SizedBox(height: 100),
            Padding(
              padding: const EdgeInsets.all(25),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    "Create new recipe!",
                    style: TextStyle(
                      fontSize: 40,
                      color: Color(0xFF4D8BAA),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            CustomTextField(
              controller: descriptionController,
              hintText: 'Description',
              obscureText: false,
            ),
            const SizedBox(height: 20),
            CustomTextField(
              controller: detailController,
              hintText: 'Detail',
              obscureText: false,
            ),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: SizedBox(
                height: 200,
                child: GestureDetector(
                  onTap: _pickImage,
                  child: Container(
                    width: screenSize.width * 0.9,
                    height: screenSize.height * 0.2,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(Icons.add_a_photo),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                  child: MyButton(
                    onTap: () => _onBackPressed(context),
                    title: "Back",
                    width: 150,
                    left: 0,
                    right: screenSize.width * 0.05,
                    color: const Color(0xFF4D8BAA),
                  ),
                ),
                const SizedBox(width: 20),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                  child: MyButton(
                    onTap: () => _createRecipe(context),
                    title: "Create",
                    width: 150,
                    left: 0,
                    right: screenSize.width * 0.05,
                    color: const Color(0xFF4D8BAA),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
