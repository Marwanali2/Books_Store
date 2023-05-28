import 'package:flutter/material.dart';
import 'package:my_bookly_app/core/utils/app_router.dart';
import 'package:my_bookly_app/features/auth/presentation/views/signup_screen.dart';
import 'package:my_bookly_app/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:my_bookly_app/features/auth/presentation/views/widgets/custom_text_form_field.dart';

import '../../../../core/widgets/custom_button.dart';
import '../../../home/presentation/views/home_view.dart';
import 'package:go_router/go_router.dart';
class LoginScreen extends StatelessWidget {
  static String id = 'LoginScreen';

  String? email;

  String? password;

  GlobalKey<FormState> formKey = GlobalKey();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(41, 68, 97, 1),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Form(
          key: formKey,
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
              ),
              // Image.asset("assets/images/scholar.png", height: 100),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Welcome To Bookly App',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                       ),
                  ),
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              const Row(
                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              CustomTextField(
                label: "Email",
                hintText: "enter your email",
                onChanged: (data) {
                  email = data;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                label: "Password",
                hintText: "enter your password",
                onChanged: (data) {
                  password = data;
                },
              ),
              const SizedBox(
                height: 25,
              ),
              CustomButtonn(
                text: "Login",
                onPressed: () async {
                  GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
                },
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "don\'t have an account?",
                    style: TextStyle(color: Colors.white),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, SignUpScreen.id);
                    },
                    child: const Text(
                      " Sign UP",
                      style: TextStyle(
                        color: Color(0xffC7EDE6),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
