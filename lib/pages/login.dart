import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../components/button.dart';
import '../components/text_field.dart';

class Login extends StatelessWidget {
  Login({super.key, this.forgotPassword});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void signIn() {}
  void goToSignUp() {}
  void goToLogin() {}
  final void Function()? forgotPassword;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 1,
        child: Scaffold(
          backgroundColor: const Color(0xFFE9F0F5),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 100),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
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
                        MyButton(
                          onTap: goToSignUp,
                          title: "Create account",
                          width: 160,
                          left: 5,
                          right: 0,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Image.asset(
                  'assets/images/test.png', // Đường dẫn đến tệp ảnh của bạn
                  width: 30, // Kích thước của ảnh
                  height: 30,
                ),
                const SizedBox(height: 100),
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
                const SizedBox(
                  height: 25,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: forgotPassword ?? () {}, // Add null check
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
                  onTap: signIn,
                  title: "Sign in",
                  width: 170,
                  left: 0,
                  right: 25,
                  color: const Color(0xFF4D8BAA),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
