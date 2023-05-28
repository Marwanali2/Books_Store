import 'package:flutter/material.dart';
import 'package:my_bookly_app/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:my_bookly_app/features/auth/presentation/views/widgets/custom_text_form_field.dart';


import '../../../../core/widgets/custom_button.dart';
import 'login_screen.dart';



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

class SignUpScreen extends StatelessWidget {
  static String id = 'SignUPScreen';
  String? email;

  String? password;

  GlobalKey<FormState> formKey = GlobalKey(); // شرحها مكتوب في الون نوت

  bool isLoading = false;

  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, LoginScreen.id);
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
                              Navigator.pushReplacementNamed(context, LoginScreen.id);
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
            );
  }

}
