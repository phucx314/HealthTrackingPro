import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  // Collection reference
  final CollectionReference recipes =
      FirebaseFirestore.instance.collection('recipes');

  // Add a new note
  Future<void> addRecipe(String description, String imagePath, String detail,
      String name, DateTime dateCreate, bool favorites, String author) async {
    await recipes.add({
      'description': description,
      'imagePath': imagePath,
      'detail': detail,
      'name': name,
      'dateCreate': dateCreate,
      'favorites': favorites,
      'author': author,
    });
  }

  Stream<QuerySnapshot> getRecipesStream() {
    final recipesStream =
        recipes.orderBy('dateCreate', descending: true).snapshots();
    return recipesStream;
  }
}
