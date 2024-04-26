import 'package:flutter/material.dart';
import '../components/button.dart';
import '../components/text_field.dart';
import '../services/auth_service.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key, this.goToLogin});

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final void Function()? goToLogin;

  void signUp(BuildContext context) {
    // Pass BuildContext as an argument
    final auth = AuthService();

    //password match -> create user
    //if (passwordController.text == _confirmPwController.text) {
    try {
      auth.signUpWithEmailPassword(
          emailController.text, passwordController.text);
    } catch (e) {
      showDialog(
        context: context, // Use the provided BuildContext
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ),
      );
    }
  }
  //password dont match -> show error to user
  // else {
  //   showDialog(
  //     context: context, // Use the provided BuildContext
  //     builder: (context) => const AlertDialog(
  //       title: Text("Password don't match!"),
  //     ),
  //   );
  // }
  //}

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
                    5, 10, 10, 10), // Adjusted padding
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyButton(
                      onTap: goToLogin,
                      title: "Sign in",
                      width: 160,
                      left: 0,
                      right: 5,
                      color: Colors.white,
                      textColor: const Color(0xFF4D8BAA),
                    ),
                    const MyButton(
                      onTap: null,
                      title: "Create account",
                      width: 160,
                      left: 5,
                      right: 0,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 100),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                'Create account',
                style: TextStyle(
                  color: Color(0xFF4D8BAA),
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 25),
            CustomTextField(
              controller: fullnameController,
              hintText: 'Fullname',
              obscureText: false,
            ),
            const SizedBox(height: 25),
            CustomTextField(
              controller: emailController,
              hintText: 'Email',
              obscureText: false,
            ),
            const SizedBox(height: 25),
            CustomTextField(
              controller: usernameController,
              hintText: 'Username',
              obscureText: false,
            ),
            const SizedBox(height: 25),
            CustomTextField(
              controller: passwordController,
              hintText: 'Password',
              obscureText: true,
            ),
            const SizedBox(height: 25),
            MyButton(
              onTap: () => signUp(context),
              title: "Create",
              width: 170,
              left: 0,
              right: 25,
              color: const Color(0xFF4D8BAA),
            )
          ],
        ),
      ),
    );
  }
}
