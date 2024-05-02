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
                    screenSize.width * 0.005,
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
                      onTap: goToLogin,
                      title: "Sign in",
                      width: screenSize.width * 0.4,
                      left: 0,
                      right: screenSize.width * 0.025,
                      color: Colors.white,
                      textColor: const Color(0xFF4D8BAA),
                    ),
                    MyButton(
                      onTap: null,
                      title: "Create account",
                      width: screenSize.width * 0.4,
                      left: screenSize.width * 0.025,
                      right: 0,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: screenSize.height * 0.1),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: screenSize.width * 0.05),
              child: Text(
                'Create account',
                style: TextStyle(
                  color: const Color(0xFF4D8BAA),
                  fontSize: screenSize.width * 0.1,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: screenSize.height * 0.05),
            CustomTextField(
              controller: fullnameController,
              hintText: 'Fullname',
              obscureText: false,
            ),
            SizedBox(height: screenSize.height * 0.05),
            CustomTextField(
              controller: emailController,
              hintText: 'Email',
              obscureText: false,
            ),
            SizedBox(height: screenSize.height * 0.05),
            CustomTextField(
              controller: usernameController,
              hintText: 'Username',
              obscureText: false,
            ),
            SizedBox(height: screenSize.height * 0.05),
            CustomTextField(
              controller: passwordController,
              hintText: 'Password',
              obscureText: true,
            ),
            SizedBox(height: screenSize.height * 0.05),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: screenSize.width * 0.05),
              child: MyButton(
                onTap: () => signUp(context),
                title: "Create",
                width: screenSize.width * 0.425,
                left: 0,
                right: screenSize.width * 0.05,
                color: const Color(0xFF4D8BAA),
              ),
            )
          ],
        ),
      ),
    );
  }
}
