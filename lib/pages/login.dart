import 'package:flutter/material.dart';
import '../components/button.dart';
import '../components/text_field.dart';
import '../services/auth_service.dart';

class Login extends StatelessWidget {
  Login({super.key, this.forgotPassword, this.goToSignUp});

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final void Function()? forgotPassword;
  final void Function()? goToSignUp;

  void signIn(BuildContext context) async {
    // Your login logic here
    final authService = AuthService();
    try {
      await authService.signInWithEmailPassword(
          usernameController.text, passwordController.text);
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9F0F5),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Container(
                padding: const EdgeInsets.fromLTRB(
                    10, 10, 5, 10), // Adjusted padding
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const MyButton(
                      onTap: null,
                      title: "Sign in",
                      width: 160,
                      left: 0,
                      right: 5,
                    ),
                    MyButton(
                      onTap: goToSignUp,
                      title: "Create account",
                      width: 160,
                      left: 5,
                      right: 0,
                      color: Colors.white,
                      textColor: const Color(0xFF4D8BAA),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                height: 350,
                width: 350,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFF4D8BAA),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Image.asset(
                  'lib/assets/images/test.png',
                  width: 100,
                  height: 100,
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                'Sign in',
                style: TextStyle(
                  color: Color(0xFF4D8BAA),
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            CustomTextField(
              controller: usernameController,
              hintText: 'Username',
              obscureText: false,
            ),
            const SizedBox(height: 10),
            CustomTextField(
              controller: passwordController,
              hintText: 'Password',
              obscureText: true,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: forgotPassword ?? () {},
                  child: Text(
                    "Forgot password",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25),
            MyButton(
              onTap: () => signIn(context),
              title: "Sign in",
              width: 170,
              left: 0,
              right: 25,
              color: const Color(0xFF4D8BAA),
            ),
          ],
        ),
      ),
    );
  }
}
