import 'package:app3/models/plan.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/recipe.dart';

class FirestoreService {
  final CollectionReference recipes =
      FirebaseFirestore.instance.collection('recipes');

  Future<void> addRecipe(
      String id,
      String description,
      String imagePath,
      String detail,
      String name,
      DateTime dateCreate,
      bool favorites,
      String author) async {
    await recipes.add({
      'id': id,
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

  Future<Recipe> getRecipe(String id) async {
    try {
      DocumentSnapshot docSnapshot = await recipes.doc(id).get();

      if (docSnapshot.exists) {
        Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;

        Recipe recipe = Recipe(
          id: data['id'],
          description: data['description'],
          imagePath: data['imagePath'],
          detail: data['detail'],
          name: data['name'],
          dateCreate: (data['dateCreate'] as Timestamp).toDate(),
          favorites: data['favorites'],
          author: data['author'],
        );

        return recipe;
      } else {
        throw Exception('Recipe with ID $id not found');
      }
    } catch (error) {
      throw Exception('Error fetching recipe with ID $id: $error');
    }
  }

  Future<void> deleteRecipe(String id) async {
    QuerySnapshot querySnapshot =
        await recipes.where('id', isEqualTo: id).get();

    if (querySnapshot.docs.isNotEmpty) {
      querySnapshot.docs.forEach((doc) async {
        await doc.reference.delete();
      });
    } else {
      print('Recipe with ID $id not found');
    }
  }

  ///P L A N
  final CollectionReference plans =
      FirebaseFirestore.instance.collection('plans');

  Future<void> addPlan(
    String id,
    String description,
    String imagePath,
    String timeFund,
    String status,
    DateTime dateCreate,
  ) async {
    await plans.add({
      'id': id,
      'description': description,
      'imagePath': imagePath,
      'timeFund': timeFund,
      'status': status,
      'dateCreate': dateCreate,
    });
  }

  Stream<QuerySnapshot> getPlansStream() {
    final planStream =
        plans.orderBy('dateCreate', descending: true).snapshots();
    return planStream;
  }

  Future<void> deletePlan(String id) async {
    QuerySnapshot querySnapshot = await plans.where('id', isEqualTo: id).get();

    if (querySnapshot.docs.isNotEmpty) {
      querySnapshot.docs.forEach((doc) async {
        await doc.reference.delete();
      });
    } else {
      print('Plan with ID $id not found');
    }
  }

  Future<Plan> getPlan(String id) async {
    try {
      DocumentSnapshot docSnapshot = await plans.doc(id).get();

      if (docSnapshot.exists) {
        Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;

        Plan plan = Plan(
          id: data['id'],
          description: data['description'],
          imagePath: data['imagePath'],
          timeFund: data['timeFund'],
          status: data['status'],
          dateCreate: (data['dateCreate'] as Timestamp).toDate(),
        );

        return plan;
      } else {
        throw Exception('Recipe with ID $id not found');
      }
    } catch (error) {
      throw Exception('Error fetching recipe with ID $id: $error');
    }
  }
}
