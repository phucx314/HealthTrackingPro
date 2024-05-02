import 'recipe.dart';

class NewsRecipe {
  final List<Recipe> _menu = [
    Recipe(
      description: "Gain weight faster",
      imagePath: "assets/test.png",
      detail: "Hearty morning delight with eggs, sausage, cheese, and veggies.",
      name: "Gain weight",
      dateCreate: DateTime.now(),
      favorites: true,
      author: "Dat",
    ),
    Recipe(
      description: "Gain weight faster",
      imagePath: "assets/test.png",
      detail: "Hearty morning delight with eggs, sausage, cheese, and veggies.",
      name: "Gain weight",
      dateCreate: DateTime.now(),
      favorites: true,
      author: "Dat",
    ),
    Recipe(
      description: "Gain weight faster",
      imagePath: "assets/test.png",
      detail: "Hearty morning delight with eggs, sausage, cheese, and veggies.",
      name: "Gain weight",
      dateCreate: DateTime.now(),
      favorites: true,
      author: "Dat",
    ),
  ];

  // GETTER
  List<Recipe> get menu => _menu;

  // Hàm thêm một công thức mới
  void addRecipe(Recipe newRecipe) {
    _menu.add(newRecipe);
  }

  // Hàm xóa một công thức khỏi danh sách dựa trên index
  void deleteRecipe(int index) {
    if (index >= 0 && index < _menu.length) {
      _menu.removeAt(index);
    }
  }
}
