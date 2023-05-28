import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:my_bookly_app/core/utils/app_router.dart';
import 'package:my_bookly_app/features/auth/presentation/views/signup_screen.dart';
import 'package:my_bookly_app/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:my_bookly_app/features/auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:my_bookly_app/features/auth/presentation/views/widgets/showSnackBar.dart';

import '../../../../core/widgets/custom_button.dart';
import '../../../home/presentation/views/home_view.dart';
import 'package:go_router/go_router.dart';

import '../managers/auth_cubit/auth_cubit.dart';
import '../managers/auth_cubit/auth_state.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;

  String? email;

  String? password;

  GlobalKey<FormState> formKey = GlobalKey();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is LoginLoadingState) {
            isLoading = true;
          } else if (state is LoginSuccessState) {
            // Navigator.pushReplacementNamed(context, AppRouter.kHomeView,
            //     arguments: email!);
            GoRouter.of(context).push(
                AppRouter.kHomeView,
                extra: email!
            );
            isLoading = false;
            showSnackBar(context, 'Welcome', Colors.green);
          } else if (state is LoginFailureState) {
            showSnackBar(context, '${state.errorMessage}', Colors.red);
            isLoading = false;
          }
        },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          opacity: 0,
          child: Scaffold(
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
                            fontSize: 25,
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
                      text: "Login",//GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          BlocProvider.of<AuthCubit>(context).logIn(email: email!, password: password!);
                        } else {}
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
                            // Navigator.pushReplacementNamed(
                            //     context, SignUpScreen.id,
                            // );
                            GoRouter.of(context).push(
                                AppRouter.kSignUpScreen,
                            );
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
          ),
        );
      },
    );
  }
}
