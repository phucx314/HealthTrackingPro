import 'package:flutter/material.dart';

import 'pages/login.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: true,
    home: Login(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(child: Scaffold()),
    );
  }
}
