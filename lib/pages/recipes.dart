import "package:app3/services/auth_service.dart";
import "package:flutter/material.dart";

class RecipePage extends StatelessWidget {
  const RecipePage({super.key});

  void logout() {
    final auth = AuthService();
    auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: logout, icon: const Icon(Icons.logout))
        ],
      ),
    );
  }
}
