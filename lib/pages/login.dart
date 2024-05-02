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
    // Get the screen size
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFE9F0F5),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenSize.height * 0.05),
            Padding(
              padding: EdgeInsets.all(screenSize.width * 0.05),
              child: Container(
                padding: EdgeInsets.fromLTRB(
                    screenSize.width * 0.02,
                    screenSize.width * 0.02,
                    screenSize.width * 0.01,
                    screenSize.width * 0.02),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyButton(
                      onTap: null,
                      title: "Sign in",
                      width: screenSize.width * 0.4,
                      left: 0,
                      right: screenSize.width * 0.025,
                    ),
                    MyButton(
                      onTap: goToSignUp,
                      title: "Create account",
                      width: screenSize.width * 0.4,
                      left: screenSize.width * 0.025,
                      right: 0,
                      color: Colors.white,
                      textColor: const Color(0xFF4D8BAA),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: screenSize.height * 0.02,
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: screenSize.width * 0.05),
              child: Container(
                height: screenSize.width * 1.0,
                width: screenSize.width * 1.0,
                padding: EdgeInsets.all(screenSize.width * 0.025),
                decoration: BoxDecoration(
                  color: const Color(0xFF4D8BAA),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Image.asset(
                  'assets/images/test.png',
                ),
              ),
            ),
            SizedBox(height: screenSize.height * 0.02),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: screenSize.width * 0.05),
              child: Text(
                'Sign in',
                style: TextStyle(
                  color: const Color(0xFF4D8BAA),
                  fontSize: screenSize.width * 0.1,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: screenSize.height * 0.02),
            CustomTextField(
              controller: usernameController,
              hintText: 'Username',
              obscureText: false,
            ),
            SizedBox(height: screenSize.height * 0.02),
            CustomTextField(
              controller: passwordController,
              hintText: 'Password',
              obscureText: true,
            ),
            SizedBox(height: screenSize.height * 0.02),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: screenSize.width * 0.05),
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
            SizedBox(height: screenSize.height * 0.05),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: screenSize.width * 0.05),
              child: MyButton(
                onTap: () => signIn(context),
                title: "Sign in",
                width: screenSize.width * 0.425,
                left: 0,
                right: screenSize.width * 0.05,
                color: const Color(0xFF4D8BAA),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
