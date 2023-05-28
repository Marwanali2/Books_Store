import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bookly_app/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:my_bookly_app/features/auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_bookly_app/features/auth/presentation/views/widgets/showSnackBar.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/widgets/custom_button.dart';
import '../managers/auth_cubit/auth_cubit.dart';
import '../managers/auth_cubit/auth_state.dart';
import 'login_screen.dart';
import '../../../../../core/utils/app_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// class SignUPScreen extends StatelessWidget {
//   const SignUPScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ,
//     );
//   }
// }

class SignUpScreen extends StatefulWidget {
  static String id = 'SignUPScreen';


  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _auth = FirebaseAuth.instance;

  String? email;

  String? password;

  GlobalKey<FormState> formKey = GlobalKey();

  // شرحها مكتوب في الون نوت
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is RegisterLoadingState) {
          isLoading = true;
        }
        else if (state is RegisterSuccessState) {
         // Navigator.pushNamed(context, LoginScreen.id, arguments: email);
          GoRouter.of(context).push(
            AppRouter.kLoginScreen,
            extra: email
          );
          showSnackBar(context, 'Signed-Up Successfully !',
              Colors.green);
          isLoading = false;
        }
        else if (state is RegisterFailureState) {
          showSnackBar(context, '${state.errorMessage}',
              Colors.red);
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
                //علشان احقق ال form validation بشوف  الويدجت اللي عايز اتحقق منها موجوده جوا مين يعني اعمل  wrap with widget form للويدجت اللي بتحتوي علي الويدجت اللي بتحقق منها و بحدد ال key الخاص بالform
                key: formKey,
                //ال key عبارة عن مفتاح بيبقي خاص لكل فورم يعني من خلال الkey ده اقدر اوصل لمحتوي الفورم بتاعتي
                child: ListView(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    // image
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
                          'Sign Up',
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
                      hintText: "Enter your email",
                      onChanged: (data) {
                        email = data;
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextField(
                      onChanged: (data) {
                        password = data;
                      },
                      label: "Password",
                      hintText: "Enter your password",
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    CustomButtonn(
                      text: "Sign Up",
                      //Navigator.pushReplacementNamed(context, LoginScreen.id);
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          BlocProvider.of<AuthCubit>(context).registerUser(
                              email: email!, password: password!);
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
                          "Already have an account?",
                          style: TextStyle(color: Colors.white),
                        ),
                        GestureDetector(
                          onTap: () {
                            GoRouter.of(context).pushReplacement(
                                AppRouter.kLoginScreen,
                            );
                          },
                          child: const Text(
                            "Login",
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
